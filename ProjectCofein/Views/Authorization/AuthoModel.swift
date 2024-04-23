//
//  AuthoModel.swift
//  ProjectCofein
//
//  Created by Apple on 23.4.2024.
//

import Foundation

protocol AuthoModelProtocol: AnyObject {
    
}

class AuthoModel: AuthoModelProtocol {
    
   weak var controller: AuthoController?
    
    init(controller: AuthoController) {
        self.controller = controller
    }
    
}
