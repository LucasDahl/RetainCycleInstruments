//
//  ViewController.swift
//  RetainCycleInstruments
//
//  Created by Lucas Dahl on 1/18/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

/////////////////////////////////////////////
// Important you need to go to Product, then profile (command I) to use the instruments tool


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Red", style: .plain, target: self, action: #selector(handleShowRedController))
    }

    @objc func handleShowRedController() {
        navigationController?.pushViewController(RedController(), animated: true)
    }

}

// Will help creat a retain cycle
class Service {
    
    // Weak var would help stop retain cycles, using just var would cause a retain cycle(change to show)
    var redController: RedController?
    
}

// Shows a reatin cycle
class RedController: UITableViewController {
    
    // When this prints it means we don't have a retain cycle
    deinit {
        print("OS reclaming for RedController")
    }
    
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        
        service.redController = self
        
    }
    
}
