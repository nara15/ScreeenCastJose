//
//  ScreenCastAPI.swift
//  ScreenCastJose
//
//  Created by Neil García on 11/10/17.
//  Copyright © 2017 Neil. All rights reserved.
//

import Foundation
import Moya


let moyaProvider = MoyaProvider<ScreenCastAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])

// Enum the methods of the REST API
enum ScreenCastAPI {
    
    /// - login: This action allow an user to login to the web service
    case getEpisodes
}

extension ScreenCastAPI : TargetType {
    var headers: [String : String]? {
        return nil
    }
    
    /// Base URL
    public var baseURL: URL {
        return URL(string: Constants.baseURL.rawValue)!
    }
    
    /// Returns the path for each endpoing of the API
    public var path: String {
        switch self {
        case .getEpisodes:
            return "api/episodes.json"
        }
    }
    
    /// Set Methods for each endpoint
    public var method: Moya.Method {
        switch self {
        case .getEpisodes:
            return .get
        }
    }
    
    /// Set parameters for each endpoint
    public var parameters: [String: Any]? {
        return [:]
    }
    
    /// Task type, usually a request.
    public var task: Task {
        return .requestPlain
    }
    
    /// Return sample data for each WS for Unit Testing
    public var sampleData: Data {
        switch self {
        default:
            return "".data(using: String.Encoding.utf8)!
        }
    }
    
    /// Parameter enconding.
    public var parameterEncoding: Moya.ParameterEncoding {
        return JSONEncoding.default
    }
}
