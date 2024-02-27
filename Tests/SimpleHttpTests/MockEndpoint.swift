//
//  File.swift
//  
//
//  Created by Adriano Song on 27/02/24.
//

import Foundation
@testable import SimpleHttp

/// A Simple error handling for MockEndpoint example.
public enum SimpleRequestError: Error {
    case invalidURL
    case invalidEndpoint
}

public struct MockEndpoint: SimpleEndpoint {
    public enum OperationEnum {
        case login(name: String, password: String)
    }
    
    public var baseURL: String = "http://192.168.1.1:8000/"
    public var operation: OperationEnum
    public func buildRequestData() throws -> SimpleRequestData {
        switch operation {
        case .login:
            guard let url = URL(string: "\(baseURL)loginUser") else {
                throw SimpleRequestError.invalidURL
            }
            
            return RequestData(url: url, method: "POST", bodyData: nil)
        }
    }
}
