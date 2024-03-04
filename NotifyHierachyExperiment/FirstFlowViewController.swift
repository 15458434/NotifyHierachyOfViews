//
//  FirstFlowViewController.swift
//  NotifyHierachyExperiment
//
//  Created by Mark Cornelisse on 04/03/2024.
//

import UIKit
import Combine

final class FirstFlowViewController: UIViewController, RootModelHolder {
    @IBOutlet weak var goToSecondButton: UIButton!
    
    private var bag = Set<AnyCancellable>(minimumCapacity: 1)
    
    @IBAction func goToSecondTouchUpInside(_ sender: UIButton) {
        rootModel.update(flowPage: .secondPage)
    }
    
    // MARK: RootModelHolder
    
    var rootModel: RootModel!
    
    // MARK: UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        rootModel.publisher(for: \.showButtons)
            .sink { showButtons in
                debugPrint("showButtons: \(showButtons)")
                self.goToSecondButton.isHidden = !showButtons
            }
            .store(in: &bag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        bag.removeAll()
    }
    
    // MARK: UIResponder
    
    // MARK: NSObject
}
