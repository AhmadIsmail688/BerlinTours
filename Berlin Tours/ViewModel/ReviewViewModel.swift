//
//  ReviewViewModel.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/18/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import Foundation

class ReviewViewModel: Identifiable {
    
    let authorName: String
    let authorCountry: String
    let authorPhotoUrl: URL?
    
    let title: String
    let message: String
    let enjoyment: String
    
    let rating: Int
    let creationDate: String
    let language: String
    let travelerType: String?

    
    init(review: Review) {
        authorName = review.author.fullName
        authorCountry = review.author.country
        authorPhotoUrl = review.author.photo
        
        title = review.title
        message = review.message
        enjoyment = review.enjoyment
        
        rating = review.rating
        creationDate = SpecialDateFormatter.uiFormat.string(from: review.created)
        
        language = review.language
        travelerType = review.travelerType
    }
    
}
