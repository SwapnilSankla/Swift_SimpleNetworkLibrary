import Foundation

typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void
public typealias ErrorHandler = (String) -> Void

public class NetworkLayer {
    static let genericError = "Something went wrong. Please try again later"

    public init() {
    }

    public func get<T: Decodable>(url: URL,
                                  successHandler: @escaping (T) -> Void,
                                  errorHandler: @escaping ErrorHandler) {

        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error) in
            if let error = error {
                print(error.localizedDescription)
                errorHandler(NetworkLayer.genericError)
                return
            }

            if let unwrappedUrlResponse = urlResponse as? HTTPURLResponse {
                if self.isSuccessCode(unwrappedUrlResponse.statusCode) {
                    if let data = data {
                        if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                            successHandler(responseObject)
                            return
                        } else {
                            print("Unable to parse the response in given type \(T.self)")
                        }
                    }
                }
            }

            errorHandler(NetworkLayer.genericError)
        }

        URLSession.shared.dataTask(with: url, completionHandler: completionHandler).resume()
    }

    public func post<T: Encodable>(urlRequest: URLRequest,
                                   body: T,
                                   errorHandler: ErrorHandler? = nil) {

        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error) in
            if let error = error {
                print(error.localizedDescription)
                errorHandler?(NetworkLayer.genericError)
                return
            }

            if let unwrappedUrlResponse = urlResponse as? HTTPURLResponse {
                if !self.isSuccessCode(unwrappedUrlResponse.statusCode) {
                    errorHandler?(NetworkLayer.genericError)
                    return
                }
            }
        }

        var request = urlRequest
        request.timeoutInterval = 90
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type":"application/json"]
        if let data = try? JSONEncoder().encode(body) {
            request.httpBody = data
            URLSession
                .shared
                .uploadTask(with: request,
                            from: data,
                            completionHandler: completionHandler)
                .resume()
        } else {
            errorHandler?("Cannot encode given object into Data")
        }
    }

    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
}
