//
//  AuthoController.swift
//  ProjectCofein
//
//  Created by Apple on 23.4.2024.
//

import Foundation

protocol AuthoControllerProtocol: AnyObject{
    
}

class AuthoController: AuthoControllerProtocol {
   
    private var model: AuthoModelProtocol?
    
    weak var view: AuthoViewProtocol?
    
    init(view:AuthoViewProtocol) {
        self.view = view
        self.model = AuthoModel(controller: self)
    }
    
}
