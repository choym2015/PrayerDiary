//
//  PrayerListViewController.swift
//  PrayerDiary
//
//  Created by Youngmin Cho on 8/27/23.
//

import UIKit

class PrayerListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var prayerTableView: UITableView!
    
    var prayerList: [Prayer] = []
    var selectedAuthor: String? = Manager.shared.loadUserID()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let samplePrayer = Prayer(author: "ymc", recipient: "jk", prayerMessage: "prayerMessage", prayerDate: "prayerDate1", prayerRequest: "prayerRequest")
        let samplePrayer2 = Prayer(author: "jk", recipient: "ymc", prayerMessage: "prayerMessage", prayerDate: "prayerDate2", prayerRequest: "prayerRequest")
        
        prayerList.append(samplePrayer)
        prayerList.append(samplePrayer2)
        
        self.updateSegmentControlTitle()
        self.loadPrayerList()
    }
    
    private func updateSegmentControlTitle() {
        self.segmentControl.setTitle("나에게", forSegmentAt: 0)
        self.segmentControl.setTitle("너에게", forSegmentAt: 1)
    }
    
    private func loadPrayerList() {
        
        self.prayerTableView.delegate = self
        self.prayerTableView.dataSource = self
        self.prayerTableView.register(UINib(nibName: "PrayerListTableViewCell", bundle: nil), forCellReuseIdentifier: "PrayerListTableViewCell")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard selectedAuthor != nil else { return 0 }
        
        let filteredPrayerList = self.prayerList.filter { $0.author == selectedAuthor }
        return filteredPrayerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrayerListTableViewCell") as? PrayerListTableViewCell else {
            return UITableViewCell()
        }
        
        let filteredPrayerList = self.prayerList.filter { $0.author == selectedAuthor }
        let prayer = filteredPrayerList[indexPath.row]
        
        cell.prayerLabel.text = prayer.prayerDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.selectedAuthor = Manager.shared.loadUserID()
        case 1:
            self.selectedAuthor = Manager.shared.loadPartnerID()
        default:
            self.selectedAuthor = ""
        }
        
        self.prayerTableView.reloadData()
    }
}
