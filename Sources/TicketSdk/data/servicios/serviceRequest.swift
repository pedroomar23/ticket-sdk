import Foundation

public struct ServiceRequest: Decodable, Hashable, Encodable, Sendable {
    public let page: Int
    public let province_id: String
    public let municipality_id: String
    public let service_or_prov: String
    public let find_by_dpa: String?
    public let orderBy: String?
    public let rating: String?
    public let limit: Int
    public let serviceName: String
    public let reservation_date_ini: String?
    public let reservation_date_end: String?
    public let professional_name: String
    public let currency_values: [String]
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case province_id = "province_id"
        case municipality_id = "municipality_id"
        case service_or_prov = "service_or_prov"
        case find_by_dpa = "find_by_dpa"
        case orderBy = "orderBy"
        case rating = "rating"
        case limit = "limit"
        case serviceName = "serviceName"
        case reservation_date_ini = "reservation_date_ini"
        case reservation_date_end = "reservation_date_end"
        case professional_name = "professional_name"
        case currency_values = "currency_values"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.province_id = try container.decode(String.self, forKey: .province_id)
        self.municipality_id = try container.decode(String.self, forKey: .municipality_id)
        self.service_or_prov = try container.decode(String.self, forKey: .service_or_prov)
        self.find_by_dpa = try container.decodeIfPresent(String.self, forKey: .find_by_dpa)
        self.orderBy = try container.decodeIfPresent(String.self, forKey: .orderBy)
        self.rating = try container.decodeIfPresent(String.self, forKey: .rating)
        self.limit = try container.decode(Int.self, forKey: .limit)
        self.serviceName = try container.decode(String.self, forKey: .serviceName)
        self.reservation_date_ini = try container.decodeIfPresent(String.self, forKey: .reservation_date_ini)
        self.reservation_date_end = try container.decodeIfPresent(String.self, forKey: .reservation_date_end)
        self.professional_name = try container.decode(String.self, forKey: .professional_name)
        self.currency_values = try container.decode([String].self, forKey: .currency_values)
    }
    
    public init(page: Int, province_id: String, municipality_id: String, service_or_prov: String, find_by_dpa: String?, orderBy: String?, rating: String?, limit: Int, serviceName: String, reservation_date_ini: String?, reservation_date_end: String?, professional_name: String, currency_values: [String]) {
        self.page = page
        self.province_id = province_id
        self.municipality_id = municipality_id
        self.service_or_prov = service_or_prov
        self.find_by_dpa = find_by_dpa
        self.orderBy = orderBy
        self.rating = rating
        self.limit = limit
        self.serviceName = serviceName
        self.reservation_date_ini = reservation_date_ini
        self.reservation_date_end = reservation_date_end
        self.professional_name = professional_name
        self.currency_values = currency_values
    }
}