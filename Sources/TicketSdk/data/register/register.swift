import Foundation

public struct RegisterRequest: Decodable, Hashable, Encodable, Sendable {
    public let mail: String 
    public let dni: String 
    public let name: String 
    public let lastname: String 
    public let password: String 
    public let username: String 
    public let uid: String 
    public let aplication: String 

    enum CodingKeys: String, CodingKey {
        case mail = "mail"
        case dni = "dni"
        case name = "name"
        case lastname = "lastname"
        case password = "password"
        case username = "username"
        case uid = "uid"
        case aplication = "aplication"
    }
}

public struct RegisterResponse: Decodable, Hashable, Encodable, Sendable {
    public let success: Bool 
    public let message: String 

    enum CodingKeys: String, CodingKey {
        case success 
        case message 
    }
}