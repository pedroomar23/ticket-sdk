import Foundation 

// MARK: - ChangePass Request 
public struct ChangePassRequest: Decodable, Hashable, Encodable, Sendable {
    public var email: String 

    enum CodingKeys: String, CodingKey {
        case email 
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
    }

    public init(email: String) {
        self.email = email
    }
}

// MARK: - ChangePass Response 
public struct ChangePassResponse: Decodable, Hashable, Encodable, Sendable {
    public let success: Bool 
    public let message: String 

    enum CodingKeys: String, CodingKey {
        case success
        case message 
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.message = try container.decode(String.self, forKey: .message)
    }

    public init(success: Bool, message: String) {
        self.success = success
        self.message = message
    }
}