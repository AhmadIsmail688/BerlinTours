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
    
    private static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(SpecialDateFormatter.networkFormat)
        return decoder
    }()
    
    private static func performGetRequest<T: Decodable> (
        request: TravelersApi,
        responseType: T.Type,
        completion: @escaping (T?, Error?, Bool) -> ()
    ) {
        travelersProvider.request(request) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedResponse = try jsonDecoder.decode(responseType, from: response.data)
                    completion(decodedResponse, nil, true)
                } catch {
                    print("Decoding error: ", error)
                }
            case .failure(let error):
                completion(nil, error, false)
            }
        }
    }
    
    static func getReviews(page: Int, completion: @escaping (ReviewsResponse?, Error?, Bool) -> ()) {
        let request = TravelersApi.getReviews(page: page)
        performGetRequest(request: request, responseType: ReviewsResponse.self, completion: completion)
    }
    
}


