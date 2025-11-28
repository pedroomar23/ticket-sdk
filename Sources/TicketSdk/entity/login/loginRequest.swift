import Foundation

public struct LoginModel: Decodable, Hashable, Encodable, Sendable {
    public var username: String 
    public var password: String 
    public var pass: String 
    public var scope: String 
    public var grand_type: String 

    enum CodingKeys: String, CodingKey {
        case username, password, pass 
        case scope 
        case grand_type 
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.pass = try container.decode(String.self, forKey: .pass)
        self.scope = try container.decode(String.self, forKey: .scope)
        self.grand_type = try container.decode(String.self, forKey: .grand_type)
    }

    public init(username: String, password: String, pass: String, scope: String, grand_type: String) {
        self.username = username
        self.password = password
        self.pass = pass
        self.scope = scope
        self.grand_type = grand_type
    }
}