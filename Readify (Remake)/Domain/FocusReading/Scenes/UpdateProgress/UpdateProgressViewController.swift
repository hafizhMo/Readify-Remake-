//
//  UpdateProgressViewController.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 02/09/23.
//

import UIKit

protocol UpdateProgressDisplayLogic: NSObject {
  func displayUpdatedCallback(message: String?)
  func displayCompletedCallback()
}

class UpdateProgressViewController: UIViewController, UpdateProgressDisplayLogic {
  var interactor: UpdateProgressBusinessLogic?
  
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
    let interactor = UpdateProgressInteractor()
    let presenter = UpdateProgressPresenter()
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBOutlet weak var progressTextField: UITextField!
  
  @IBAction func didUpdateProgressTapped(_ sender: Any) {
    interactor?.updateProgress(progress: progressTextField.text)
  }
  
  @IBAction func didCompleteTapped(_ sender: Any) {
    interactor?.completeGoal()
  }
  
  func displayUpdatedCallback(message: String?) {
    dismiss(animated: true)
  }
  
  func displayCompletedCallback() {}
}
