//
//  ViewController.swift
//  Tempo
//
//  Created by Matthew Hallatt on 09/05/2015.
//  Copyright (c) 2015 Matthew Hallatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WatchResponder {
  
  @IBOutlet weak var tempoButton: TempoButton?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDelegate.watchResponder = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func currentTempo() -> Double? {
    return tempoButton?.tempo
  }
  
  @IBAction func increaseTempo() {
    let currentTempo = tempoButton?.tempo
    tempoButton?.updateTempo(currentTempo! + 1)
  }
  
  @IBAction func decreaseTempo() {
    let currentTempo = tempoButton?.tempo
    tempoButton?.updateTempo(currentTempo! - 1)
  }
  
  func watchIsRequestingResponseFromRequest(request: [NSObject : AnyObject]) -> ([NSObject : AnyObject]!) {
    self.view.backgroundColor = .redColor()
    
    return ["response" : currentTempo()!]
  }
  
}

