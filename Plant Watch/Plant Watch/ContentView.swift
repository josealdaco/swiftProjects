//
//  ContentView.swift
//  Plant Watch
//
//  Created by Jose Arellanes on 1/7/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import SwiftUI
import UIKit

/*****************
 Global variables below
******************/

var timer:Double = 0.0
struct ContentView: View {
    var body: some View {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timerCheck in
            timer += 1.0
            
            if timer == 5.0{
                
            }
    })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
