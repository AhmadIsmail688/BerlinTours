//
//  DummyData.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/18/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import Foundation

struct ReviewDummyData {
    
    static let exampleJsonString = """
        {
            "id": 11498751,
            "author": {
                "fullName": "Mladen",
                "country": "Germany",
                "photo": "https://cdn.getyourguide.com/img/customer_img-25895022-3723075747-11.jpg"
            },
            "title": "Great guide and interesting tour to Tempelhof airport",
            "message": "Airport with great history, depicts the years around WWII and Cold war very well. The tour is outside of the building 40% of time, so don't leave the jackets in the reception if you are visiting during colder months.",
            "enjoyment": "Architecture of the building, its magificence, especially the tall cielings",
            "isAnonymous": false,
            "rating": 4,
            "created": "2020-01-05T21:07:55+01:00",
            "language": "en"
        }
    """
    
    static var exampleReview: Review {
        let jsonData = exampleJsonString.data(using: .utf8) ?? Data()
        let jsonDecoder = JsonDecoder.defaultDecoder
        let review = try! jsonDecoder.decode(Review.self, from: jsonData)
        return review
    }

}
