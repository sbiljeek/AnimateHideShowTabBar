//
//  ViewController.swift
//  AnimateHideShowTabBar
//
//  Created by Salman Biljeek on 10/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemTeal //.secondarySystemBackground
        
        let hideShowButton: UIButton = {
            let button = UIButton()
            button.setTitle("Hide Tab Bar", for: .normal)
            button.titleLabel?.tintColor = .white
            button.titleLabel?.font = .boldSystemFont(ofSize: 17)
            button.backgroundColor = .black
            button.contentEdgeInsets = .init(top: 10, left: 16, bottom: 10, right: 16)
            button.layer.cornerRadius = 14
            button.addTarget(self, action: #selector(self.handleHideShowTabBar), for: .touchUpInside)
            return button
        }()
        
        hideShowButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(hideShowButton)
        hideShowButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        hideShowButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc fileprivate func handleHideShowTabBar() {
        guard let navigationController = self.navigationController else { return }
        guard let tabBarIsHidden = self.tabBarController?.tabBar.isHidden else { return }
        
        if tabBarIsHidden {
            self.tabBarController?.tabBar.isHidden = false
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: .curveEaseOut) {
                if let tabBarFrame = self.tabBarController?.tabBar.frame {
                    self.tabBarController?.tabBar.frame.origin.y = navigationController.view.frame.maxY - tabBarFrame.height
                }
                navigationController.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: .curveEaseOut) {
                if let tabBarFrame = self.tabBarController?.tabBar.frame {
                    self.tabBarController?.tabBar.frame.origin.y = navigationController.view.frame.maxY + tabBarFrame.height
                }
                navigationController.view.layoutIfNeeded()
            } completion: { _ in
                self.tabBarController?.tabBar.isHidden = true
            }
        }
    }
}

