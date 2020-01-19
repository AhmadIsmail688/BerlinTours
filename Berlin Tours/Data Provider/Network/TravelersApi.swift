//
//  TravelersApi.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/17/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import Foundation
import Moya

enum TravelersApi {
    case getReviews(page: Int)
}

extension TravelersApi: TargetType {
    var baseURL: URL {
        let urlString = "https://travelers-api.getyourguide.com"
        guard let url = URL(string: urlString) else {
            fatalError("base URL could not be configured")
        }
        return url
    }
    
    var path: String {
        return "/activities/23776/reviews"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getReviews(let page):
            return Task.requestParameters(
                parameters: PaginationHelper.parameters(page: page),
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
