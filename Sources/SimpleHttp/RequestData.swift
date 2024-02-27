//
//  File.swift
//  
//
//  Created by Adriano Song on 27/02/24.
//

import Foundation

/// A Simple implementation of SimpleRequestData
public struct RequestData: SimpleRequestData {
    public var url: URL
    public var method: String
    public var bodyData: Data?
    public var extras: [String : Any]
    
    public init(url: URL, method: String, bodyData: Data? = nil, extras: [String : Any] = [:]) {
        self.url = url
        self.method = method
        self.bodyData = bodyData
        self.extras = extras
    }
}
