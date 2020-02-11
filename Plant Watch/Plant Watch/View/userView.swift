//
//  userView.swift
//  Plant Watch
//
//  Created by Jose Arellanes on 1/8/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import SwiftUI
var connection = false{
      didSet{
          print("Connection made")
      }
  }
 /// Temparary default responses
var randomSpeaks = ["SIKE!😂", "In Progress...", "HOLD TF UP", "V.2 soon", "Nopeee"]
var toggle = false
struct userView:View{
  
    @ObservedObject var bleConnection = BLEConnection()
    @State var timer = 0
    @State private var showGreeting = false
    var body: some View{
        VStack{
            Text("Connection: ")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Rectangle()
                .frame(width:50, height:50, alignment: .center )
                .foregroundColor(bleConnection.connect)
            Spacer()
            Toggle(isOn:$showGreeting){
                Text("AUTOSAVE")
            }.padding()
           List(bleConnection.scannedBLEDevices, id: \.self) { device in
                                     Text(verbatim: device)
                                 }
            Text(bleConnection.dataString)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer()
            Button(action:{
                 /*
                  This File is the main UI for bluetooth connections
                 */
                
                /// Place the Write to Arduino data here
                if(self.bleConnection.char != nil){
                    print("Characteristic found in the Front end\(String(describing: self.bleConnection.char))")
                    ///let number = Int.random(in: 0 ..< randomSpeaks.count)
                    ///self.dataString = randomSpeaks[number]
                    let data:UInt8 = UInt8(31)/// sends a 1 in uint8
                    self.bleConnection.writeLEDValueToChar( withCharacteristic: self.bleConnection.char, withValue: Data([data]));
                    self.bleConnection.peripheral.setNotifyValue(true, for: self.bleConnection.char)
                
                    toggle = true
                    
                }
 
            
            }){
                Text("GET DATA")
                    .foregroundColor(.white)
                    .frame(width:UIScreen.main.bounds.size.width, height:75 , alignment: .center)
                    .font(.title)
                    .background(Color.green)
            }
      
            
        }
        .onAppear(perform: connectBLEDevice)
            
            
            
        .frame(minWidth:0, maxWidth: .infinity, minHeight:0, maxHeight: .infinity, alignment: .center)
        .background(Color.init(UIColor.darkGray))
    }
   
    
    private func connectBLEDevice(){
           // Start Scanning for BLE Devices
           bleConnection.startCentralManager()
       }
    
}

struct userView_Previews:PreviewProvider{
    static var previews: some View{
        userView()
    }
}




