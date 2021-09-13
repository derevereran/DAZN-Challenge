//
//  ScoresPresenter.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation

class ScoresPresenter: NSObject{
    weak var view: ScoresPresenterOutput!
    var interactor: ScoresInteractorInput!
    var router: ScoresRouterProtocol!
    var timer = Timer()
    var counter = 0

}

extension ScoresPresenter: ScoresPresenterInput {
    func getScores() {
        self.interactor.getScores()
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                                     selector: #selector(update),
                                     userInfo: nil, repeats: true)
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
    }
    
    @objc func update(){
        counter += 1
        if counter >= 30 {
            self.getScores()
            self.counter = 0
        }
    }
}

extension ScoresPresenter: ScoresInteractorOutput {
    func didGetScores(scores: ScoresResponse) {
        self.view.didGetScores(scores: scores)
    }
}
