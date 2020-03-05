//
//  Circle_image.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 3/5/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
    
        Image("sleep")
            .resizable()
            .scaledToFit()
            .frame(width: 200.0,height:200)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
