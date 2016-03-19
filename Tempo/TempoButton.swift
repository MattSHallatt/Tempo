//
//  TempoButton.swift
//  Tempo
//
//  Created by Matthew Hallatt on 09/05/2015.
//  Copyright (c) 2015 Matthew Hallatt. All rights reserved.
//

import Foundation
import UIKit

class TempoButton : UIView {
  
  var tempo: Double
  
  var previousTapDate: NSDate
  
  var tempoTimer: NSTimer?
  
  var label: UILabel
  
  required init(coder aDecoder: NSCoder) {
    
    tempo = 0.0
    
    previousTapDate = NSDate()
    
    label = UILabel.new()
    
    super.init(coder: aDecoder)
  }
  
  override func awakeFromNib() {
    
    super.awakeFromNib()
    
    self.setupLabel()
  }
  
  func setupLabel() {
    
    label.textAlignment = .Center
    label.textColor = .darkGrayColor()
    label.font = UIFont.systemFontOfSize(45.0, weight: 32.0)
    addSubview(label)
    
    self.updateTempo(0.0)
  }
  
  func updateTempo(newTempo: Double) {
    
    if(newTempo <= 0.0 || newTempo == tempo) {
      return;
    }
    
    tempoTimer?.invalidate()
    tempoTimer = nil
    tempoTimer = NSTimer.scheduledTimerWithTimeInterval(60.0/tempo, target: self, selector: Selector("fireTimer"), userInfo: nil, repeats: true)
    
    tempo = newTempo
    
    self.updateTempoLabel(tempo)
  }
  
  func updateTempoLabel(value: Double) {
    label.text = String(format:"%.0f", value)
  }
  
  func fireTimer() {
    
    var nextFireInterval = 60.0/(tempo > 0.0 ? tempo : 60.0)
    
    if (nextFireInterval > 0) {
      animateBackground(nextFireInterval)
    }
  }
  
  func animateBackground(duration: Double) {
    
    backgroundColor = .whiteColor()
    UIView.animateWithDuration(duration, delay: 0.0, options:.AllowUserInteraction, animations: { () -> Void in
      self.backgroundColor = .lightGrayColor()
    }, completion: nil)
  }
  
  override func layoutSubviews() {
    
    super.layoutSubviews()
    
    layer.cornerRadius = frame.width/2
    
    label.frame = CGRect(x: 40.0, y: self.bounds.height/2 - 40.0, width: self.bounds.width - 80.0, height: 80.0)
  }
  
  override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    
    super.touchesEnded(touches, withEvent: event)
    
    let difference = NSDate().timeIntervalSinceDate(previousTapDate)
    
    updateTempo(60/difference)
    
    previousTapDate = NSDate()
  }
  
}