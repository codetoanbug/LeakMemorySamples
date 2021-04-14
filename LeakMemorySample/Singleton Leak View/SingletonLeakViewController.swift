//
//  SingletonLeakViewController.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/14.
//

import UIKit

class SingletonLeakViewController: UIViewController {
    var alertViewHandleLogic: AlertViewHandleLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
        alertViewHandleLogic = AlertViewHandleLogic()
    }

}
