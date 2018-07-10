import Foundation

public class DummyNetworkLayer: NetworkLayer {
    public var successResponse: Decodable?
    public var errorResponse: String?

    open override func get<T>(urlString: String,
                                headers: [String : String],
                                successHandler: @escaping (T) -> Void,
                                errorHandler: @escaping ErrorHandler) where T : Decodable {
        switch successResponse {
        case .some(let response):
            if let correctResponse = response as? T {
                successHandler(correctResponse)
            } else {
                errorHandler(errorResponse ?? "")
            }
        default:
            errorHandler(errorResponse ?? "")
        }
    }

    open override func post<T>(urlString: String,
                                 body: T,
                                 headers: [String : String],
                                 errorHandler: @escaping ErrorHandler) where T : Decodable {
        switch errorResponse {
        case .some(let errorString):
            errorHandler(errorString)
        default:
            break
        }
    }
}
