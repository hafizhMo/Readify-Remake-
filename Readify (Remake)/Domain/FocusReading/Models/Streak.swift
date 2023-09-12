//
//  Streak.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 12/09/23.
//

import Foundation

@objc public class Streak: NSObject, Codable {
  var day: Int
  var latestDate: Date
  
  init(day: Int, latestDate: Date = Date.yesterday) {
    self.day = day
    self.latestDate = latestDate
  }
}

extension UserDefaults {
  @objc dynamic var streak: Streak? {
    set {
      if let data = newValue {
        let streak = try? JSONEncoder().encode(data)
        setValue(streak, forKey: PrefKeys.streak.rawValue)
      } else {
        removeObject(forKey: PrefKeys.streak.rawValue)
      }
    }
    
    get {
      if let data = object(forKey: PrefKeys.streak.rawValue) as? Data {
        let streak = try? JSONDecoder().decode(Streak.self, from: data)
        return streak
      }
      
      return nil
    }
  }
}

extension Date {
  static var yesterday: Date { return Date().dayBefore }
  static var tomorrow:  Date { return Date().dayAfter }
  var dayBefore: Date {
    return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
  }
  var dayAfter: Date {
    return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
  }
  var noon: Date {
    return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
  }
  var month: Int {
    return Calendar.current.component(.month,  from: self)
  }
  var isLastDayOfMonth: Bool {
    return dayAfter.month != month
  }
}
