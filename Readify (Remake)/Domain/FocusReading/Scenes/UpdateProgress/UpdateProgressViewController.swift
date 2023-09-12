//
//  UpdateProgressViewController.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 02/09/23.
//

import UIKit

protocol UpdateProgressDisplayLogic: NSObject {
  func displayUpdatedCallback(message: String?)
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
    routeToComplete()
  }
  
  func displayUpdatedCallback(message: String?) {
    dismiss(animated: true)
  }
  
  
  private func routeToComplete() {
    if let destination = self.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") {
      destination.modalPresentationStyle = .fullScreen
      
      self.dismiss(animated: false)
      self.presentingViewController?.present(destination, animated: true)
    }
  }
}
