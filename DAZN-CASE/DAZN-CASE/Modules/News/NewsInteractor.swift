//
//  NewsInteractor.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation
class NewsInteractor {
    var output: NewsInteractorOutput!
}

extension NewsInteractor: NewsInteractorInput{
    func getNews() {
        NetworkManager().get(endpoint: .getnews,type: NewsResponse.self) { [weak self] news, error in
            if let news = news{
                guard let self = self else {return}
                self.output.didGetNews(news: news)
            }
        }
    }
}
