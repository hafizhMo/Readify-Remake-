//
//  CurrentGoalModels.swift
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

enum CurrentGoal {
  
  enum ShowGoal {
    struct Request {}
    
    struct Response {
      var title: String
      var total: Int
      var progress: Int
    }
    
    struct ViewModel {
      var title: String
      var percentage: Double
      var progressStr: String
      var percentageStr: String
    }
  }
  
  enum ShowStreak {
    struct Request {}
    
    struct Response {
      var day: Int
      var week: Int
      var items: [(StreakType, String)]
    }
    
    struct ViewModel {
      var dayAndWeek: String
      var items: [(StreakType, String)]
    }
  }
  
}

enum StreakType {
  case passed
  case current
  case upcoming
}
