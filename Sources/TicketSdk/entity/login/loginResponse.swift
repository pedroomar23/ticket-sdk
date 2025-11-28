import Foundation 
public struct LoginResponse: Decodable, Hashable, Encodable, Sendable {
    public let access_token: String 
    public let refresh_token: String 
    public let scope: String? 
    public let id_token: String 
    public let expires_in: Int 
    public let info: [String]

    enum CodingKeys: String, CodingKey {
        case access_token = "access_token"
        case refresh_token = "refresh_token"
        case scope = "scope"
        case id_token = "id_token"
        case expires_in = "expires_in"
        case info = "info"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.access_token = try container.decode(String.self, forKey: .access_token)
        self.refresh_token = try container.decode(String.self, forKey: .refresh_token)
        self.scope = try container.decodeIfPresent(String.self, forKey: .scope)
        self.id_token = try container.decode(String.self, forKey: .id_token)
        self.expires_in = try container.decode(Int.self, forKey: .expires_in)
        self.info = try container.decode([String].self, forKey: .info)
    }

    public init(access_token: String, refresh_token: String, scope: String?, id_token: String, expires_in: Int, info: [String]) {
        self.access_token = access_token
        self.refresh_token = refresh_token
        self.scope = scope
        self.id_token = id_token
        self.expires_in = expires_in
        self.info = info
    }
}