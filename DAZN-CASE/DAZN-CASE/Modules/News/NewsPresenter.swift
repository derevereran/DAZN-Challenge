//
//  NewsPresenter.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation
class NewsPresenter: NSObject{
    weak var view: NewsPresenterOutput!
    var interactor: NewsInteractorInput!
    var router: NewsRouterProtocol!
    var timer = Timer()
    var counter = 0

}

extension NewsPresenter: NewsPresenterInput {
    func getNews() {
        self.interactor.getNews()
    }
}

extension NewsPresenter: NewsInteractorOutput {
    func didGetNews(news: NewsResponse) {
        self.view.didGetNews(news: news)
    }
}
