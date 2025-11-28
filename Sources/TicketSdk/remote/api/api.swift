import Foundation 
import os.log

public class TicketApi: @unchecked Sendable {
    public static let shared: TicketApi = TicketApi()
    public let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10 
        return URLSession(configuration: configuration)
    }()
}