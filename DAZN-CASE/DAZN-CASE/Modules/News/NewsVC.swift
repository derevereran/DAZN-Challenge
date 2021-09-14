//
//  NewsVC.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import UIKit

class NewsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: NewsPresenterInput!
    private var news : NewsResponse?{
        didSet{
            print("Newsget")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getNews()
       
    }
    
    func manageUI(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(NewsCell.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
      
    }
}

extension NewsVC: NewsPresenterOutput {
    func didGetNews(news: NewsResponse) {
        self.news = news
    }
}


extension NewsVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news?.news?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell : NewsCell = tableView.dequeueReusableCells(for: indexPath)
        newsCell.setCell(match: (self.scores?.matches?[indexPath.row])!, isEven: (indexPath.row) % 2 == 0)
        return  scoresCell
    }
    
}
