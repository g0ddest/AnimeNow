//
//  RepositoryClient+Live.swift
//  Anime Now! (iOS)
//
//  Created by ErrorErrorError on 9/3/22.
//

import Foundation
import ComposableArchitecture
import CoreData
import Combine

class RepositoryClientLive: RepositoryClient {
    static let shared = RepositoryClientLive()

    let persistenceContainer = Persistence.shared.persistentContainer

    private init() {}

    func insert<T>(_ item: T) -> Effect<T, Error> where T : DomainModelConvertible {
        .future { [unowned self] callback in
            let context = persistenceContainer.newBackgroundContext()

            context.perform {
                let managedObject = item.asManagedObject(in: context)
                do {
                    context.insert(managedObject)
                    try context.save()
                    callback(.success(managedObject.asDomain))
                } catch {
                    let nserror = error as NSError
                    callback(.failure(error))
                    print("Unresolved error \(nserror)")
                }
            }
        }
    }

    func update<T>(_ item: T) -> Effect<T, Error> where T : DomainModelConvertible {
        .future { [unowned self] callback in
            if let objectIdURL = item.objectURL {
                let context = persistenceContainer.newBackgroundContext()

                context.perform {
                    guard let managedObjectId = context.persistentStoreCoordinator?.managedObjectID(
                        forURIRepresentation: objectIdURL
                    ) else {
                        return
                    }
                    let managedObject = context.object(with: managedObjectId)

                    guard let managedObject = managedObject as? T.ManagedObject else {
                        return
                    }

                    managedObject.update(from: item)
                    do {
                        try context.save()
                        callback(.success(managedObject.asDomain))
                    } catch {
                        let nserror = error as NSError
                        print("Unresolved error \(nserror)")
                        callback(.failure(error))
                    }
                }
            } else {
                callback(.failure(NSError.init(domain: "Failed to update item. Item has no objectURL.", code: 0)))
            }
        }
    }

    func insertOrUpdate<T>(_ item: T) -> Effect<T, Error> where T : DomainModelConvertible {
        if item.objectURL != nil {
            return update(item)
        } else {
            return insert(item)
        }
    }

    func delete<T>(_ item: T) -> Effect<Void, Error> where T : DomainModelConvertible {
        .future { [unowned self] callback in
            if let objectIdURL = item.objectURL {
                let context = persistenceContainer.newBackgroundContext()

                context.perform {
                    guard let managedObjectId = context.persistentStoreCoordinator?.managedObjectID(
                        forURIRepresentation: objectIdURL)
                    else {
                        return
                    }
                    let managedObject = context.object(with: managedObjectId)
                    context.delete(managedObject)
                    do {
                        try context.save()
                        callback(.success(()))
                    } catch {
                        let nserror = error as NSError
                        print("Unresolved error \(nserror)")
                        callback(.failure(error))
                    }
                }
            }
        }
    }
    
    func fetch<T>(_ predicate: NSPredicate?, _ sort: [NSSortDescriptor]) -> Effect<[T], Error> where T : DomainModelConvertible {
        .future { [unowned self] callback in
            let fetchRequest: NSFetchRequest<T.ManagedObject> = T.ManagedObject.getFetchRequest()
            fetchRequest.sortDescriptors = sort
            fetchRequest.predicate = predicate

            let context = persistenceContainer.newBackgroundContext()

            context.perform {
                do {
                    let data = try context.fetch(fetchRequest).map(\.asDomain)
                    callback(.success(data))
                } catch {
                    print("Error: \(error)")
                    callback(.failure(error))
                }
            }
        }
    }

    func observe<T>(
        _ predicate: NSPredicate?,
        _ sort: [NSSortDescriptor],
        _ notifyChildChanges: Bool
    ) -> Effect<[T], Never> where T : DomainModelConvertible {
        let fetchRequest: NSFetchRequest<T.ManagedObject> = T.ManagedObject.getFetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sort

        let context = persistenceContainer.newBackgroundContext()
        context.automaticallyMergesChangesFromParent = true

        guard !notifyChildChanges else {
            return Publishers.Merge(
                Just((try? context.fetch(fetchRequest).map(\.asDomain)) ?? []),
                NotificationCenter.default.publisher(for: .NSManagedObjectContextObjectsDidChange)
                    .map { _ -> [T] in
                        (try? context.fetch(fetchRequest).map(\.asDomain)) ?? []
                    }
            )
            .eraseToEffect()
        }

        return .run { subscriber in

            let frc = NSFetchedResultsController(
                fetchRequest: fetchRequest,
                managedObjectContext: context,
                sectionNameKeyPath: nil,
                cacheName: nil
            )

            let delegate = FetchedResultsControllerDelegate<T>(subscriber)

            frc.delegate = delegate

            if let fetchRequest = frc as? NSFetchedResultsController<NSFetchRequestResult> {
                delegate.controllerDidChangeContent(fetchRequest)

            }

            return AnyCancellable {
                subscriber.send(completion: .finished)
                frc.delegate = nil
                _ = delegate
            }
        }
    }
}

private class FetchedResultsControllerDelegate<T: DomainModelConvertible>: NSObject, NSFetchedResultsControllerDelegate {
    let subscriber: Effect<[T], Never>.Subscriber

    init(_ subscriber: Effect<[T], Never>.Subscriber) {
        self.subscriber = subscriber
        super.init()
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        controller.managedObjectContext.perform { [unowned self] in
            if controller.fetchedObjects == nil {
                do {
                    try controller.performFetch()
                } catch {
                    print("There was an error fetching \(String(describing: T.ManagedObject.self)).")
                    subscriber.send([])
                }
            }

            let items = controller.fetchedObjects as? [T.ManagedObject] ?? []

            self.subscriber.send(items.map(\.asDomain))
        }
    }
}
