//
//  HTTPClientMock.swift
//  SampleTests
//
//  Created by Joao Lucas on 21/11/20.
//

import Foundation
@testable import Sample

class HTTPClientMock: HTTPClientProtocol {

    var fileName = String()
    var failure: Bool = false
    var isCancelled = false

    func request<T>(_ request: URLRequest, decode: ((T) -> T)?, completion: @escaping (Result<T, HTTPError>) -> Void) where T: Decodable {

        guard !failure else {
            return completion(.failure(.jsonParsingFailure))
        }

        guard let decodable: T = JSONHelper.load(withFile: fileName) else { return }
        if let value = decode?(decodable) {
            return completion(.success(value))
        }
        return completion(.success(decodable))
    }

    func cancelAllRequests() {
        self.isCancelled = true
    }
}
