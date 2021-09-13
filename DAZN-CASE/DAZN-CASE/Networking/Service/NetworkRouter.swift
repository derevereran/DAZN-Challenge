//
//  NetworkRouter.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 12.09.2021.
//

import Foundation

typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()


protocol NetworkRouter {
    
    associatedtype EndPoint: EndPointype
    
    func request(route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
