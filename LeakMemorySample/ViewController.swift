//
//  ViewController.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /// Open second view controller
    /// - Parameter sender: button action
    @IBAction func onButtonTouched(_ sender: Any) {
        let secondViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)     
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    deinit {
        NSLog("free memory ViewController")
    }
}

