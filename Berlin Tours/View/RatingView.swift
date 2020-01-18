//
//  RatingView.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/18/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Int
    
    var imageNamesArray: [String] {
        let filledStarArray = [String](repeating: "star.fill", count: rating)
        let emptyStarArray = [String](repeating: "star", count: 5 - rating)
        return filledStarArray + emptyStarArray
    }
    
    var body: some View {
        HStack {
            ForEach(imageNamesArray, id: \.self) { imageName in
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4)
    }
}
