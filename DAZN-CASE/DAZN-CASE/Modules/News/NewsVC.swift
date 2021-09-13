//
//  NewsVC.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import UIKit

class NewsVC: UIViewController {
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
      
    }
}

extension NewsVC: NewsPresenterOutput {
    func didGetNews(news: NewsResponse) {
        self.news = news
    }
}
