import Foundation
import UIKit
import SwiftUI
import CoreBluetooth
 /// Resource for recieving bluetooth data: stackoverflow.com/questions/35794107/swift-ble-communications
open class BLEConnection: NSObject, CBPeripheralDelegate, CBCentralManagerDelegate, ObservableObject {
    // Properties
    
    private var centralManager: CBCentralManager! = nil
    @Published var peripheral: CBPeripheral!
    @Published var connect = Color.red
    @Published var char: CBCharacteristic! = nil
    @Published var dataString = "PESS BUTTON"
    public static let bleServiceUUID = CBUUID.init(string: "FFE0")
    public static let bleCharacteristicUUID = CBUUID.init(string:   "FFE1")
    // Array to contain names of BLE devices to connect to.
    // Accessable by ContentView for Rendering the SwiftUI Body on change in this array.
    @Published var scannedBLEDevices: [String] = []

    func startCentralManager() {
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
        print("Central Manager State: \(self.centralManager.state)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.centralManagerDidUpdateState(self.centralManager)
        }
    }

    // Handles BT Turning On/Off
    // If we're powered on, start scanning
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
               print("Central state update")
               if central.state != .poweredOn {
                   print("Central is not powered on")
                connect = Color.red
               } else {
                print("Central scanning for", BLEConnection.bleServiceUUID);
                centralManager.scanForPeripherals(withServices: [BLEConnection.bleServiceUUID],
                                                     options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])
               }
           }


    // Handles the result of the scan
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {

         // We've found it so stop scan
         self.centralManager.stopScan()

         // Copy the peripheral instance
         self.peripheral = peripheral
        scannedBLEDevices.append("BOSAI PLANT")
         self.peripheral.delegate = self

         // Connect!
         self.centralManager.connect(self.peripheral, options: nil)

     }


    // The handler if we do connect successfully
     // The handler if we do connect succesfully
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
               if peripheral == self.peripheral {
                   print("Connected to your Particle Board")
                connect = Color.green
                peripheral.discoverServices([BLEConnection.bleServiceUUID])
               }
           }


    // Handles discovery event
      // Handles discovery event
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
            if let services = peripheral.services {
                print("List of services:", services)
                for service in services {
                    print("serviceID:", service.uuid)
                    if service.uuid == BLEConnection.bleServiceUUID {
                        print("LED service found")
                        //Now kick off discovery of characteristics
                        peripheral.discoverCharacteristics([BLEConnection.bleCharacteristicUUID], for: service)
                        return
                    }
                }
            }
        }
    
    // Handling discovery of characteristics
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
              if let characteristics = service.characteristics {
                  for characteristic in characteristics {
                      if characteristic.uuid == BLEConnection.bleCharacteristicUUID {
                          print("Characteristics found:", characteristic)
                        char = characteristic
                                   
                             /*
                         This is where the didUpdate value will occer.
                            */
                        //let data:UInt8 = UInt8(31)/// sends a 1 in uint8
                        
                        //peripheral.writeValue(Data([data]), for: characteristic, type: .withoutResponse)
                         //  peripheral.setNotifyValue(true, for: characteristic)
                      } else{
                        print("Not found")
                    }
                  }
                print("passed2", service.characteristics!)
              }
        print("passed")
          }
   
      public func writeLEDValueToChar( withCharacteristic characteristic: CBCharacteristic, withValue value: Data) {

              // Check if it has the write property
              if characteristic.properties.contains(.writeWithoutResponse) && peripheral != nil {
                    print("message Sent")
                  peripheral.writeValue(value, for: characteristic, type: .withoutResponse)
              }

          }
    
    public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if peripheral == self.peripheral {
                       print("Disconnected")
            connect = Color.red
            
            self.peripheral = nil
            scannedBLEDevices.removeAll()
            // Start scanning again
            startCentralManager()
        }
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {

        if (error != nil) {
            print("Error rading characteristics: \(String(describing: error))......)")
            return;
        }

        if (characteristic.value != nil) {
            //value here.

            print("value is : \(String(describing: characteristic.value))")
            let dataBLE = String(data: characteristic.value!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))

            print("Data from Arduino:\(dataBLE!)")
            dataString = dataBLE!
        }
        
    }
    

}
