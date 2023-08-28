//
//  PrayerListViewController.swift
//  PrayerDiary
//
//  Created by Youngmin Cho on 8/27/23.
//

import UIKit

class PrayerListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(Manager.shared.loadUserName())
        print(Manager.shared.loadUserID())
        print(Manager.shared.loadPartnerName())
        print(Manager.shared.loadPartnerID())

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
