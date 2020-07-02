//
//  Service.swift
//  hushPro
//
//  Created by harikrishnan on 01/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

enum ServiceMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete  = "DELETE"
}


protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var method: ServiceMethod { get }
}

extension Service {
  
   public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        return request
    }

    private var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path

        if method == .get {
            // add query items to url
            guard let parameters = parameters as? [String: String] else {
                fatalError("parameters for GET http method must conform to [String: String]")
            }
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        return urlComponents?.url
    }
}
