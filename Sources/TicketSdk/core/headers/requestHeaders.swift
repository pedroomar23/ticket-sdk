import Foundation 

public enum RequestHeader: String {
    case accept = "Accept"
    case contentType = "Content-Type"
    case authorization = "Authorization"

    var path: String {
        switch self {
            case .accept: return "application/json"
            case .contentType: return "application/json"
            case .authorization: return "Basic NloyWGNna01Ra1h0VVdDeHk2eTdlT0syWklBYTpXSGtqTDc4dFVIbHdNUGo3ZmRfRkY1a1UyaElh"
        }
    }
}