//
//  CreateGoalViewController.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 02/09/23.
//

import UIKit

protocol CreateGoalDisplayLogic: NSObject {
  func displayCreateForm()
  func displayEditForm(viewModel: CreateGoal.PrepareGoal.ViewModel)
  func displaySavedGoalCallback(viewModel: CreateGoal.SaveGoal.ViewModel)
  func displayDeletedGoalCallback()
}

class CreateGoalViewController: UIViewController, CreateGoalDisplayLogic {
  var interactor: CreateGoalBusinessLogic?
  
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
    let interactor = CreateGoalInteractor()
    let presenter = CreateGoalPresenter()
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    prepareForm()
  }
  
  @IBOutlet weak var titleNavigation: UINavigationItem!
  
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var bookTitleTextField: UITextField!
  @IBOutlet weak var totalPagesTextField: UITextField!
  @IBOutlet weak var timerDurationPicker: UIDatePicker!
  
  @IBOutlet weak var createButton: UIButton!
  @IBOutlet weak var updateButton: UIButton!
  @IBOutlet weak var deleteButton: UIButton!
  
  @IBAction func didCreateButtonTapped(_ sender: Any) {
    let request = CreateGoal.SaveGoal.Request(title: bookTitleTextField.text, total: totalPagesTextField.text, timer: timerDurationPicker.countDownDuration)
    interactor?.saveGoal(request: request)
  }
  
  @IBAction func didUpdateButtonTapped(_ sender: Any) {
    let request = CreateGoal.SaveGoal.Request(title: bookTitleTextField.text, total: totalPagesTextField.text, timer: timerDurationPicker.countDownDuration)
    interactor?.saveGoal(request: request)
  }
  
  @IBAction func didDeleteButtonTapped(_ sender: Any) {
    interactor?.deleteGoal()
  }
  
  func prepareForm() {
    interactor?.prepareForm()
  }
  
  func displayCreateForm() {
    titleNavigation.title = "Create Goal"
    updateButton.isHidden = true
    deleteButton.isHidden = true
  }
  
  func displayEditForm(viewModel: CreateGoal.PrepareGoal.ViewModel) {
    titleNavigation.title = "Edit Goal"
    createButton.isHidden = true
    
    bookTitleTextField.text = viewModel.title
    totalPagesTextField.text = viewModel.total
    timerDurationPicker.countDownDuration = viewModel.timer
  }
  
  func displaySavedGoalCallback(viewModel: CreateGoal.SaveGoal.ViewModel) {
    errorLabel.text = viewModel.message
    errorLabel.isHidden = viewModel.isSuccess
    
    if viewModel.isSuccess {
      dismiss(animated: true)
    }
  }
  
  func displayDeletedGoalCallback() {
    dismiss(animated: true)
  }
}
