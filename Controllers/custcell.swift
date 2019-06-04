//
//  custcell.swift
//  AJDecode
//
//  Created by Tosc189 on 18/03/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import UIKit

class custcell: UITableViewCell {

    @IBOutlet var lblphone: UILabel!
    @IBOutlet var lblcity: UILabel!
    @IBOutlet var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
