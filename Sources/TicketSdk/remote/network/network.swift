import Foundation 

public enum NetworkError: Error {
    case status(code: Int)
    case jsonFailure(msg: String)
    case urlFailure(message: String)
}