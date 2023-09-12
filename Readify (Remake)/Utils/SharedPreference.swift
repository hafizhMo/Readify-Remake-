//
//  UserDefaultWorker.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 03/09/23.
//

import Foundation

enum PrefKeys: String {
  case goal
  case streak
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
