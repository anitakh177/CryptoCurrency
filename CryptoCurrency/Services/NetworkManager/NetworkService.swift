//
//  NetworkService.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
    var urlCache: URLCache { get }
    func createRequest(with urlString: String) -> URLRequest
}

final class NetworkService: Networking {
    
    var urlCache: URLCache {
        URLCache.shared
    }
    
    func validteCache() {
        let currentTime = Date().timeIntervalSince1970
        let lastSavedTime = StorageService.shared.getLastSavedTime()
        if currentTime - lastSavedTime > 120 {
            urlCache.removeAllCachedResponses()
        } else { return }
    }
   
    
    func createRequest(with urlString: String) -> URLRequest {
      let url = URL(string: urlString)
       validteCache()
        let request = URLRequest(url: url!)
             return request
         }

    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
             let request = createRequest(with: urlString)
             let task = createDataTask(from: request, completion: completion)
             task.resume()
         }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                self.saveResponseToCache(response, cachedData: data, by: request)
                completion(data, error)
            }
        })
    }
}

// MARK: - Cache logic

private extension NetworkService {

    func getCachedResponseFromCache(by request: URLRequest) -> CachedURLResponse? {
        return urlCache.cachedResponse(for: request)
    }

    func saveResponseToCache(_ response: URLResponse?, cachedData: Data?, by request: URLRequest) {
        guard let response = response, let cachedData = cachedData else {
            return
        }

        let cachedUrlResponse = CachedURLResponse(response: response, data: cachedData)
        urlCache.storeCachedResponse(cachedUrlResponse, for: request)
    }

}
