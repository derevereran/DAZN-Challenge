//
//  NewsRouter.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation
import UIKit

class NewsRouter{
    
    var view = NewsVC()
    
    func prepareView() ->  UIViewController{
        let interactor = NewsInteractor()
        let presenter = NewsPresenter()
        presenter.interactor = interactor
        presenter.router = self
        presenter.view = self.view
        view.presenter = presenter
        interactor.output = presenter
        return view
    }

}

extension NewsRouter: NewsRouterProtocol{
    
    
    
}
