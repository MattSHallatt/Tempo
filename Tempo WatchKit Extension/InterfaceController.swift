//
//  InterfaceController.swift
//  Tempo WatchKit Extension
//
//  Created by Matthew Hallatt on 18/05/2015.
//  Copyright (c) 2015 Matthew Hallatt. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
  
  @IBOutlet weak var tempoButton: WKInterfaceButton!
  @IBOutlet weak var tempoLabel: WKInterfaceLabel!
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
  }
  
  @IBAction func tempoButtonTapped(sender: UIButton!) {
    tempoLabel.setText("Updating tempo...")
    
    WKInterfaceController.openParentApplication(["request" : "tempo"],
      reply: {(reply, error) -> Void in
        if (error != nil) {
          NSLog("Error")
        } else {
          let responseString = reply["response"] as? Double
          self.tempoLabel.setText(String(format:"%.0f", responseString!))
        }
    })
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
}
