//
//  GoalUserDefaultWorker.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 03/09/23.
//

import Foundation

class GoalUserDefaultWorker {
  func getTitle() -> String? {
    let titleBook = SharedPreference.getString(key: .bookTitle)
    return titleBook.isEmpty ? nil : titleBook
  }
  
  func getTotal() -> Int? {
    let totalPages = SharedPreference.getInt(key: .totalPages)
    return totalPages == 0 ? nil : totalPages
  }
  
  func getProgress() -> Int {
    let progress = SharedPreference.getInt(key: .progress)
    return progress
  }
  
  func getTimer() -> Double? {
    let timer = SharedPreference.getDouble(key: .timer)
    return timer == 0 ? nil : timer
  }
}
