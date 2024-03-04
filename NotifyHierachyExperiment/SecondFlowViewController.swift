//
//  SecondFlowViewController.swift
//  NotifyHierachyExperiment
//
//  Created by Mark Cornelisse on 04/03/2024.
//

import UIKit

final class SecondFlowViewController: UIViewController, RootModelHolder {
    @IBAction func backTouchUpInside(_ sender: UIButton) {
        rootModel.update(flowPage: .firstPage)
    }
    
    @IBAction func completeTouchUpInside(_ sender: UIButton) {
        rootModel.update(flowPage: .notShown)
    }
    
    // MARK: RootModelHolder
    
    var rootModel: RootModel!
    
    // MARK: UIViewController
    
    // MARK: UIResponder
    
    // MARK: NSObject
}
