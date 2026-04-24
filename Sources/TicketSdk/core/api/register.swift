import Foundation
import os.log

public class RegisterApi: @unchecked Sendable {
    public static let shared = RegisterApi()
    let logger = Logger()
    let session: URLSession = {
        let delegate = SessionDelegate.shared
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10 
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()

    public func register(mail: String, dni: String, name: String, lastname: String, password: String, username: String, uid: String, aplication: String, completion: @escaping (Result<RegisterResponse, NetworkError>) -> Void) async {
        let register = RegisterRequest(
            mail: mail, 
            dni: dni, 
            name: name, 
            lastname: lastname, 
            password: password, 
            username: username, 
            uid: uid, 
            aplication: aplication
        )
        print("✅ DEBUG: JSON REQUEST \(register)")
        let decoder = JSONDecoder()
        let jsonBody = try? JSONEncoder().encode(register)
        var request = URLRequest(url: TicketUrl.register.url)
        request.httpBody = jsonBody
        request.httpMethod = "POST"
        request.timeoutInterval = 10 
        request.setValue(RequestHeader.accept.value, forHTTPHeaderField: RequestHeader.accept.rawValue)
        request.setValue(RequestHeader.contentType.value, forHTTPHeaderField: RequestHeader.contentType.rawValue)

        logger.info("✅ DEBUG: Iniciando Solicitud a POST \(TicketUrl.register.url.absoluteString)")

        do {
            let (data, response) = try await session.data(for: request)

            if let httpResponse = response as? HTTPURLResponse {
                logger.debug("✅ DEBUG: SERVER RESPONSE \(httpResponse.statusCode)")

                if let jsonData = String(data: data, encoding: .utf8) {
                    logger.debug("✅ DEBUG: JSON RESPONSE \(jsonData)")
                } else {
                    logger.error("❌ DEBUG: JSON FAILURE RESPONSE")
                }

                switch httpResponse.statusCode {
                    case 200: 
                        let registerResponse = try decoder.decode(RegisterResponse.self, from: data)
                        print("✅ DEBUG: JSON RESPONSE \(registerResponse)")
                    case 400: 
                        let errorDetails = String(data: data, encoding: .utf8)
                        logger.error("❌ DEBUG: JSON FAILURE RESPONSE \(String(describing: errorDetails))")
                    default: 
                        let error = String(data: data, encoding: .utf8)
                        logger.error("❌ DEBUG: JSON FAILURE RESPONSE \(String(describing: error))")
                }
            }
        } catch {
            logger.error("❌ DEBUG: JSON FAILURE RESPONSE \(error.localizedDescription)")
        }
    }
}