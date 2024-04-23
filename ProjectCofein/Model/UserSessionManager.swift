//
//  UserSessionManager.swift
//  ProjectCofein
//
//  Created by Apple on 23.4.2024.
//

import UIKit

final class UserSessionManager {
    
     static let shared = UserSessionManager()
    
    private init() { }
    
    var isSessionActive: Bool {
        let currentDate = Date()
        guard let sessionDate = UserDefaults.standard.object(forKey: "sessionDate") as? Date else { return false }
        
        return sessionDate > currentDate
    }
    
    func saveSession(name: String, phoneNumber: String) {
        if name == "Temirlan" && phoneNumber == "0502030422" {
            print("Session is saved")
            let currentDate = Date()
            let thirySecondAfter = Calendar.current.date(byAdding: .second, value: 30, to: currentDate)
            UserDefaults.standard.setValue(thirySecondAfter, forKey: "sessionDate")
        } else {
            print("The data is't correct")
        }
    }
}
