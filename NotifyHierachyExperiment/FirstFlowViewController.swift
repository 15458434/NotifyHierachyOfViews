//
//  FirstFlowViewController.swift
//  NotifyHierachyExperiment
//
//  Created by Mark Cornelisse on 04/03/2024.
//

import UIKit

final class FirstFlowViewController: UIViewController, RootModelHolder {
    @IBAction func goToSecondTouchUpInside(_ sender: UIButton) {
        rootModel.update(flowPage: .secondPage)
    }
    
    // MARK: RootModelHolder
    
    var rootModel: RootModel!
    
    // MARK: UIViewController
    
    // MARK: UIResponder
    
    // MARK: NSObject
}
