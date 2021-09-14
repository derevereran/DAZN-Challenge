//
//  NewsCell.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 14.09.2021.
//

import UIKit

class NewsCell: UITableViewCell,ReusableViews {
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    static var ReusableIdentifier = "NewsCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(news:News){
        self.datelabel.text = news.date?.convertToStringDate(to: "E, d MMM yyyy HH:mm")
        self.titleLabel.text = news.title
        self.descLabel.text = news.description
        
    }
    
}
