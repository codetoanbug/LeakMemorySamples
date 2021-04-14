//
//  FirstTableViewCell.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/14.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!

    func bindData(data: FirstViewModel.LeakType) {
        contentLabel.text = data.description
    }
    
}
