//
//  mainView.swift
//  Plant Watch
//
//  Created by Jose Arellanes on 1/7/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//
//         icon.autoSetDimension(.height, toSize:screenSize.width / 3)
//            icon.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)


import Foundation
import UIKit
import SwiftUI
import PureLayout
var checker = false{
    didSet{
        print("it is true")
    }
}



struct IconView: View{
    @State var timer = 0
    @State var inverval = 1.0
    @State var view_Bright = 1.0
    @State var trigger = false
    @State var secondTrigger = false{
         didSet{
            screenTime()
        }
    }
  @State var percent = 0.0
    @State var bright = 0.0
  let uLineWidth: CGFloat = 10
    var body: some View{
    VStack(spacing:40){
            // Text("Hello")
              //  .font(.title)
                //.foregroundColor(.green)
            FuberU(percent: percent)
            .stroke(Color.green, lineWidth: uLineWidth)
            .onAppear() {
              self.handleAnimations()
              self.restartAnimation()
            }
           
            .frame(width: 125, height: 125, alignment: .center)
            Text("Welcome to Plant Watcher")
            .font(.title)
            .foregroundColor(.green)
            .opacity(bright)
               }
            .frame(minWidth:0, maxWidth: .infinity, minHeight:0, maxHeight: .infinity, alignment: .center)
    .background(Color.black)
  .opacity(view_Bright)
  .deleteDisabled(true)
  .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
    self.percent = 0.0
    self.timer = 0
    self.handleAnimations()
    self.restartAnimation()
    self.trigger = false
    self.secondTrigger = false
    self.bright = 0.0
    self.view_Bright = 1.0
        }
        // first animation without repeating
}
    struct FuberU: Shape {
      var percent: Double
      
      // 1
      func path(in rect: CGRect) -> Path {
        let end = percent * 360
        var p = Path()

        // 2
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/2,
                 startAngle: Angle(degrees: 0),
                 endAngle: Angle(degrees: end),
                 clockwise: false)
        
        return p
      }
        
        
      // 3
      var animatableData: Double {
        get { return percent }
        set { percent = newValue }
      }
    }
    func screenTime(){
        weak var screenTimer: Timer?
        screenTimer?.invalidate()
        screenTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timerCheck in
        if(self.timer == 5){
            timerCheck.invalidate()
            self.timer = 0
            self.view_Bright = 0.0
            
        }
        else{
            
        }
        self.timer = self.timer + 1
         })
    }
    
};extension IconView {
  var uAnimationDuration: Double { return 2.0 }
    
  func handleAnimations() {
    runAnimationPart1()
  }
 
    func checker(){
        trigger = true
        bright = 1.0
        secondTrigger = true
    }

  func runAnimationPart1() {
    withAnimation(.easeIn(duration: uAnimationDuration)) {
        percent = 1.0
    }
  }
    func restartAnimation(){
      let deadline: DispatchTime = .now() + uAnimationDuration
      DispatchQueue.main.asyncAfter(deadline: deadline) {
        /// Once circle is complete
        print("Circle is complete")
        self.checker()
      }
    }
}
