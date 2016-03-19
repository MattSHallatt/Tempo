//
//  WatchResponder.swift
//  Tempo
//
//  Created by Matthew Hallatt on 19/05/2015.
//  Copyright (c) 2015 Matthew Hallatt. All rights reserved.
//

import Foundation

protocol WatchResponder {
  
  func watchIsRequestingResponseFromRequest(request: [NSObject : AnyObject]) -> ([NSObject : AnyObject]!)
  
}