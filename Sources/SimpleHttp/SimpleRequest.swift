//
//  File.swift
//  
//
//  Created by Adriano Song on 27/02/24.
//

import Foundation

/// The SimpleRequest protocol where you can create your own API layer into you app.
/// With the protocol to be easy to create a Mock class from it (e.g: final class MockHttpRequest: SimpleRequest {...} )
public protocol SimpleRequest {
    associatedtype T: Codable
    func perform(endpoint: any SimpleEndpoint) async throws -> T
}
