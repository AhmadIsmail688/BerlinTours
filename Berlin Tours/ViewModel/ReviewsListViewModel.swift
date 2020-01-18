//
//  ReviewsListViewModel.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/18/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import Foundation

class ReviewsListViewModel: ObservableObject {
    
    @Published var reviews = [ReviewViewModel]()
    
    init() {
        NetworkManager.getReviews(page: 1) { [weak self] (reviewsResponse, error, success) in
            if success, let reviews = reviewsResponse?.reviews {
                self?.reviews = reviews.map{ReviewViewModel(review: $0)}
            }
        }
    }
    
}
