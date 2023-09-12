//
//  Goal.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 12/09/23.
//

import Foundation

@objc public class Goal: NSObject, Codable {
  var title: String
  var total: Int
  var timer: Double
  var progress: Int
  
  init(title: String, total: Int, timer: Double, progress: Int = 0) {
    self.title = title
    self.total = total
    self.timer = timer
    self.progress = progress
  }
}
