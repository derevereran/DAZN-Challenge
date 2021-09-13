//
//  FeedVC.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 12.09.2021.
//

import UIKit

class FeedVC: UIViewController {
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    let dropDown = MakeDropDown()
    let dropDowmMenuItems = ["News","Scores","Standing"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.manageUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setUpDropDown()
        
    }
    
    
    func setUpDropDown(){
        dropDown.makeDropDownIdentifier = "DROP_DOWN_NEW"
        dropDown.cellReusableIdentifier = "dropDownCell"
        dropDown.makeDropDownDataSourceProtocol = self
        dropDown.setUpDropDown(viewPositionReference: self.topLine.frame, offset: 2)
        dropDown.nib = UINib(nibName: "DropDownCell", bundle: nil)
        dropDown.setRowHeight(height: 50)
        dropDown.width = self.view.frame.width
        self.view.addSubview(dropDown)
    }
    func manageUI(){
        var image = UIImage(named: "downarrow")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(makeDropDownMenu))
    }
    
    
    @objc func makeDropDownMenu(){
        self.dropDown.showDropDown(height: CGFloat(self.dropDowmMenuItems.count) * 50.0)
    }

}

extension FeedVC: MakeDropDownDataSourceProtocol{
    func getDataToDropDown(cell: UITableViewCell, indexPos: Int, makeDropDownIdentifier: String) {
        if makeDropDownIdentifier == "DROP_DOWN_NEW"{
            let customCell = cell as! DropDownCell
            customCell.configureCell(self.dropDowmMenuItems[indexPos])
            
           
        }
    }
    
    func numberOfRows(makeDropDownIdentifier: String) -> Int {
        return self.dropDowmMenuItems.count
    }
    
    func selectItemInDropDown(indexPos: Int, makeDropDownIdentifier: String) {
        switch indexPos {
        case 0:
            let vc = ScoresRouter().prepareView()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            print("Navigate to News")
        default:
            print("2")
        }
        self.dropDown.hideDropDown()
    }
    
}
