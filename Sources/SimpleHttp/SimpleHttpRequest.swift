// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

/// The SimpleHttpRequest class is a usable implementation example of SimpleRequest but you can create your own.
/// Example:
///
/// ```swift
///let request = SimpleHttpRequest<String>()
///let loginResult = try await request.perform(
///    endpoint: UserEndpoint(
///        operation: .login(
///            name: name,
///            password: password
///        )
///    )
///)
///print(loginResult)
/// ```
public final class SimpleHttpRequest<T: Codable>: SimpleRequest {
    public func perform(endpoint: any SimpleEndpoint) async throws -> T {
        let requestData = try endpoint.buildRequestData()
        var request = URLRequest(url: requestData.url)
        // Set the Content-Type header for JSON
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = requestData.method
        request.httpBody = requestData.bodyData
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
