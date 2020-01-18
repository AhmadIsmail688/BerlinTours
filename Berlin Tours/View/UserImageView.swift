//
//  UserImageView.swift
//  Berlin Tours
//
//  Created by Ahmad Ismail on 1/19/20.
//  Copyright © 2020 Ahmad Ismail. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct UserImageView: View {
    
    var imageUrl: URL?
    
    var body: some View {
        ZStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 65, height: 65)
                .foregroundColor(Color.gray)
            KFImage(imageUrl)
                .resizable()
                .frame(width: 65, height: 65)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

struct UserImageView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageView()
    }
}
