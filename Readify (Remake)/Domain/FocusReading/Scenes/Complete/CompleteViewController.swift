//
//  UpdateGoalViewController.swift
//  Readify (Remake)
//
//  Created by Hafizh Mo on 02/09/23.
//

import UIKit

class CompleteViewController: UIViewController {
  
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
  
  @IBAction func didBackHomeTapped(_ sender: Any) {
    dismiss(animated: true)
  }
}

