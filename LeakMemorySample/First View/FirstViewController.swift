//
//  ViewController.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/02.
//

import UIKit

class FirstViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: FirstViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bindViewModel()
        self.initTableView()
    }
  
    /// Init table view
    private func initTableView() {
        self.tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
        self.tableView.tableFooterView = UIView()
    }

    /// Bind view model
    private func bindViewModel() {
        viewModel = FirstViewModel()
        self.viewModel.needHandleWithLeakType = { [weak self] leakType in
            self?.handleLeakTypeLogic(leakType: leakType)
        }
    }

    /// Handle leak type logic
    /// - Parameter leakType: leakType from cell
    private func handleLeakTypeLogic(leakType: FirstViewModel.LeakType) {
        switch leakType {
        case .inClosure:
            let secondViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case .inSingleton:
            let singletonLeakViewController = SingletonLeakViewController(nibName: "SingletonLeakViewController", bundle: nil)
            self.navigationController?.pushViewController(singletonLeakViewController, animated: true)
        }
    }

    deinit {
        NSLog("free memory FirstViewController")
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as! FirstTableViewCell
        cell.bindData(data: self.viewModel.dataCellForRowAt(index: indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didSelectRowAt(index: indexPath.row)
    }
}

