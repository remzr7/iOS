//
//  ViewController.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/13/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Test if event response is coming
    let events = NetworkHelper.getAllEvents()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

