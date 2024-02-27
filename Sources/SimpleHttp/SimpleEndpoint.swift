//
//  File.swift
//  
//
//  Created by Adriano Song on 27/02/24.
//

import Foundation

/// SimpleEndpoint protocol, where lies all the logic behind of a SimpleHttp Package, it will define operations (e.g: .loginUser, .getProfileData, .postComment, etc), baseURL (e.g: "http://192.168.1.1:8000/") and your requestData.
/// Example:
///
/// ```swift
///struct UserEndpoint: SimpleEndpoint {
///    enum OperationEnum {
///        case login(name: String, password: String)
///    }
///    var baseURL: String = "http://192.168.1.1:8000/"
///    var operation: OperationEnum
///    
///    func buildRequestData() throws -> SimpleRequestData {
///        switch operation {
///        case .login(name: let name, password: let password):
///            guard let url = URL(string: "\(baseURL)loginUser") else {
///                throw SimpleRequestError.invalidURL
///            }
///            let bodyDict: [String: Any] = [
///                "name": name,
///                "password": password
///            ]
///            let bodyData = try JSONSerialization.data(withJSONObject: bodyDict)
///
///            return RequestData(url: url, method: "POST", bodyData: bodyData)
///         }
///    }
/// ...
/// ```
public protocol SimpleEndpoint {
    associatedtype OperationEnum
    var operation: OperationEnum { get }
    var baseURL: String { get set }
    func buildRequestData() throws -> SimpleRequestData
}
