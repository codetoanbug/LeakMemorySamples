//
//  AlertViewHandleLogic.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/14.
//

import Foundation

class AlertViewHandleLogic {
    // For lock screen
    private var showLockPopupTimer: Timer?
    private var timeLockCountDown: TimeInterval
    var needShowAlertView: (() -> Void)?

    private init() {
        self.timeLockCountDown = 5
    }

    static let shared = AlertViewHandleLogic()

    /// Reset show alert timer
    func resetShowAlertTimer() {
        showLockPopupTimer?.invalidate()
        showLockPopupTimer = Timer.scheduledTimer(withTimeInterval: timeLockCountDown, repeats: true, block: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.needShowAlertView?()
        })
    }
}
