//
//  SecondViewController.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/02.
//

import UIKit

class SecondViewController: UIViewController {
    var viewModel: SecondViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Leak memory in closure"

        // Bind view model
        self.bindViewModel()
    }

    private func bindViewModel() {
        viewModel = SecondViewModel()
        viewModel.needClosure = {//[weak self] in
//            self?.view.backgroundColor = UIColor.random()
            self.view.backgroundColor = UIColor.random()
        }

        // Dump API
        viewModel.requestDumpAPI()
    }

    deinit {
        NSLog("free memory SecondViewController")
    }
}
