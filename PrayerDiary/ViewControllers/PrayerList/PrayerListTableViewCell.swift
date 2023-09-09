//
//  PrayerListTableViewCell.swift
//  PrayerDiary
//
//  Created by Youngmin Cho on 9/9/23.
//

import UIKit

class PrayerListTableViewCell: UITableViewCell {

    @IBOutlet weak var prayerLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
