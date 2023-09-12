//
//  UserDefaultWorker.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 03/09/23.
//

import Foundation

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

enum PrefKeys: String {
  case goal
}

struct SharedPreference {
  static let pref = UserDefaults.standard
  
  static func commit() {
    pref.synchronize()
  }
  
  static func saveBool(key: PrefKeys, value: Bool) {
    pref.set(value, forKey: key.rawValue)
    commit()
  }
  
  static func saveInt(key: PrefKeys, value: Int) {
    pref.set(value, forKey: key.rawValue)
    commit()
  }
  
  static func saveDouble(key: PrefKeys, value: Double) {
    pref.set(value, forKey: key.rawValue)
    commit()
  }
  
  static func saveString(key: PrefKeys, value: String) {
    pref.set(value, forKey: key.rawValue)
    commit()
  }
  
  static func getString(key: PrefKeys) -> String {
    if let string = pref.string(forKey: key.rawValue) {
      return string
    }
    return ""
  }
  
  static func getBool(key: PrefKeys) -> Bool {
    if pref.bool(forKey: key.rawValue) {
      return pref.bool(forKey: key.rawValue)
    }
    return false
  }
  
  static func getInt(key: PrefKeys) -> Int {
    return pref.integer(forKey: key.rawValue)
  }
  
  static func getDouble(key: PrefKeys) -> Double {
    return pref.double(forKey: key.rawValue)
  }
}
