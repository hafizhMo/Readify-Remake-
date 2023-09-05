//
//  FocusModeViewController.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 02/09/23.
//

import UIKit

class FocusModeViewController: UIViewController {
  
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
  }
  
  @IBOutlet weak var timerProgressView: UIProgressView!
  @IBOutlet weak var timerLabel: UILabel!
  
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var playButton: UIButton!
  
  
  @IBAction func didCancelButtonTapped(_ sender: Any) {
  }
  
  @IBAction func didPlayButtonTapped(_ sender: Any) {
  }
}
