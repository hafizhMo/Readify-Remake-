//
//  UpdateGoalViewController.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 02/09/23.
//

import UIKit

protocol CompleteDisplayLogic: NSObjectProtocol {
  func displayCompleted()
}

class CompleteViewController: UIViewController, CompleteDisplayLogic {
  var interactor: CompleteBusinessLogic?
  
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
    let interactor = CompleteInteractor()
    let presenter = CompletePresenter()
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactor?.completeGoal()
  }
  
  @IBAction func didBackHomeTapped(_ sender: Any) {
    dismiss(animated: true)
  }
  
  @IBAction func didSetNewGoalTapped(_ sender: Any) {
    routeToCreateGoal()
  }
  
  private func routeToCreateGoal() {
    if let destination = self.storyboard?.instantiateViewController(withIdentifier: "CreateGoalViewController") {
      self.dismiss(animated: false)
      self.presentingViewController?.present(destination, animated: true)
    }
  }
  
  func displayCompleted() {}
}

