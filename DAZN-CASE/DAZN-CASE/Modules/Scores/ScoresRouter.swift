//
//  ScoresRouter.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation
import UIKit

class ScoresRouter{
    
    var view = ScoresVC()
    
    func prepareView() ->  UIViewController{
        
        let interactor = ScoresInteractor()
        let presenter = ScoresPresenter()
        
        presenter.interactor = interactor
        presenter.router = self
        presenter.view = self.view
        view.presenter = presenter
        interactor.output = presenter
        
        return view
    }

}

extension ScoresRouter: ScoresRouterProtocol{
    
    
    
}
