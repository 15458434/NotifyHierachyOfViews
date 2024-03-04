//
//  RootViewController.swift
//  NotifyHierachyExperiment
//
//  Created by Mark Cornelisse on 04/03/2024.
//

import UIKit
import Combine

final class RootViewController: UIViewController {
    @IBOutlet var model: RootModel!
    
    private var bag = Set<AnyCancellable>(minimumCapacity: 1)
    
    @IBAction func showFlowTouchUpInside(_ sender: Any) {
        model.update(flowPage: .firstPage)
    }
    
    @IBAction func showFlowWithDelayedButtonsTouchUpInside(_ sender: UIButton) {
        model.update(flowPage: .firstPage, withDelayedButtons: true)
    }
    
    // MARK: UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model.publisher(for: \.flowPage, options: .initial)
            .sink { [unowned self] newFlowPage in
                switch newFlowPage {
                case .notShown:
                    self.dismiss(animated: true)
                case .firstPage, .secondPage:
                    guard model.isFlowShown == false else {
                        return
                    }
                    self.performSegue(withIdentifier: "Open Flow", sender: self)
                }
            }
            .store(in: &bag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        bag.removeAll()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            fatalError("Segues in the RootViewController can only be execute when they have an identifier")
        }
        switch identifier {
        case "Open Flow":
            // Update your destination here.
            let destination = segue.destination as! FlowTabController
            destination.model = model
        default:
            fatalError("RootViewController is not familiar with this segue identifier")
        }
    }
    
    // MARK: UIResponder
    
    // MARK: NSObject
}

