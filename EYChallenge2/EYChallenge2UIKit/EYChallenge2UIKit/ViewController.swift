//
//  ViewController.swift
//  EYChallenge2UIKit
//
//  Created by Stephen on 7/11/22.
//

import UIKit

enum SegmentColors: String, CaseIterable {
    
    case blue = "Blue"
    case red = "Red"
    case yellow = "Yellow"
    case purple = "Purple"
    case teal = "Teal"
    case cyan = "Cyan"
    
    static func findColor(index: Int) -> UIColor {
        if index == 0 {
            return .blue
        } else if index == 1 {
            return .red
        } else if index == 2 {
            return .yellow
        } else if index == 3 {
            return .purple
        } else if index == 4 {
            return .systemTeal
        } else {
            return .cyan
        }
    }
}



class ViewController: UIViewController {

    // ["Blue", "Red", "Yellow", "Purple", "Teal", "Cyan"]
    lazy var segmentedController: UISegmentedControl = {
        let segmentedC = UISegmentedControl(items: SegmentColors.allCases.compactMap { $0.rawValue } )
        segmentedC.translatesAutoresizingMaskIntoConstraints = false
        segmentedC.addTarget(self, action: #selector(self.segmentValueChanged(sender:)), for: .valueChanged)
        return segmentedC
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
    }
    
    private func createUI() {
        self.view.addSubview(self.segmentedController)
        self.segmentedController.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.segmentedController.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        self.segmentedController.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.segmentedController.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }


    
    @objc
    func segmentValueChanged(sender: UISegmentedControl) {
        
        DispatchQueue.main.async {
            self.segmentedController.selectedSegmentTintColor = SegmentColors.findColor(index: sender.selectedSegmentIndex)
        }
    
    }
    
}

