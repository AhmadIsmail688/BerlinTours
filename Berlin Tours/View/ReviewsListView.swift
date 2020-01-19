//
//  ReviewsListView.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/17/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import SwiftUI

struct ReviewsListView: View {
    
    @ObservedObject var reviewsListViewModel = ReviewsListViewModel()
    
    var body: some View {
        NavigationView {
            List(reviewsListViewModel.reviews) { review in
                ReviewView(review: review)
            }
            .navigationBarTitle("Reviews")
        }
    }
}

struct ReviewsListView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsListView()
    }
}
