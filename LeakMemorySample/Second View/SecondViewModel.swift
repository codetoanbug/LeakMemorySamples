//
//  SecondViewModel.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/02.
//

import Foundation

class SecondViewModel {
    var needClosure: (() -> Void)?
    private var showLockPopupTimer: Timer?
    var dumData: [Int] = []

    init() {

        // Fake lange memory use for data
        DispatchQueue.global(qos: .background).async {[weak self] in
            for index in 0...10000000 {
                self?.dumData.append(index)
            }
        }
    }
    func requestDumpAPI() {
        // Make time out to fake api time out request
        showLockPopupTimer?.invalidate()
        showLockPopupTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.needClosure?()
        })
    }
    
}
