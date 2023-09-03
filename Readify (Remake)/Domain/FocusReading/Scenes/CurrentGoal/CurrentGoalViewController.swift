//
//  CurrentGoalViewController.swift
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

protocol CurrentGoalDisplayLogic {
  func displayGoal(viewModel: CurrentGoal.ShowGoal.ViewModel)
  func displayPlaceholder()
}

class CurrentGoalViewController: UIViewController, CurrentGoalDisplayLogic {
  var interactor: CurrentGoalBusinessLogic?
  var router: (NSObjectProtocol & CurrentGoalRoutingLogic & CurrentGoalDataPassing)?
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  private func setup() {
    let viewController = self
    let interactor = CurrentGoalInteractor()
    let presenter = CurrentGoalPresenter()
    let router = CurrentGoalRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    doSomething()
  }
  
  @IBOutlet weak var circularProgressBar: UIView!
  
  @IBOutlet weak var progressByPagesLabel: UILabel!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var progressPercentageLabel: UILabel!
  @IBOutlet weak var yourProgressLabel: UILabel!
  @IBOutlet weak var dayAndWeekStreakLabel: UILabel!
  
  @IBOutlet weak var currentGoalView: UIView!
  @IBOutlet weak var emptyGoalView: UIView!
  
  @IBAction func didSetNewGoalTapped(_ sender: Any) {
  }
  
  @IBAction func didContinueReadingTapped(_ sender: Any) {
  }
  
  @IBAction func didEditGoalTapped(_ sender: Any) {
  }
  
  @IBAction func didCompleteTapped(_ sender: Any) {
  }
  
  func doSomething() {
    let request = CurrentGoal.ShowGoal.Request()
    interactor?.showGoal(request: request)
  }
  
  func displayGoal(viewModel: CurrentGoal.ShowGoal.ViewModel) {
    yourProgressLabel.isHidden = false
    currentGoalView.isHidden = false
    emptyGoalView.isHidden = true
    
    bookTitleLabel.text = viewModel.title
    progressByPagesLabel.text = viewModel.progressStr
    progressPercentageLabel.text = viewModel.percentageStr
  }
  
  func displayPlaceholder() {
    yourProgressLabel.isHidden = true
    currentGoalView.isHidden = true
    emptyGoalView.isHidden = false
  }
}
