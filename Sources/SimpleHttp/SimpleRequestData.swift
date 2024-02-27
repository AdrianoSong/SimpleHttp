//
//  File.swift
//  
//
//  Created by Adriano Song on 27/02/24.
//

import Foundation

/// SimpleRequestData is a protocol only for hold a basic data for your SimpleRequest
/// extras dictionary property holds extra data for your api request when needed (e.g: certificate, headers, etc.)
public protocol SimpleRequestData {
    var url: URL { get set }
    var method: String { get set }
    var bodyData: Data? { get set }
    var extras: [String: Any] { get set }
}
