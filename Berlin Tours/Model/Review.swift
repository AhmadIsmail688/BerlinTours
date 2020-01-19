//
//  Review.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/17/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import Foundation

struct ReviewsResponse: Decodable {
    let reviews: [Review]
    let totalCount: Int
    let averageRating: Double
    let pagination: Pagination
}

struct Review: Decodable {
    let id: Int
    let author: Author
    let title: String
    let message: String
    let enjoyment: String
    let isAnonymous: Bool
    let rating: Int
    let created: Date
    let language: String
    let travelerType: String?

}

struct Author: Decodable {
    let fullName: String
    let country: String?
    let photo: URL?
}

struct Pagination: Decodable {
    let limit: Int
    let offset: Int
}

