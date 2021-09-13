//
//  ScoresVC.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import UIKit

class ScoresVC: UIViewController {
    var presenter: ScoresPresenterInput!
    private var Scores : MatchesResponse?{
        didSet{
            print("Scoresget")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getScores()
        self.presenter.runTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.presenter.invalidateTimer()
    }
}

extension ScoresVC: ScoresPresenterOutput {
    func didGetScores(scores: MatchesResponse) {
        self.Scores = scores
    }
}
