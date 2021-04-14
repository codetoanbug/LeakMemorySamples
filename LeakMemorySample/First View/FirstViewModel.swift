//
//  FirstViewModel.swift
//  LeakMemorySample
//
//  Created by xuanquynhle on 2021/04/14.
//

import Foundation

struct FirstViewModel {
    enum LeakType: Int {
        case inClosure
        case inSingleton

        var description: String {
            switch self {
            case .inClosure:
                return "Leak in closure"
            case .inSingleton:
                return "Leak in singleton"
            }
        }
    }

    /// Call back to view controller when did select in cell
    var needHandleWithLeakType: ((LeakType) -> Void)?

    private var dataSource: [LeakType] = [
        .inClosure,
        .inSingleton
    ]

    func numberOfRowsInSection() -> Int {
        return dataSource.count
    }

    func dataCellForRowAt(index: Int) -> LeakType {
        return dataSource[index]
    }

    func didSelectRowAt(index: Int) {
        self.needHandleWithLeakType?(dataSource[index])
    }
}
