//
//  SingletonLeakViewController.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/14.
//

import UIKit

class SingletonLeakViewController: BaseViewController {
    var alertViewHandleLogic: AlertViewHandleLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
        alertViewHandleLogic = AlertViewHandleLogic.shared
        alertViewHandleLogic.needShowAlertView = { [weak self] in
            print("need show here")
        }

        alertViewHandleLogic.resetShowAlertTimer()
    }

}
