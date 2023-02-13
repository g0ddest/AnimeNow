// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cast_channel.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import Foundation
import SwiftProtobuf

// MARK: - _GeneratedWithProtocGenSwiftVersion

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
private struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
    typealias Version = _2
}

// MARK: - Extensions_Api_CastChannel_CastMessage

struct Extensions_Api_CastChannel_CastMessage: SwiftProtobuf.Message {
    static let protoMessageName: String = _protobuf_package + ".CastMessage"

    var protocolVersion: Extensions_Api_CastChannel_CastMessage.ProtocolVersion {
        get { _protocolVersion ?? .castv210 }
        set { _protocolVersion = newValue }
    }

    /// Returns true if `protocolVersion` has been explicitly set.
    var hasProtocolVersion: Bool { self._protocolVersion != nil }
    /// Clears the value of `protocolVersion`. Subsequent reads from it will return its default value.
    mutating func clearProtocolVersion() { _protocolVersion = nil }

    /// source and destination ids identify the origin and destination of the
    /// message.  They are used to route messages between endpoints that share a
    /// device-to-device channel.
    ///
    /// For messages between applications:
    ///   - The sender application id is a unique identifier generated on behalf of
    ///     the sender application.
    ///   - The receiver id is always the the session id for the application.
    ///
    /// For messages to or from the sender or receiver platform, the special ids
    /// 'sender-0' and 'receiver-0' can be used.
    ///
    /// For messages intended for all endpoints using a given channel, the
    /// wildcard destination_id '*' can be used.
    var sourceID: String {
        get { _sourceID ?? String() }
        set { _sourceID = newValue }
    }

    /// Returns true if `sourceID` has been explicitly set.
    var hasSourceID: Bool { self._sourceID != nil }
    /// Clears the value of `sourceID`. Subsequent reads from it will return its default value.
    mutating func clearSourceID() { _sourceID = nil }

    var destinationID: String {
        get { _destinationID ?? String() }
        set { _destinationID = newValue }
    }

    /// Returns true if `destinationID` has been explicitly set.
    var hasDestinationID: Bool { self._destinationID != nil }
    /// Clears the value of `destinationID`. Subsequent reads from it will return its default value.
    mutating func clearDestinationID() { _destinationID = nil }

    /// This is the core multiplexing key.  All messages are sent on a namespace
    /// and endpoints sharing a channel listen on one or more namespaces.  The
    /// namespace defines the protocol and semantics of the message.
    var namespace: String {
        get { _namespace ?? String() }
        set { _namespace = newValue }
    }

    /// Returns true if `namespace` has been explicitly set.
    var hasNamespace: Bool { self._namespace != nil }
    /// Clears the value of `namespace`. Subsequent reads from it will return its default value.
    mutating func clearNamespace() { _namespace = nil }

    var payloadType: Extensions_Api_CastChannel_CastMessage.PayloadType {
        get { _payloadType ?? .string }
        set { _payloadType = newValue }
    }

    /// Returns true if `payloadType` has been explicitly set.
    var hasPayloadType: Bool { self._payloadType != nil }
    /// Clears the value of `payloadType`. Subsequent reads from it will return its default value.
    mutating func clearPayloadType() { _payloadType = nil }

    /// Depending on payload_type, exactly one of the following optional fields
    /// will always be set.
    var payloadUtf8: String {
        get { _payloadUtf8 ?? String() }
        set { _payloadUtf8 = newValue }
    }

    /// Returns true if `payloadUtf8` has been explicitly set.
    var hasPayloadUtf8: Bool { self._payloadUtf8 != nil }
    /// Clears the value of `payloadUtf8`. Subsequent reads from it will return its default value.
    mutating func clearPayloadUtf8() { _payloadUtf8 = nil }

    var payloadBinary: Data {
        get { _payloadBinary ?? SwiftProtobuf.Internal.emptyData }
        set { _payloadBinary = newValue }
    }

    /// Returns true if `payloadBinary` has been explicitly set.
    var hasPayloadBinary: Bool { self._payloadBinary != nil }
    /// Clears the value of `payloadBinary`. Subsequent reads from it will return its default value.
    mutating func clearPayloadBinary() { _payloadBinary = nil }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    /// Always pass a version of the protocol for future compatibility
    /// requirements.
    enum ProtocolVersion: SwiftProtobuf.Enum {
        typealias RawValue = Int
        case castv210 // = 0

        init() {
            self = .castv210
        }

        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .castv210
            default: return nil
            }
        }

        var rawValue: Int {
            switch self {
            case .castv210: return 0
            }
        }
    }

    /// What type of data do we have in this message.
    enum PayloadType: SwiftProtobuf.Enum {
        typealias RawValue = Int
        case string // = 0
        case binary // = 1

        init() {
            self = .string
        }

        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .string
            case 1: self = .binary
            default: return nil
            }
        }

        var rawValue: Int {
            switch self {
            case .string: return 0
            case .binary: return 1
            }
        }
    }

    init() {}

    public var isInitialized: Bool {
        if self._protocolVersion == nil {
            return false
        }
        if self._sourceID == nil {
            return false
        }
        if self._destinationID == nil {
            return false
        }
        if self._namespace == nil {
            return false
        }
        if self._payloadType == nil {
            return false
        }
        return true
    }

    /// Used by the decoding initializers in the SwiftProtobuf library, not generally
    /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
    /// initializers are defined in the SwiftProtobuf library. See the Message and
    /// Message+*Additions` files.
    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularEnumField(value: &_protocolVersion)
            case 2: try decoder.decodeSingularStringField(value: &_sourceID)
            case 3: try decoder.decodeSingularStringField(value: &_destinationID)
            case 4: try decoder.decodeSingularStringField(value: &_namespace)
            case 5: try decoder.decodeSingularEnumField(value: &_payloadType)
            case 6: try decoder.decodeSingularStringField(value: &_payloadUtf8)
            case 7: try decoder.decodeSingularBytesField(value: &_payloadBinary)
            default: break
            }
        }
    }

    /// Used by the encoding methods of the SwiftProtobuf library, not generally
    /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
    /// other serializer methods are defined in the SwiftProtobuf library. See the
    /// `Message` and `Message+*Additions` files.
    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if let v = _protocolVersion {
            try visitor.visitSingularEnumField(value: v, fieldNumber: 1)
        }
        if let v = _sourceID {
            try visitor.visitSingularStringField(value: v, fieldNumber: 2)
        }
        if let v = _destinationID {
            try visitor.visitSingularStringField(value: v, fieldNumber: 3)
        }
        if let v = _namespace {
            try visitor.visitSingularStringField(value: v, fieldNumber: 4)
        }
        if let v = _payloadType {
            try visitor.visitSingularEnumField(value: v, fieldNumber: 5)
        }
        if let v = _payloadUtf8 {
            try visitor.visitSingularStringField(value: v, fieldNumber: 6)
        }
        if let v = _payloadBinary {
            try visitor.visitSingularBytesField(value: v, fieldNumber: 7)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    fileprivate var _protocolVersion: Extensions_Api_CastChannel_CastMessage.ProtocolVersion?
    fileprivate var _sourceID: String?
    fileprivate var _destinationID: String?
    fileprivate var _namespace: String?
    fileprivate var _payloadType: Extensions_Api_CastChannel_CastMessage.PayloadType?
    fileprivate var _payloadUtf8: String?
    fileprivate var _payloadBinary: Data?
}

// MARK: - Extensions_Api_CastChannel_AuthChallenge

/// Messages for authentication protocol between a sender and a receiver.
struct Extensions_Api_CastChannel_AuthChallenge: SwiftProtobuf.Message {
    static let protoMessageName: String = _protobuf_package + ".AuthChallenge"

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    /// Used by the decoding initializers in the SwiftProtobuf library, not generally
    /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
    /// initializers are defined in the SwiftProtobuf library. See the Message and
    /// Message+*Additions` files.
    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let _ = try decoder.nextFieldNumber() {}
    }

    /// Used by the encoding methods of the SwiftProtobuf library, not generally
    /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
    /// other serializer methods are defined in the SwiftProtobuf library. See the
    /// `Message` and `Message+*Additions` files.
    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        try unknownFields.traverse(visitor: &visitor)
    }
}

// MARK: - Extensions_Api_CastChannel_AuthResponse

struct Extensions_Api_CastChannel_AuthResponse: SwiftProtobuf.Message {
    static let protoMessageName: String = _protobuf_package + ".AuthResponse"

    var signature: Data {
        get { _signature ?? SwiftProtobuf.Internal.emptyData }
        set { _signature = newValue }
    }

    /// Returns true if `signature` has been explicitly set.
    var hasSignature: Bool { self._signature != nil }
    /// Clears the value of `signature`. Subsequent reads from it will return its default value.
    mutating func clearSignature() { _signature = nil }

    var clientAuthCertificate: Data {
        get { _clientAuthCertificate ?? SwiftProtobuf.Internal.emptyData }
        set { _clientAuthCertificate = newValue }
    }

    /// Returns true if `clientAuthCertificate` has been explicitly set.
    var hasClientAuthCertificate: Bool { self._clientAuthCertificate != nil }
    /// Clears the value of `clientAuthCertificate`. Subsequent reads from it will return its default value.
    mutating func clearClientAuthCertificate() { _clientAuthCertificate = nil }

    var clientCa: [Data] = []

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    public var isInitialized: Bool {
        if self._signature == nil {
            return false
        }
        if self._clientAuthCertificate == nil {
            return false
        }
        return true
    }

    /// Used by the decoding initializers in the SwiftProtobuf library, not generally
    /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
    /// initializers are defined in the SwiftProtobuf library. See the Message and
    /// Message+*Additions` files.
    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularBytesField(value: &_signature)
            case 2: try decoder.decodeSingularBytesField(value: &_clientAuthCertificate)
            case 3: try decoder.decodeRepeatedBytesField(value: &clientCa)
            default: break
            }
        }
    }

    /// Used by the encoding methods of the SwiftProtobuf library, not generally
    /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
    /// other serializer methods are defined in the SwiftProtobuf library. See the
    /// `Message` and `Message+*Additions` files.
    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if let v = _signature {
            try visitor.visitSingularBytesField(value: v, fieldNumber: 1)
        }
        if let v = _clientAuthCertificate {
            try visitor.visitSingularBytesField(value: v, fieldNumber: 2)
        }
        if !clientCa.isEmpty {
            try visitor.visitRepeatedBytesField(value: clientCa, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    fileprivate var _signature: Data?
    fileprivate var _clientAuthCertificate: Data?
}

// MARK: - Extensions_Api_CastChannel_AuthError

struct Extensions_Api_CastChannel_AuthError: SwiftProtobuf.Message {
    static let protoMessageName: String = _protobuf_package + ".AuthError"

    var errorType: Extensions_Api_CastChannel_AuthError.ErrorType {
        get { _errorType ?? .internalError }
        set { _errorType = newValue }
    }

    /// Returns true if `errorType` has been explicitly set.
    var hasErrorType: Bool { self._errorType != nil }
    /// Clears the value of `errorType`. Subsequent reads from it will return its default value.
    mutating func clearErrorType() { _errorType = nil }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum ErrorType: SwiftProtobuf.Enum {
        typealias RawValue = Int
        case internalError // = 0

        /// The underlying connection is not TLS
        case noTls // = 1

        init() {
            self = .internalError
        }

        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .internalError
            case 1: self = .noTls
            default: return nil
            }
        }

        var rawValue: Int {
            switch self {
            case .internalError: return 0
            case .noTls: return 1
            }
        }
    }

    init() {}

    public var isInitialized: Bool {
        if self._errorType == nil {
            return false
        }
        return true
    }

    /// Used by the decoding initializers in the SwiftProtobuf library, not generally
    /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
    /// initializers are defined in the SwiftProtobuf library. See the Message and
    /// Message+*Additions` files.
    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularEnumField(value: &_errorType)
            default: break
            }
        }
    }

    /// Used by the encoding methods of the SwiftProtobuf library, not generally
    /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
    /// other serializer methods are defined in the SwiftProtobuf library. See the
    /// `Message` and `Message+*Additions` files.
    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if let v = _errorType {
            try visitor.visitSingularEnumField(value: v, fieldNumber: 1)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    fileprivate var _errorType: Extensions_Api_CastChannel_AuthError.ErrorType?
}

// MARK: - Extensions_Api_CastChannel_DeviceAuthMessage

struct Extensions_Api_CastChannel_DeviceAuthMessage: SwiftProtobuf.Message {
    static let protoMessageName: String = _protobuf_package + ".DeviceAuthMessage"

    /// Request fields
    var challenge: Extensions_Api_CastChannel_AuthChallenge {
        get { _storage._challenge ?? Extensions_Api_CastChannel_AuthChallenge() }
        set { _uniqueStorage()._challenge = newValue }
    }

    /// Returns true if `challenge` has been explicitly set.
    var hasChallenge: Bool { _storage._challenge != nil }
    /// Clears the value of `challenge`. Subsequent reads from it will return its default value.
    mutating func clearChallenge() { _storage._challenge = nil }

    /// Response fields
    var response: Extensions_Api_CastChannel_AuthResponse {
        get { _storage._response ?? Extensions_Api_CastChannel_AuthResponse() }
        set { _uniqueStorage()._response = newValue }
    }

    /// Returns true if `response` has been explicitly set.
    var hasResponse: Bool { _storage._response != nil }
    /// Clears the value of `response`. Subsequent reads from it will return its default value.
    mutating func clearResponse() { _storage._response = nil }

    var error: Extensions_Api_CastChannel_AuthError {
        get { _storage._error ?? Extensions_Api_CastChannel_AuthError() }
        set { _uniqueStorage()._error = newValue }
    }

    /// Returns true if `error` has been explicitly set.
    var hasError: Bool { _storage._error != nil }
    /// Clears the value of `error`. Subsequent reads from it will return its default value.
    mutating func clearError() { _storage._error = nil }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    public var isInitialized: Bool {
        withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._response, !v.isInitialized {
                return false
            }
            if let v = _storage._error, !v.isInitialized {
                return false
            }
            return true
        }
    }

    /// Used by the decoding initializers in the SwiftProtobuf library, not generally
    /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
    /// initializers are defined in the SwiftProtobuf library. See the Message and
    /// Message+*Additions` files.
    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularMessageField(value: &_storage._challenge)
                case 2: try decoder.decodeSingularMessageField(value: &_storage._response)
                case 3: try decoder.decodeSingularMessageField(value: &_storage._error)
                default: break
                }
            }
        }
    }

    /// Used by the encoding methods of the SwiftProtobuf library, not generally
    /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
    /// other serializer methods are defined in the SwiftProtobuf library. See the
    /// `Message` and `Message+*Additions` files.
    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if let v = _storage._challenge {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
            }
            if let v = _storage._response {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
            }
            if let v = _storage._error {
                try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
            }
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "extensions.api.cast_channel"

// MARK: - Extensions_Api_CastChannel_CastMessage + SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Extensions_Api_CastChannel_CastMessage: SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "protocol_version"),
        2: .standard(proto: "source_id"),
        3: .standard(proto: "destination_id"),
        4: .same(proto: "namespace"),
        5: .standard(proto: "payload_type"),
        6: .standard(proto: "payload_utf8"),
        7: .standard(proto: "payload_binary")
    ]

    func _protobuf_generated_isEqualTo(other: Extensions_Api_CastChannel_CastMessage) -> Bool {
        if _protocolVersion != other._protocolVersion {
            return false
        }
        if _sourceID != other._sourceID {
            return false
        }
        if _destinationID != other._destinationID {
            return false
        }
        if _namespace != other._namespace {
            return false
        }
        if _payloadType != other._payloadType {
            return false
        }
        if _payloadUtf8 != other._payloadUtf8 {
            return false
        }
        if _payloadBinary != other._payloadBinary {
            return false
        }
        if unknownFields != other.unknownFields {
            return false
        }
        return true
    }
}

// MARK: - Extensions_Api_CastChannel_CastMessage.ProtocolVersion + SwiftProtobuf._ProtoNameProviding

extension Extensions_Api_CastChannel_CastMessage.ProtocolVersion: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "CASTV2_1_0")
    ]
}

// MARK: - Extensions_Api_CastChannel_CastMessage.PayloadType + SwiftProtobuf._ProtoNameProviding

extension Extensions_Api_CastChannel_CastMessage.PayloadType: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "STRING"),
        1: .same(proto: "BINARY")
    ]
}

// MARK: - Extensions_Api_CastChannel_AuthChallenge + SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Extensions_Api_CastChannel_AuthChallenge: SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap = SwiftProtobuf._NameMap()

    func _protobuf_generated_isEqualTo(other: Extensions_Api_CastChannel_AuthChallenge) -> Bool {
        if unknownFields != other.unknownFields {
            return false
        }
        return true
    }
}

// MARK: - Extensions_Api_CastChannel_AuthResponse + SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Extensions_Api_CastChannel_AuthResponse: SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "signature"),
        2: .standard(proto: "client_auth_certificate"),
        3: .standard(proto: "client_ca")
    ]

    func _protobuf_generated_isEqualTo(other: Extensions_Api_CastChannel_AuthResponse) -> Bool {
        if _signature != other._signature {
            return false
        }
        if _clientAuthCertificate != other._clientAuthCertificate {
            return false
        }
        if clientCa != other.clientCa {
            return false
        }
        if unknownFields != other.unknownFields {
            return false
        }
        return true
    }
}

// MARK: - Extensions_Api_CastChannel_AuthError + SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Extensions_Api_CastChannel_AuthError: SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "error_type")
    ]

    func _protobuf_generated_isEqualTo(other: Extensions_Api_CastChannel_AuthError) -> Bool {
        if _errorType != other._errorType {
            return false
        }
        if unknownFields != other.unknownFields {
            return false
        }
        return true
    }
}

// MARK: - Extensions_Api_CastChannel_AuthError.ErrorType + SwiftProtobuf._ProtoNameProviding

extension Extensions_Api_CastChannel_AuthError.ErrorType: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "INTERNAL_ERROR"),
        1: .same(proto: "NO_TLS")
    ]
}

// MARK: - Extensions_Api_CastChannel_DeviceAuthMessage + SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Extensions_Api_CastChannel_DeviceAuthMessage: SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "challenge"),
        2: .same(proto: "response"),
        3: .same(proto: "error")
    ]

    fileprivate class _StorageClass {
        var _challenge: Extensions_Api_CastChannel_AuthChallenge?
        var _response: Extensions_Api_CastChannel_AuthResponse?
        var _error: Extensions_Api_CastChannel_AuthError?

        static let defaultInstance = _StorageClass()

        private init() {}

        init(copying source: _StorageClass) {
            self._challenge = source._challenge
            self._response = source._response
            self._error = source._error
        }
    }

    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }

    func _protobuf_generated_isEqualTo(other: Extensions_Api_CastChannel_DeviceAuthMessage) -> Bool {
        if _storage !== other._storage {
            let storagesAreEqual: Bool =
                withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
                    let _storage = _args.0
                    let other_storage = _args.1
                    if _storage._challenge != other_storage._challenge {
                        return false
                    }
                    if _storage._response != other_storage._response {
                        return false
                    }
                    if _storage._error != other_storage._error {
                        return false
                    }
                    return true
                }
            if !storagesAreEqual {
                return false
            }
        }
        if unknownFields != other.unknownFields {
            return false
        }
        return true
    }
}
