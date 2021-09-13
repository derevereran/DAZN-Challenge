//
//  ScoresInteractor.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation

class ScoresInteractor {
    var output: ScoresInteractorOutput!
}

extension ScoresInteractor: ScoresInteractorInput{
    func getScores() {
        NetworkManager().get(endpoint: .getMatches,type: MatchesResponse.self) { scores, error in
            if let scores = scores{
                self.output.didGetScores(scores: scores)
            }
        }
    }
}


