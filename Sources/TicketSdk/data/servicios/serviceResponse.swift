import Foundation

public struct ServiciosResponse: Decodable, Hashable, Encodable, Sendable {
    public let data: [DataResp]
    public let meta: MetaResp
    public let status: Int
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case meta = "meta"
        case status = "status"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([DataResp].self, forKey: .data)
        self.meta = try container.decode(MetaResp.self, forKey: .meta)
        self.status = try container.decode(Int.self, forKey: .status)
    }
    
    public init(data: [DataResp], meta: MetaResp, status: Int) {
        self.data = data
        self.meta = meta
        self.status = status
    }
}

public struct DataResp: Decodable, Hashable, Encodable, Sendable {
    public let id: Int
    public let nombre: String
    public let subcategorias_actividades: [SubcategoriasAct]
    public let establishment: String
    public let municipio: String
    public let provincia: String
    public let precio: Int
    public let currency: String?
    public let rating: Double
    public let default_quantity: Int
    public let max_quantity: Int
    public let visibilidad_aplicacion: Int
    public let disponibilidades: Int
    public let admite_sala_espera_virtual: Int
    public let hasprovider: Int
    public let tiene_validacion: Int
    public let image_url: String
    public let entrega_domicilio: Int
    public let views: Int
    public let tipo_servicio: [String]
    public let is_favorite: Bool
    public let has_reservation: Bool
    public let has_waiting_room: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nombre = "nombre"
        case subcategorias_actividades = "subcategorias_actividades"
        case establishment = "establishment"
        case municipio = "municipio"
        case provincia = "provincia"
        case precio = "precio"
        case currency = "currency"
        case rating = "rating"
        case default_quantity = "default_quantity"
        case max_quantity = "max_quantity"
        case visibilidad_aplicacion = "visibilidad_aplicacion"
        case disponibilidades = "disponibilidades"
        case admite_sala_espera_virtual = "admite_sala_espera_virtual"
        case hasprovider = "hasprovider"
        case tiene_validacion = "tiene_validacion"
        case image_url = "image_url"
        case entrega_domicilio = "entrega_domicilio"
        case views = "views"
        case tipo_servicio = "tipo_servicio"
        case is_favorite = "is_favorite"
        case has_reservation = "has_reservation"
        case has_waiting_room = "has_waiting_room"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.nombre = try container.decode(String.self, forKey: .nombre)
        self.subcategorias_actividades = try container.decode([SubcategoriasAct].self, forKey: .subcategorias_actividades)
        self.establishment = try container.decode(String.self, forKey: .establishment)
        self.municipio = try container.decode(String.self, forKey: .municipio)
        self.provincia = try container.decode(String.self, forKey: .provincia)
        self.precio = try container.decode(Int.self, forKey: .precio)
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
        self.rating = try container.decode(Double.self, forKey: .rating)
        self.default_quantity = try container.decode(Int.self, forKey: .default_quantity)
        self.max_quantity = try container.decode(Int.self, forKey: .max_quantity)
        self.visibilidad_aplicacion = try container.decode(Int.self, forKey: .visibilidad_aplicacion)
        self.disponibilidades = try container.decode(Int.self, forKey: .disponibilidades)
        self.admite_sala_espera_virtual = try container.decode(Int.self, forKey: .admite_sala_espera_virtual)
        self.hasprovider = try container.decode(Int.self, forKey: .hasprovider)
        self.tiene_validacion = try container.decode(Int.self, forKey: .tiene_validacion)
        self.image_url = try container.decode(String.self, forKey: .image_url)
        self.entrega_domicilio = try container.decode(Int.self, forKey: .entrega_domicilio)
        self.views = try container.decode(Int.self, forKey: .views)
        self.tipo_servicio = try container.decode([String].self, forKey: .tipo_servicio)
        self.is_favorite = try container.decode(Bool.self, forKey: .is_favorite)
        self.has_reservation = try container.decode(Bool.self, forKey: .has_reservation)
        self.has_waiting_room = try container.decode(Bool.self, forKey: .has_waiting_room)
    }
    
    public init(id: Int, nombre: String, subcategorias_actividades: [SubcategoriasAct], establishment: String, municipio: String, provincia: String, precio: Int, currency: String?, rating: Double, default_quantity: Int, max_quantity: Int, visibilidad_aplicacion: Int, disponibilidades: Int, admite_sala_espera_virtual: Int, hasprovider: Int, tiene_validacion: Int, image_url: String, entrega_domicilio: Int, views: Int, tipo_servicio: [String], is_favorite: Bool, has_reservation: Bool, has_waiting_room: Bool) {
        self.id = id
        self.nombre = nombre
        self.subcategorias_actividades = subcategorias_actividades
        self.establishment = establishment
        self.municipio = municipio
        self.provincia = provincia
        self.precio = precio
        self.currency = currency
        self.rating = rating
        self.default_quantity = default_quantity
        self.max_quantity = max_quantity
        self.visibilidad_aplicacion = visibilidad_aplicacion
        self.disponibilidades = disponibilidades
        self.admite_sala_espera_virtual = admite_sala_espera_virtual
        self.hasprovider = hasprovider
        self.tiene_validacion = tiene_validacion
        self.image_url = image_url
        self.entrega_domicilio = entrega_domicilio
        self.views = views
        self.tipo_servicio = tipo_servicio
        self.is_favorite = is_favorite
        self.has_reservation = has_reservation
        self.has_waiting_room = has_waiting_room
    }
}

public struct SubcategoriasAct: Decodable, Hashable, Encodable, Sendable {
    public let id_actividad: Int
    public let subcategory: String
    public let activity: String
    
    enum CodingKeys: String, CodingKey {
        case id_actividad = "id_actividad"
        case subcategory = "subcategory"
        case activity = "activity"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id_actividad = try container.decode(Int.self, forKey: .id_actividad)
        self.subcategory = try container.decode(String.self, forKey: .subcategory)
        self.activity = try container.decode(String.self, forKey: .activity)
    }
    
    public init(id_actividad: Int, subcategory: String, activity: String) {
        self.id_actividad = id_actividad
        self.subcategory = subcategory
        self.activity = activity
    }
}

public struct MetaResp: Decodable, Hashable, Encodable, Sendable {
    public let current_page: Int
    public let prev_page: Int?
    public let next_page: Int
    public let first_page: Int
    public let last_page: Int
    public let path: String
    public let prev_page_url: String?
    public let next_page_url: String
    public let first_page_url: String
    public let last_page_url: String
    public let from: Int
    public let to: Int
    public let per_page: Int
    public let total: Int
    
    enum CodingKeys: String, CodingKey {
        case current_page = "current_page"
        case prev_page = "prev_page"
        case next_page = "next_page"
        case first_page = "first_page"
        case last_page = "last_page"
        case path = "path"
        case prev_page_url = "prev_page_url"
        case next_page_url = "next_page_url"
        case first_page_url = "first_page_url"
        case last_page_url = "last_page_url"
        case from = "from"
        case to = "to"
        case per_page = "per_page"
        case total = "total"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.current_page = try container.decode(Int.self, forKey: .current_page)
        self.prev_page = try container.decodeIfPresent(Int.self, forKey: .prev_page)
        self.next_page = try container.decode(Int.self, forKey: .next_page)
        self.first_page = try container.decode(Int.self, forKey: .first_page)
        self.last_page = try container.decode(Int.self, forKey: .last_page)
        self.path = try container.decode(String.self, forKey: .path)
        self.prev_page_url = try container.decodeIfPresent(String.self, forKey: .prev_page_url)
        self.next_page_url = try container.decode(String.self, forKey: .next_page_url)
        self.first_page_url = try container.decode(String.self, forKey: .first_page_url)
        self.last_page_url = try container.decode(String.self, forKey: .last_page_url)
        self.from = try container.decode(Int.self, forKey: .from)
        self.to = try container.decode(Int.self, forKey: .to)
        self.per_page = try container.decode(Int.self, forKey: .per_page)
        self.total = try container.decode(Int.self, forKey: .total)
    }
    
    public init(current_page: Int, prev_page: Int?, next_page: Int, first_page: Int, last_page: Int, path: String, prev_page_url: String, next_page_url: String, first_page_url: String, last_page_url: String, from: Int, to: Int, per_page: Int, total: Int) {
        self.current_page = current_page
        self.prev_page = prev_page
        self.next_page = next_page
        self.first_page = first_page
        self.last_page = last_page
        self.path = path
        self.prev_page_url = prev_page_url
        self.next_page_url = next_page_url
        self.first_page_url = first_page_url
        self.last_page_url = last_page_url
        self.from = from
        self.to = to
        self.per_page = per_page
        self.total = total
    }
}