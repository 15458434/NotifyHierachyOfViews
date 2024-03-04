//
//  SecondFlowViewController.swift
//  NotifyHierachyExperiment
//
//  Created by Mark Cornelisse on 04/03/2024.
//

import UIKit
import Combine

final class SecondFlowViewController: UIViewController, RootModelHolder {
    @IBOutlet weak var buttons: UIStackView!
    
    private var bag = Set<AnyCancellable>(minimumCapacity: 1)
    
    @IBAction func backTouchUpInside(_ sender: UIButton) {
        rootModel.update(flowPage: .firstPage)
    }
    
    @IBAction func completeTouchUpInside(_ sender: UIButton) {
        rootModel.update(flowPage: .notShown)
    }
    
    // MARK: RootModelHolder
    
    var rootModel: RootModel!
    
    // MARK: UIViewController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        rootModel.publisher(for: \.showButtons)
            .sink { showButtons in
                self.buttons.isHidden = !showButtons
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
