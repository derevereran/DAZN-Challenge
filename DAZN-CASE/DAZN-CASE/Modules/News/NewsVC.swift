//
//  NewsVC.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import UIKit
import WebKit
class NewsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: NewsPresenterInput!
    private var news : NewsResponse?{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getNews()
        self.manageUI()
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
        if let news = self.news?.news?[indexPath.row]{
            newsCell.setCell(news: news)
        }
        return  newsCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WebViewController()
        vc.url = self.news?.news?[indexPath.row].link
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!
    var url : String?
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let url = URL(string: self.url!)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
