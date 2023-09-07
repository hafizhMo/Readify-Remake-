//
//  FocusModeViewController.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 02/09/23.
//

import UIKit

protocol FocusModeDisplayLogic: NSObject {
  func displayTimer(viewModel: FocusMode.Timer.ViewModel)
  func playTimer()
  func pauseTimer()
  func stopTimer()
}

class FocusModeViewController: UIViewController, FocusModeDisplayLogic {
  var interactor: FocusModeBusinessLogic?
  
  private var isPlaying = false
  
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
    let interactor = FocusModeInteractor()
    let presenter = FocusModePresenter()
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactor?.prepareTimer()
  }
  
  @IBOutlet weak var timerProgressView: UIProgressView!
  @IBOutlet weak var timerLabel: UILabel!
  
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var playButton: UIButton!
  
  
  @IBAction func didCancelButtonTapped(_ sender: Any) {
     dismiss(animated: true)
  }
  
  @IBAction func didPlayButtonTapped(_ sender: Any) {
    isPlaying.toggle()
    playButton.setImage(isPlaying ? UIImage(systemName: "pause") : UIImage(systemName: "play"), for: .normal)
    playButton.setTitle(isPlaying ? "Pause" : "Resume", for: .normal)
  }
  
  func displayTimer(viewModel: FocusMode.Timer.ViewModel) {
    timerProgressView.transform = timerProgressView.transform.scaledBy(x: 1, y: 8)
    timerProgressView.layer.masksToBounds = true
    timerProgressView.layer.cornerRadius = 8

    timerProgressView.progress = viewModel.progress
    timerLabel.text = viewModel.timer
  }
  
  @objc func playTimer() {
    
  }
  
  func pauseTimer() {
    
  }
  
  func stopTimer() {
    
  }
}
