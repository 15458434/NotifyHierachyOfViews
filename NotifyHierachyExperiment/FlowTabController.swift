//
//  FlowTabController.swift
//  NotifyHierachyExperiment
//
//  Created by Mark Cornelisse on 04/03/2024.
//

import UIKit
import Combine

final class FlowTabController: UITabBarController {
    var model: RootModel!
    
    private var bag = Set<AnyCancellable>()
    
    // MARK: UITabBarController
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        
        self.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        viewControllers!.compactMap { $0 as? RootModelHolder }
            .forEach({ $0.rootModel = self.model})
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        model.publisher(for: \.flowPage)
            .sink { [unowned self] newFlowPage in
                guard newFlowPage != .notShown else {
                    return
                }
                self.selectedIndex = newFlowPage.rawValue
            }
            .store(in: &bag)
        
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        bag.removeAll()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        
        guard parent != nil else {
            model.update(flowPage: .notShown)
            return
        }
    }
    
    // MARK: UIResponder
    
    // MARK: NSObject
}
