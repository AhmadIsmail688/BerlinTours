//
//  ReviewView.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/18/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import SwiftUI

struct ReviewView: View {
    
    var review: ReviewViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .center) {
                UserImageView(imageUrl: review.authorPhotoUrl)
                VStack(alignment: .leading, spacing: 5) {
                    Text(review.authorNameAndCountry)
                    Text(review.creationDate)
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    RatingView(rating: review.rating)
                }
            }
            
            VStack(alignment: .leading, spacing: 5.0) {
                review.title.isEmpty ? nil : Text(review.title)
                    .font(.headline)
                review.message.isEmpty ? nil : Text(review.message)
                review.enjoyment.isEmpty ? nil : Text(review.enjoyment)
                    .foregroundColor(.gray)
            }
                
                
        }
        .padding(.all, 7.0)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(review: ReviewViewModel(review: ReviewDummyData.exampleReview))
    }
}
