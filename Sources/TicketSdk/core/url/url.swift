import Foundation

public enum TicketUrl {
    private static let ticketUrl = "https://ticket.xutil.net"

    case login 
    case changePass 
    case register 
    case servicios 
    case closeSesion 

    var path: String {
        switch self {
            case .login: return "/oauth2/token"
            case .changePass: return "/api/email-change-password"
            case .register: return "/api/register"
            case .servicios: return "/apps/bienestar/api/servicios"
            case .closeSesion: return "/oauth2/revoke"
        }
    }

    var url: URL {
        return URL(string: TicketUrl.ticketUrl + path)!
    }
}