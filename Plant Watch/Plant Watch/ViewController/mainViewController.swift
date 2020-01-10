//
//  mainViewController.swift
//  Plant Watch
//
//  Created by Jose Arellanes on 1/7/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

    struct ContentView: View {

        /*
         This file controlles Both Views
         */
        
        
        @State var notice = IconView().trigger{
            didSet{
                print("State has changed")
            }
        }
        var body: some View {
            VStack{
                userView() // Have the SplashScreen go First
                    .overlay(IconView())
        }
            
            
        }
}


    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }

