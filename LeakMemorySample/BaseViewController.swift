//
//  BaseViewController.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/14.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /// Show alert
    func showAlert() {
        // Just show one screen on top view
        if let topVC = UIApplication.getTopViewController(),
           topVC is UIAlertController {
            return
        }

        let alertVC = UIAlertController(title: "", message: "Hello from codetoanbug.com", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

}
