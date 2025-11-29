import Foundation

public struct ParamApp: Decodable, Hashable, Encodable,  Sendable {
    public let id: Int
    public let establishment_id: Int
    public let nombre_entidad: String
    public let nombre: String
    public let precio: Int
    public let default_quantity: Int
    public let confirmar_desde: Int?
    public let confirmar_hasta: Int?
    public let currency: Int?
    public let descripcion: String
    public let establecimiento: String
    public let provincia: String
    public let municipio: String
    public let latitud: String
    public let longitud: String
    public let visibilidad_aplicacion: Int
    public let admite_sala_espera_virtual: Int
    public let admite_sala_espera_fisica: Int
    public let admite_catalogo: Int
    public let max_quantity: Int
    public let remember_forever: Int
    public let entrega_domicilio: Bool
    public let reserva_gratis: Int
    public let ver_disponibilidad: Int
    public let por_acuerdo: Int
    public let dias_maximos: Int
    public let dias_minimos: Int
    public let tiene_validacion: Int
    public let via_validacion: [String]
    public let id_zona: Int?
    public let pago_confirmacion: Int
    public let hasprovider: Int
    public let version: [String]
    public let requested_tk: String
    public let tipo_servicio: [String]
    public let distance: String
    public let in_range: Bool
    public let disponible: Bool
    public let disponibilidades: Int
    public let preservation_time: Int
    public let subcategorias_actividades: [SubCatActividad]
    public let image_urls: [String]
    public let categorias_servicios: [CatServicios]
    public let has_waiting_room: Bool
    public let valoraciones: [Valoraciones]
    public let views: Int
    public let reviews_slice: ReviewsSlice
    public let count_reservation: Int
    public let has_reservation: Bool
    public let had_reservation: Bool
    public let actividades: Actividades
    public let is_favorite: Bool
    public let capacidades: Int
    public let public_link: String
    public let detalles_prepago: DetailsPrepago
    public let payment_details: String?
    public let link_videoconferencia: String?
    public let access_token: String?
    public let perfiles_asociados: [String]
    public let datos_adicionales: [DatosAdicionales]
    public let cantidad_datos_adicionales: Int
    public let meta: String?
    public let is_representative: Bool
    public let created_at: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case establishment_id = "establishment_id"
        case nombre_entidad = "nombre_entidad"
        case nombre = "nombre"
        case precio = "precio"
        case default_quantity = "default_quantity"
        case confirmar_desde = "confirmar_desde"
        case confirmar_hasta = "confirmar_hasta"
        case currency = "currency"
        case descripcion = "descripcion"
        case establecimiento = "establecimiento"
        case provincia = "provincia"
        case municipio = "municipio"
        case latitud = "latitud"
        case longitud = "longitud"
        case visibilidad_aplicacion = "visibilidad_aplicacion"
        case admite_sala_espera_virtual = "admite_sala_espera_virtual"
        case admite_sala_espera_fisica = "admite_sala_espera_fisica"
        case admite_catalogo = "admite_catalogo"
        case max_quantity = "max_quantity"
        case remember_forever = "remember_forever"
        case entrega_domicilio = "entrega_domicilio"
        case reserva_gratis = "reserva_gratis"
        case ver_disponibilidad = "ver_disponibilidad"
        case por_acuerdo = "por_acuerdo"
        case dias_maximos = "dias_maximos"
        case dias_minimos = "dias_minimos"
        case tiene_validacion = "tiene_validacion"
        case via_validacion = "via_validacion"
        case id_zona = "id_zona"
        case pago_confirmacion = "pago_confirmacion"
        case hasprovider = "hasprovider"
        case version = "version"
        case requested_tk = "requested_tk"
        case tipo_servicio = "tipo_servicio"
        case distance = "distance"
        case in_range = "in_range"
        case disponible = "disponible"
        case disponibilidades = "disponibilidades"
        case preservation_time = "preservation_time"
        case subcategorias_actividades = "subcategorias_actividades"
        case image_urls = "image_urls"
        case categorias_servicios = "categorias_servicios"
        case has_waiting_room = "has_waiting_room"
        case valoraciones = "valoraciones"
        case views = "views"
        case reviews_slice = "reviews_slice"
        case count_reservation = "count_reservation"
        case has_reservation = "has_reservation"
        case had_reservation = "had_reservation"
        case actividades = "actividades"
        case is_favorite = "is_favorite"
        case capacidades = "capacidades"
        case public_link = "public_link"
        case detalles_prepago = "detalles_prepago"
        case payment_details = "payment_details"
        case link_videoconferencia = "link_videoconferencia"
        case access_token = "access_token"
        case perfiles_asociados = "perfiles_asociados"
        case datos_adicionales = "datos_adicionales"
        case cantidad_datos_adicionales = "cantidad_datos_adicionales"
        case meta = "meta"
        case is_representative = "is_representative"
        case created_at = "created_at"
    }
}

// MARK: - Subcategorias Actividades

public struct SubCatActividad: Decodable, Hashable, Encodable, Sendable {
    public let id_actividad: Int
    public let subcategory: String?
    public let activity: String
    
    public enum CodingKeys: String, CodingKey {
        case id_actividad = "id_actividad"
        case subcategory = "subcategory"
        case activity = "activity"
    }
}

// MARK: - Categoria Servicios

public struct CatServicios: Decodable, Hashable, Encodable, Sendable {
    public let denominacion: String
    public let clave_icono: String
    public let id_categoria: Int
    
    public enum CodingKeys: String, CodingKey {
        case denominacion = "denominacion"
        case clave_icono = "clave_icono"
        case id_categoria = "id_categoria"
    }
}

// MARK: - Valoraciones

public struct Valoraciones: Decodable, Hashable, Encodable, Sendable {
    public let id: Int
    public let node: Int
    public let valoracion: Int
    public let mensaje: String
    public let validado_fuc: Int
    public let usuario: String
    public let date: String
    public let answers: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case node = "node"
        case valoracion = "valoracion"
        case mensaje = "mensaje"
        case validado_fuc = "validado_fuc"
        case usuario = "usuario"
        case date = "date"
        case answers = "answers"
    }
}

// MARK: - Reviews Slice

public struct ReviewsSlice: Decodable, Hashable, Encodable, Sendable {
    public let cincoStars: Int
    public let cuatroStars: Int
    public let tresStars: Int
    public let dosStars: Int
    public let unStars: Int
    public let sin_valorar: Int
    
    enum CodingKeys: String, CodingKey {
        case cincoStars = "5_stars"
        case cuatroStars = "4_stars"
        case tresStars = "3_stars"
        case dosStars = "2_stars"
        case unStars = "1_stars"
        case sin_valorar = "sin_valorar"
    }
}

// MARK: - Actividades

public struct Actividades: Decodable, Hashable, Encodable, Sendable {
    public let data: [DataR]
    public let meta: MetaR
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case meta = "meta"
    }
}

public struct DataR: Decodable, Hashable, Encodable, Sendable {
    public let id: Int
    public let denominacion: String
    public let descripcion: String
    public let deleted_at: String?
    public let created_at: String?
    public let updated_at: String
    public let id_tipo_actividad: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case denominacion = "denominacion"
        case descripcion = "descripcion"
        case deleted_at = "deleted_at"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case id_tipo_actividad = "id_tipo_actividad"
    }
}

public struct MetaR: Decodable, Hashable, Encodable, Sendable {
    public let current_page: Int
    public let first_page_url: String
    public let from: Int
    public let last_page: Int
    public let last_page_url: String
    public let next_page_url: String?
    public let path: String
    public let per_page: Int
    public let prev_page_url: String?
    public let to: Int
    public let total: Int
    
    enum CodingKeys: String, CodingKey {
        case current_page = "current_page"
        case first_page_url = "first_page_url"
        case from = "from"
        case last_page = "last_page"
        case last_page_url = "last_page_url"
        case next_page_url = "next_page_url"
        case path = "path"
        case per_page = "per_page"
        case prev_page_url = "prev_page_url"
        case to = "to"
        case total = "total"
    }
}

// MARK: - Prepago Detalles

public struct DetailsPrepago: Decodable, Hashable, Encodable, Sendable {
    public let sala_espera: Int
    public let reservaciones: Int
    public let adelanta_ticket: Int
    
    enum CodingKeys: String, CodingKey {
        case sala_espera = "sala_espera"
        case reservaciones = "reservaciones"
        case adelanta_ticket = "adelanta_ticket"
    }
}

// MARK: - Datos Adicionales

public struct DatosAdicionales: Decodable, Hashable, Encodable, Sendable {
    public let id_local_servicio: Int
    public let label: String
    public let name: String
    public let type: String
    public let length: Int
    public let required: Bool
    public let regex: String?
    public let hepler: String
    public let modelo: Int?
    
    enum CodingKeys: String, CodingKey {
        case id_local_servicio = "id_local_servicio"
        case label = "label"
        case name = "name"
        case type = "type"
        case length = "length"
        case required = "required"
        case regex = "regex"
        case hepler = "hepler"
        case modelo = "modelo"
    }
}