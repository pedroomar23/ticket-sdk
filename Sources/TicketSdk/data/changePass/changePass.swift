import Foundation 

public struct ChangePassRequest: Decodable, Hashable, Encodable, Sendable {
    public let email: String 

    enum CodingKeys: String, CodingKey {
        case email 
    }
}

public struct ChangePassResponse: Decodable, Hashable, Encodable, Sendable {
    public let success: Bool 
    public let message: String 

    enum CodingKeys: String, CodingKey {
        case success
        case message 
    }
}