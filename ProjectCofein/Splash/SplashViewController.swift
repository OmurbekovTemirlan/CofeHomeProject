//
//  SplashViewController.swift
//  ProjectCofein
//
//  Created by Apple on 23.4.2024.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserSessionManager.shared.isSessionActive {
            let vc = HomeView()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = AuthoViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
