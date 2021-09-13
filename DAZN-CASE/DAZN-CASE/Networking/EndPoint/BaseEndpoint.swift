//
//  BaseEndpoint.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 12.09.2021.
//

import Foundation

enum NetworkEnvironment {
    
    case development
    case staging
    case production
}

public enum DaznApi {
    case getScoeres
    case getMatches
}

extension DaznApi: EndPointype {
    var baseUrl: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
   
    var environmentBaseURL : String {
       
       return Constanst.baseUrl
        
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .getScoeres:
            return "Scoeres"
        case .getMatches:
            return "matches"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getScoeres:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .jsonEncoding,
                                      urlParameters: [:])
        case .getMatches:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .jsonEncoding,
                                      urlParameters: [:])
        }
    }
}

