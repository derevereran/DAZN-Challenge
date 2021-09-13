//
//  JSONParameterEncoder.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 12.09.2021.
//

import Foundation
public struct JSONParameterEncoder: ParameterEncoder {
    
    
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }catch {
            throw NetworkError.encodingFailed
        }
    }
}
