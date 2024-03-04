//
//  RootModel.swift
//  NotifyHierachyExperiment
//
//  Created by Mark Cornelisse on 04/03/2024.
//

import UIKit

@objc protocol RootModelHolder {
    var rootModel: RootModel! { get set }
}

final class RootModel: NSObject {
    @objc enum FlowPageType: Int {
        case notShown = -1
        case firstPage = 0
        case secondPage = 1
    }
    
    @objc dynamic var flowPage: FlowPageType = .notShown
    @objc dynamic var isFlowShown = false
    
    func update(flowPage: FlowPageType) {
        self.flowPage = flowPage
        self.isFlowShown = (flowPage != .notShown)
    }
}
