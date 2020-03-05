//
//  Profile.swift
//  onBoardApp
//
//  Created by Jose Arellanes on 2/17/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import SwiftUI


struct Profile: View {
    
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .center) {
                Text("Deep Sleep Needed")
                    .font(.title)
                    .padding()
                    .foregroundColor(.black)

                Text("San Francisco, CA")
                    .font(.subheadline)
                .foregroundColor(.black)

                Text("Drifting off nation wide")
                    .font(.subheadline)
                .foregroundColor(.black)

            }
            .padding()

        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
