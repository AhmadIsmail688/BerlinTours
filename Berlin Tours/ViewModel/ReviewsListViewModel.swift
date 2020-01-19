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
    
    var nextPageIndex = 1
    var shouldLoadMore = false
    
    init() {
        loadReviews(page: nextPageIndex)
    }
    
    func loadReviews(page: Int) {
        NetworkManager.getReviews(page: page) { [weak self] (reviewsResponse, error, success) in
            if success, let reviewsResponse = reviewsResponse {
                self?.reviews.append(
                    contentsOf: reviewsResponse.reviews.map{ReviewViewModel(review: $0)}
                )
                self?.nextPageIndex += 1
                self?.shouldLoadMore = reviewsResponse.totalCount > reviewsResponse.pagination.offset + reviewsResponse.pagination.limit
            }
        }
    }
    
    func loadMore(currentItem: ReviewViewModel) {
        if !shouldLoadMore {return}
        guard let lastItem = reviews.last, currentItem.id == lastItem.id else {return}
        loadReviews(page: nextPageIndex)
    }
    
}
