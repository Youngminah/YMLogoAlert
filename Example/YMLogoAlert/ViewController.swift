//
//  ViewController.swift
//  YMLogoAlert
//
//  Created by Youngminah on 10/12/2021.
//  Copyright (c) 2021 Youngminah. All rights reserved.
//

import UIKit
import YMLogoAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        YMLogoAlert(title: "For Test",color: .systemTeal , buttonStyle: .confirmAndCancel, okCompletion: nil)
            .showAlert(in: view)
    }
    
    @IBAction func showAlert2(_ sender: UIButton) {
        YMLogoAlert(title: "For Test",message: "For Test", color: .systemTeal , completion: nil)
            .showAlert(in: view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

