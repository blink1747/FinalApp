//
//  TableViewCell.swift
//  FinalAssignment
//
//  Created by IMCS on 9/4/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var dateOfRelease: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        
    }
    
}
