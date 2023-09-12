//
//  CurrentGoalInteractor.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 29/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Combine

protocol CurrentGoalBusinessLogic {
  func showGoal(request: CurrentGoal.ShowGoal.Request)
  func showStreak()
}

protocol CurrentGoalDataStore {}

class CurrentGoalInteractor: CurrentGoalBusinessLogic, CurrentGoalDataStore {
  var presenter: CurrentGoalPresentationLogic?
  var subscriber: AnyCancellable?
  var subscriber2: AnyCancellable?
  
  func showGoal(request: CurrentGoal.ShowGoal.Request) {
    subscriber = UserDefaults.standard
      .publisher(for: \.goal)
      .sink() { [weak self] goal in
        guard let goal = goal else {
          self?.presenter?.presentPlaceholder()
          return
        }
        
        let response = CurrentGoal.ShowGoal.Response(title: goal.title, total: goal.total, progress: goal.progress)
        self?.presenter?.presentGoal(response: response)
      }
  }
  
  func showStreak() {
    subscriber2 = UserDefaults.standard
      .publisher(for: \.streak)
      .sink() { [weak self] streak in
        guard let streak = streak else {
          UserDefaults.standard.streak = Streak(day: 0)
          return
        }
        
        let day = streak.day + 1
        let week = (day / 7) + (day % 7 == 0 ? 0 : 1)
        var items: [(StreakType, String)] = []
        
        let tempDay = day - (7 * (week - 1))
        for i in 1...7 {
          let realDay = String(i + (7 * (week - 1)))
          if i < tempDay {
            items.append((.passed, realDay))
          } else if i == tempDay {
            items.append((streak.latestDate == Date() ? .upcoming : .current, realDay))
          } else {
            items.append((.upcoming, realDay))
          }
        }
        
        let dayResponse = streak.latestDate == Date() ? streak.day : day
        let response = CurrentGoal.ShowStreak.Response(day: dayResponse, week: week, items: items)
        self?.presenter?.presentStreak(response: response)
      }
  }
}
