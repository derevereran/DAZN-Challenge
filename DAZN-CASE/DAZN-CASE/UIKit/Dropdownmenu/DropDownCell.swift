//
//  DropDownCell.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import UIKit

class DropDownCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(_ text:String){
        self.titleLabel.text = text
    }
    
}
