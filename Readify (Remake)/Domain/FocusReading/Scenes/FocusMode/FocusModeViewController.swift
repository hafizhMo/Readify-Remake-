//
//  FocusModeViewController.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 02/09/23.
//

import UIKit

class FocusModeViewController: UIViewController {
  
  private var isPlaying = false
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  private func setup() {}
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    timerProgressView.transform = timerProgressView.transform.scaledBy(x: 1, y: 8)
    timerProgressView.layer.masksToBounds = true
    timerProgressView.layer.cornerRadius = 8
    timerLabel.text = "00:00"
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
}
