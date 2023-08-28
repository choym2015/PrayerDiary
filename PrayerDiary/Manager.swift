//
//  Manager.swift
//  PrayerDiary
//
//  Created by Youngmin Cho on 8/22/23.
//

import Foundation

internal class Manager {
    static let shared: Manager = Manager()
    var userName: String!
    var userID: String!
    var partnerName: String!
    var partnerID: String!
    
    func loadUserName() -> String? {
        return UserDefaults.standard.string(forKey: "userName")
    }
    
    func setUserName(userName: String) {
        Manager.shared.userName = userName
    }
    
    func loadUserID() -> String? {
        return UserDefaults.standard.string(forKey: "userID")
    }
    
    func setUserID(userID: String) {
        Manager.shared.userID = userID
    }
    
    func loadPartnerName() -> String? {
        return UserDefaults.standard.string(forKey: "partnerName")
    }
    
    func setPartnerName(partnerName: String) {
        Manager.shared.partnerName = partnerName
    }
    
    
    func loadPartnerID() -> String? {
        return UserDefaults.standard.string(forKey: "partnerID")
    }
    
    func setPartnerID(partnerID: String) {
        Manager.shared.partnerID = partnerID
    }
}
