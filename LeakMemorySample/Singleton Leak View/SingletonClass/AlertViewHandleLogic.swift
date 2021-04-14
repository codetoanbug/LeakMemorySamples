//
//  AlertViewHandleLogic.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/14.
//

import Foundation


protocol AlertViewHandleLogicDelegate: AnyObject {
    // Show alert view
    func needShowAlertView(sender: AlertViewHandleLogic)
}

class AlertViewHandleLogic {
    // Stores the list of observers to notify about server changes.
    private var observers: [AlertViewHandleLogicDelegate] = []

    // For lock screen
    private var showLockPopupTimer: Timer?
    private var timeLockCountDown: TimeInterval
//    var needShowAlertView: (() -> Void)?

    private init() {
        self.timeLockCountDown = 5
        self.resetShowAlertTimer()
    }

    static let shared = AlertViewHandleLogic()

    /// Reset show alert timer
    private func resetShowAlertTimer() {
        showLockPopupTimer?.invalidate()
        showLockPopupTimer = Timer.scheduledTimer(withTimeInterval: timeLockCountDown, repeats: true, block: { [weak self] _ in
            guard let strongSelf = self else { return }
            // Step call back
//            strongSelf.needShowAlertView?()

            // Step observer
            strongSelf.observers.forEach({ observer in
                observer.needShowAlertView(sender: strongSelf)
            })
        })
    }

    /// Add observer to listen action
    /// - Parameter observer: action delegate
    func addObserver(_ observer: AlertViewHandleLogicDelegate) {
        if !self.observers.contains(where: { $0 === observer }) {
            self.observers.append(observer)
        }
    }

    /// Remove observer in a view  or view controller
    /// - Parameter observer: observer from view need remove
    func removeObserver(_ observer: AlertViewHandleLogicDelegate) {
        guard let index = self.observers.firstIndex(where: { return $0 === observer }) else { return }
        self.observers.remove(at: index)
    }
}
