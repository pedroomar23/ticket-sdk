import Foundation 

public enum NetworkError {
    case status(code: Int)
    case jsonFailure(msg: String)
    case urlFailure(message: String)
}