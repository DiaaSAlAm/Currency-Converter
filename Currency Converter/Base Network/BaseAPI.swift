//
//  BaseAPI.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion:@escaping (Result<M?, NSError>) -> Void) {
        
        
        let httpMethod =  target.method.rawValue
        let parameters =  buildParams(task: target.task).0
        let httpBody = buildParams(task: target.task).1
        let headers =  target.headers
        let urlString = target.baseURL + target.path
        let url = buildURL(task: target.task, parameters: parameters ?? [:], urlString: urlString)
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.httpBody = httpBody
        request.allHTTPHeaderFields = headers
        let dataTask = setURLSessionConfiguration().dataTask(with: request) { (data, response,error) in
            guard error == nil else {
                let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ConstatnsToastMessage.genericErrorMessage])
                completion(.failure(error))
                return
            }
            
            guard let responseObj = try? JSONDecoder().decode(M.self, from: data!) else {
                // ADD Custom Error
                let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ConstatnsToastMessage.genericErrorMessage])
                completion(.failure(error))
                return
            }
            completion(.success(responseObj))
        }
        dataTask.resume()
    }
    
    private func setURLSessionConfiguration() -> URLSession {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 15.0
        sessionConfig.timeoutIntervalForResource = 30.0
        let session = URLSession(configuration: sessionConfig)
        return session
    }
    
    private func buildParams(task: Task) -> ([String: Any]?, Data?) {
        switch task {
        case .requestPlain:
            return (nil,nil)
        case .requestParametersJSONEncoding(let parameters):
            return (nil, try? JSONSerialization.data(withJSONObject: parameters))
        case .requestParametersURLEncoding(let parameters):
            return (parameters, nil)
        }
    }
    
    private func buildURL(task: Task,parameters: [String: Any], urlString: String ) -> URL {
        switch task {
        case .requestParametersURLEncoding:
            var urlComponents = URLComponents(string: urlString)
            var queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            urlComponents?.queryItems = queryItems
            return (urlComponents?.url!)!
        default:
            return URL(string: urlString)!
        }
    }
}
