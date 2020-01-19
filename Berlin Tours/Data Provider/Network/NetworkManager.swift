//
//  NetworkManager.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/17/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import Foundation
import Moya

struct NetworkManager {
    
    private static let travelersProvider = MoyaProvider<TravelersApi>()
    
    private static func performGetRequest<T: Decodable> (
        request: TravelersApi,
        responseType: T.Type,
        completion: @escaping (T?, Error?, Bool) -> ()
    ) {
        travelersProvider.request(request) { result in
            switch result {
            case .success(let response):
                do {
                    let successResponse = try response.filterSuccessfulStatusCodes()
                    let jsonDecoder = JsonDecoder.defaultDecoder
                    let decodedResponse = try jsonDecoder.decode(responseType, from: successResponse.data)
                    completion(decodedResponse, nil, true)
                } catch {
                    print(error.localizedDescription)
                    completion(nil, error, false)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil, error, false)
            }
        }
    }
    
    static func getReviews(page: Int, completion: @escaping (ReviewsResponse?, Error?, Bool) -> ()) {
        let request = TravelersApi.getReviews(page: page)
        performGetRequest(request: request, responseType: ReviewsResponse.self, completion: completion)
    }
    
}


