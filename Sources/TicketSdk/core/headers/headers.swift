import Foundation 

enum RequestHeader: String {
    case accept = "Accept"
    case contentType = "Content-Type"

    var value: String {
        switch self {
            case .accept: return "application/json"
            case .contentType: return "application/json"
        }
    }
}