import Foundation 
import os.log

public class LoginApi: @unchecked Sendable {
    public static let shared = LoginApi()
    let logger = Logger()
    let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let delegate = SessionDelegate.shared
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10 
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()

    // MARK: - Login 
   
    public func login(username: String, password: String, pass: String, scope: String, grand_type: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) async {
        let loginModel = LoginModel(
            username: username, 
            password: password, 
            pass: pass, 
            scope: scope, 
            grand_type: grand_type
        )
        print("✅ DEBUG: JSON REQUEST \(loginModel)")
        let decoder = JSONDecoder()
        let jsonBody = try? JSONEncoder().encode(loginModel)
        var request = URLRequest(url: TicketUrl.login.url)
        request.httpBody = jsonBody
        request.httpMethod = "POST"
        request.timeoutInterval = 10 
        request.setValue(RequestHeader.contentType.value, forHTTPHeaderField: RequestHeader.contentType.rawValue)
        request.setValue(RequestHeader.accept.value, forHTTPHeaderField: RequestHeader.accept.rawValue)

        logger.info("Iniciando Solicitud a POST: \(TicketUrl.login.url.absoluteString)")

        do {
            let (data, response) = try await session.data(for: request)

            if let httpResponse = response as? HTTPURLResponse {
                logger.debug("✅ DEBUG: Status Code \(httpResponse.statusCode)")

                if let jsonData = String(data: data, encoding: .utf8) {
                    logger.debug("JSON Response: \(jsonData)")
                } else {
                    logger.error("JSON Failure Response")
                }

                switch httpResponse.statusCode {
                    case 200:
                        let loginJSON = try decoder.decode(LoginResponse.self, from: data)
                        completion(.success(loginJSON))
                        print("✅ DEBUG: JSON Response \(loginJSON)")
                    case 400: 
                        let errorDetails = String(data: data, encoding: .utf8)
                        logger.error("❌ DEBUG: JSON Failure Response \(String(describing: errorDetails))")
                    default:
                        completion(.failure(NetworkError.status(code: httpResponse.statusCode)))
                        
                        let error = String(data: data, encoding: .utf8)
                        logger.error("❌ DEBUG: JSON FAILURE RESPONSE \(String(describing: error))")
                }
            }
        } catch  {
            logger.error("❌ DEBUG: JSON FAULIRE RESPONSE \(error.localizedDescription)")
        }
    }

    // MARK: - Servicios 

    public func services(completion: @escaping (Result<ServiciosResponse, NetworkError>) -> Void) async {
        let decoder = JSONDecoder()
        var request = URLRequest(url: TicketUrl.servicios.url)
        request.httpMethod = "POST"
        request.timeoutInterval = 10 
        request.setValue(RequestHeader.accept.value, forHTTPHeaderField: RequestHeader.accept.rawValue)
        request.setValue(RequestHeader.contentType.value, forHTTPHeaderField: RequestHeader.contentType.rawValue)
    }
}