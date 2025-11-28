import Foundation 
import os.log

@available(iOS 15, macOS 12, *)
public class TicketApi: @unchecked Sendable {
    public static let shared: TicketApi = TicketApi()
    public let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10 
        return URLSession(configuration: configuration)
    }()

    // MARK: - Login 
   
    public func login(username: String, password: String, pass: String, scope: String, grand_type: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) async {
        let decoder = JSONDecoder()
        var request = URLRequest(url: TicketUrl.login.url)
        request.httpMethod = "POST"
        request.timeoutInterval = 10 
        request.setValue("application/json", forHTTPHeaderField: "Content_Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Basic NloyWGNna01Ra1h0VVdDeHk2eTdlT0syWklBYTpXSGtqTDc4dFVIbHdNUGo3ZmRfRkY1a1UyaElh", forHTTPHeaderField: "Authorization")

        print("Iniciando Solicitud a POST: \(TicketUrl.login.url.absoluteString)")

        let loginModel = LoginModel(
            username: username, 
            password: password, 
            pass: pass, 
            scope: scope, 
            grand_type: grand_type
        )
        print("LoginRequest: \(loginModel)")

        do {
            let jsonBody = try JSONEncoder().encode(loginModel)
            request.httpBody = jsonBody

            let (data, response) = try await session.data(for: request)

            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")

                if let jsonData = String(data: data, encoding: .utf8) {
                    print("JSON Response: \(jsonData)")
                } else {
                    print("JSON Failure Response")
                }

                switch httpResponse.statusCode {
                    case 200:
                        let loginJSON = try decoder.decode(LoginResponse.self, from: data)
                        completion(.success(loginJSON))
                        print("JSON Response: \(loginJSON)")
                    case 400: 
                        let errorDetails = String(data: data, encoding: .utf8)
                        print("JSON Failure Response: \(String(describing: errorDetails))")
                    default:
                        completion(.failure(NetworkError.status(code: httpResponse.statusCode)))
                }
            }
        } catch  {
            completion(.failure(NetworkError.jsonFailure(msg: "JSON Failure Response: \(error.localizedDescription)")))
        }
    }
}