import XCTest
@testable import SimpleHttp

final class SimpleHttpTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testLoginUser() async throws {
        let requestTest = MockRequest<String>()
        let result = try await requestTest.perform(
            endpoint: MockEndpoint(
                operation: .login(
                    name: "user",
                    password: "password"
                )
            )
        )
        
        XCTAssertEqual(result, "LoggedIn")
    }
}
