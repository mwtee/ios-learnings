//
//  HTTPClient.swift
//  Pokedex
//
//  Created by Ming Tee on 7/3/21.
//

import Combine
import Foundation

protocol HTTPClientType {
    func perform<T: Decodable>(
        request: URLRequest,
        queue: DispatchQueue,
        retries: Int
    ) -> AnyPublisher<T, HTTPClientError>
}

extension HTTPClientType {
    func perform<T: Decodable>(
        request: URLRequest,
        queue: DispatchQueue = .main,
        retries: Int = 0
    ) -> AnyPublisher<T, HTTPClientError> {
        return perform(request: request, queue: queue, retries: retries)
    }
}

final class HTTPClient: HTTPClientType {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func perform<T: Decodable>(
        request: URLRequest,
        queue: DispatchQueue = .main,
        retries: Int = 0
    ) -> AnyPublisher<T, HTTPClientError>
    {
        return session.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse else {
                    throw HTTPClientError.noResponse
                }
                
                let successfulStatusCodeRange = 200...299
                if !successfulStatusCodeRange.contains(response.statusCode)  {
                    throw HTTPClientError.errorCode(response.statusCode)
                }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error in
              switch error {
              case is Swift.DecodingError:
                return HTTPClientError.decoding(error: error)
              case let urlError as URLError:
                return HTTPClientError.sessionFailed(error: urlError)
              default:
                return HTTPClientError.other(error)
              }
            })
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}

enum HTTPClientError: Error {
    case noResponse
    case errorCode(Int)
    case decoding(error: Error)
    case sessionFailed(error: URLError)
    case other(Error)
}
