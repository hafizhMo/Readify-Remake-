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
  private var timer = Timer()
  private var progress: Float?
  private var progressTotal: Float?
  private let worker = FocusModeWorker()
  
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
    if isPlaying {
      timer.invalidate()
    } else {
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(playTimer), userInfo: nil, repeats: true)
    }
    
    isPlaying.toggle()
    
    playButton.setImage(isPlaying ? UIImage(systemName: "pause") : UIImage(systemName: "play"), for: .normal)
    playButton.setTitle(isPlaying ? "Pause" : "Resume", for: .normal)
  }
  
  func displayTimer(viewModel: FocusMode.Timer.ViewModel) {
    timerProgressView.transform = timerProgressView.transform.scaledBy(x: 1, y: 8)
    timerProgressView.layer.masksToBounds = true
    timerProgressView.layer.cornerRadius = 8

    timerProgressView.progress = 1
    timerLabel.text = viewModel.timer
    
    progress = viewModel.progress
    progressTotal = viewModel.progress
  }
  
  @objc func playTimer() {
    let currentProgress = (progress! - 1) / progressTotal!
    timerProgressView.setProgress(currentProgress, animated: true)
    
    if progress! > 0 {
      progress! -= 1
      timerLabel.text = worker.formatTimer(s: Int(progress!))
    } else {
      timer.invalidate()
      routeToUpdateProgress()
    }
  }
  
  func pauseTimer() {
    
  }
  
  func stopTimer() {
    
  }
  
  private func routeToUpdateProgress() {
    if let destination = self.storyboard?.instantiateViewController(withIdentifier: "UpdateProgressViewController") {
      destination.modalPresentationStyle = .fullScreen
      
      self.dismiss(animated: false)
      self.presentingViewController?.present(destination, animated: true)
    }
  }
}
