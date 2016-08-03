//
//  TitleCell.swift
//  古典名著品读
//
//  Created by 申克 on 16/4/25.
//  Copyright © 2016年 shang_hongzhi. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {

   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
