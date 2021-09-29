//
//  ScoresVC.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import UIKit

class ScoresVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: ScoresPresenterInput!
    private var scores : MatchesResponse?{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getScores()
        self.presenter.runTimer()
        self.manageUI()
    }
    
    func manageUI(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(ScoresTebleCell.self)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.presenter.invalidateTimer()
    }
}


extension ScoresVC: ScoresPresenterOutput {
    func didGetScores(scores: MatchesResponse) {
        self.scores = scores
    }
}

extension ScoresVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scores?.matches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let scoresCell : ScoresTebleCell = tableView.dequeueReusableCells(for: indexPath)
        scoresCell.setCell(match: (self.scores?.matches?[indexPath.row])!, isEven: (indexPath.row) % 2 == 0)
        return  scoresCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 50))
        let lblHeader = UILabel.init(frame: CGRect(x: 15, y: 13, width: tableView.bounds.size.width - 10, height: 24))
        if let date = self.scores?.date {
            lblHeader.text = date.convertToStringDate(to: "d MMM  yyyy")
        }
        lblHeader.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        lblHeader.textColor = UIColor.white
           headerView.addSubview(lblHeader)
        headerView.backgroundColor = .gray
           return headerView
       }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

}
