import Foundation 
import os.log 

public class ChangePassApi: @unchecked Sendable {
    public static let shared = ChangePassApi()
    let logger = Logger()
    let session: URLSession = {
        let delegate = SessionDelegate.shared
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10 
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()

    public func changePass(email: String, completion: @escaping (Result<ChangePassResponse, NetworkError>) -> Void) async {
        let changeRequest = ChangePassRequest(email: email)
        print("✅ DEBUG: JSON REQUEST \(changeRequest)")
        let jsonBody = try? JSONEncoder().encode(changeRequest)
        let decoder = JSONDecoder()
        var request = URLRequest(url: TicketUrl.changePass.url)
        request.httpMethod = "POST"
        request.timeoutInterval = 10 
        request.httpBody = jsonBody
        request.setValue(RequestHeader.accept.value, forHTTPHeaderField: RequestHeader.accept.rawValue)
        request.setValue(RequestHeader.contentType.value, forHTTPHeaderField: RequestHeader.accept.rawValue)

        logger.info("✅ DEBUG: Iniciando Solicitud a POST \(TicketUrl.changePass.url.absoluteString)")

        do {
            let (data, response) = try await session.data(for: request)

            if let httpResponse = response as? HTTPURLResponse {
                logger.debug("✅ DEBUG: SERVER RESPONSE \(httpResponse.statusCode)")

                if let jsonData = String(data: data, encoding: .utf8) {
                    logger.debug("✅ DEBUG: SERVER RESPONSE \(jsonData)")
                } else {
                    logger.error("❌ DEBUG: SERVER FAILURE RESPONSE")
                }

                switch httpResponse.statusCode {
                    case 200: 
                        let changeResponse = try decoder.decode(ChangePassResponse.self, from: data) 
                        print("✅ DEBUG: JSON RESPONSE \(changeResponse)")
                    case 400: 
                        let errorDetails = String(data: data, encoding: .utf8)
                        logger.error("❌ DEBUG: JSON FAILURE RESPONSE \(String(describing: errorDetails))")
                    default: 
                        logger.error("❌ DEBUG: JSON FAILURE RESPONSE \(httpResponse.statusCode)")
                }
            }
        } catch {
            logger.error("❌ DEBUG: JSON FAILURE RESPONSE \(error.localizedDescription)")
        }
    }
}