//
//  FocusModePresenter.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 07/09/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FocusModePresentationLogic {
  func presentTimer(response: FocusMode.Timer.Response)
}

class FocusModePresenter: FocusModePresentationLogic {
  weak var viewController: FocusModeDisplayLogic?
  
  func presentTimer(response:FocusMode.Timer.Response) {
    let viewModel = FocusMode.Timer.ViewModel(timer: response.timer, progress: 5)
    viewController?.displayTimer(viewModel: viewModel)
  }
}
