//
//  ScoresProtocols.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation

protocol ScoresPresenterInput: AnyObject{
    func getScores()
    func runTimer()
    func invalidateTimer()
}

protocol ScoresPresenterOutput: AnyObject {
    func didGetScores(scores:ScoresResponse)
    
}

protocol ScoresInteractorOutput: AnyObject {
    func didGetScores(scores:ScoresResponse)
}

protocol ScoresInteractorInput: AnyObject {
    func getScores()
}

protocol ScoresRouterProtocol {
    
}
