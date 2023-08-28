//
//  ViewController.swift
//  PrayerDiary
//
//  Created by Youngmin Cho on 8/21/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkConfig()
    }
    
    func checkConfig() {
        if let userName = Manager.shared.loadUserName(),
           let userID = Manager.shared.loadUserID() {
            Manager.shared.setUserName(userName: userName)
            Manager.shared.setUserID(userID: userID)
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "prayerlist_segue", sender: nil)
            }
        } else {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "register_segue", sender: nil)
            }
        }
    }
}

