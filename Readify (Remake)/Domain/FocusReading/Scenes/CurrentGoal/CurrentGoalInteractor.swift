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
}

protocol CurrentGoalDataStore {}

class CurrentGoalInteractor: CurrentGoalBusinessLogic, CurrentGoalDataStore {
  var presenter: CurrentGoalPresentationLogic?
  var worker = GoalUserDefaultWorker()
  var subscriber: AnyCancellable?
  
  func showGoal(request: CurrentGoal.ShowGoal.Request) {
    subscriber = UserDefaults.standard
      .publisher(for: \.progress)
      .sink() { [weak self] in
        if let title = self?.worker.getTitle(), let total = self?.worker.getTotal() {
          let response = CurrentGoal.ShowGoal.Response(title: title, total: total, progress: $0)
          self?.presenter?.presentGoal(response: response)
        } else {
          self?.presenter?.presentPlaceholder()
        }
      }
  }
}
