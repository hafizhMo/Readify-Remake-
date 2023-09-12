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

extension UserDefaults {
  @objc dynamic var goal: Goal? {
    set {
      if let data = newValue {
        let goal = try? JSONEncoder().encode(data)
        setValue(goal, forKey: PrefKeys.goal.rawValue)
      } else {
        removeObject(forKey: PrefKeys.goal.rawValue)
      }
    }
    
    get {
      if let data = object(forKey: PrefKeys.goal.rawValue) as? Data {
        let goal = try? JSONDecoder().decode(Goal.self, from: data)
        return goal
      }
      
      return nil
    }
  }
}
