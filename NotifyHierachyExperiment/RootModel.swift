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
    @objc dynamic var showButtons = true
    
    func update(flowPage: FlowPageType, withDelayedButtons delayedButtons: Bool = false) {
        self.flowPage = flowPage
        self.isFlowShown = (flowPage != .notShown)
        
        if delayedButtons == true {
            showButtons = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                self?.showButtons = true
            }
        } else {
            showButtons = true
        }

    }
}
