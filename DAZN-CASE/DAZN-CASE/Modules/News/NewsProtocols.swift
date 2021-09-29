//
//  NewsProtocols.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation
protocol NewsPresenterInput: AnyObject{
    func getNews()
   
}

protocol NewsPresenterOutput: AnyObject {
    func didGetNews(news:NewsResponse)
    
}

protocol NewsInteractorOutput: AnyObject {
    func didGetNews(news:NewsResponse)
}

protocol NewsInteractorInput: AnyObject {
    func getNews()
}

protocol NewsRouterProtocol {
    // func navigateToDetail(id:String)
}
