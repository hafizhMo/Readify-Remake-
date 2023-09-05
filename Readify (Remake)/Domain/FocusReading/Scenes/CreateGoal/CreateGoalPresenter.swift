//
//  CreateGoalPresenter.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 05/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CreateGoalPresentationLogic {
  func presentSavedGoalCallback(response: CreateGoal.SaveGoal.Response)
  func presentEditForm(response: CreateGoal.PrepareGoal.Response)
  func presentCreateForm()
}

class CreateGoalPresenter: CreateGoalPresentationLogic {
  weak var viewController: CreateGoalDisplayLogic?
  
  func presentEditForm(response: CreateGoal.PrepareGoal.Response) {
    let viewModel = CreateGoal.PrepareGoal.ViewModel(title: response.title, total: String(response.total), timer: response.timer)
    viewController?.displayEditForm(viewModel: viewModel)
  }
  
  func presentCreateForm() {
    viewController?.displayCreateForm()
  }
  
  func presentSavedGoalCallback(response: CreateGoal.SaveGoal.Response) {
    let viewModel = CreateGoal.SaveGoal.ViewModel(isSuccess: response.isSuccess, message: response.message)
    viewController?.displaySavedGoalCallback(viewModel: viewModel)
  }
}