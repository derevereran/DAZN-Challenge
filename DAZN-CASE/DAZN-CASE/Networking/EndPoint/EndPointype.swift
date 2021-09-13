//
//  EndPointype.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 12.09.2021.
//

import Foundation

protocol EndPointype {
    
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
