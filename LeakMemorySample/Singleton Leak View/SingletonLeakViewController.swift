//
//  SingletonLeakViewController.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/14.
//

import UIKit

class SingletonLeakViewController: BaseViewController {
//    var alertViewHandleLogic: AlertViewHandleLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
//        alertViewHandleLogic = AlertViewHandleLogic.shared
        // Step cakkback by closure
//        alertViewHandleLogic.needShowAlertView = { [weak self] in
//            print("need show here")
//        }

        AlertViewHandleLogic.shared.addObserver(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AlertViewHandleLogic.shared.removeObserver(self)
    }

    deinit {
        NSLog("free memory SingletonLeakViewController")
    }

    /// Remove observers
    func removeObservers() {
        AlertViewHandleLogic.shared.removeObserver(self)
    }
}

extension SingletonLeakViewController: AlertViewHandleLogicDelegate {
    func needShowAlertView(sender: AlertViewHandleLogic) {
        print("need show here")
    }
}
