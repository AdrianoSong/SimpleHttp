//
//  File.swift
//  
//
//  Created by Adriano Song on 27/02/24.
//

import Foundation
@testable import SimpleHttp

final class MockRequest<T: Codable>: SimpleRequest {
    func perform(endpoint: any SimpleEndpoint) async throws -> T {
        let requestData = try endpoint.buildRequestData()
        switch requestData.url.absoluteString {
        case "http://192.168.1.1:8000/loginUser":
            return "LoggedIn" as! T
        default:
            throw SimpleRequestError.invalidEndpoint
        }
    }
}
