//
//  ScoresTebleCell.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 14.09.2021.
//

import UIKit

class ScoresTebleCell: UITableViewCell,ReusableViews {
    @IBOutlet weak var scoreBG: UIView!
    @IBOutlet weak var teamAName: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var teamBName: UILabel!
    static var ReusableIdentifier = "ScoresTebleCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(match:Matches,isEven:Bool){
        self.backgroundColor = isEven ? .lightGray : .white
        self.teamAName.text = match.teamA?.displayName
        self.teamBName.text = match.teamB?.displayName
        self.score.text = String(describing: match.ftsA ?? 1) + " - " + String(describing: match.ftsB ?? 1)
    }
    
}
