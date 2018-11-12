//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topLeft: GameButton!
    @IBOutlet weak var topMiddle: GameButton!
    @IBOutlet weak var topRight: GameButton!
    @IBOutlet weak var middleLeft: GameButton!
    @IBOutlet weak var middleMiddle: GameButton!
    @IBOutlet weak var middleRight: GameButton!
    @IBOutlet weak var bottomLeft: GameButton!
    @IBOutlet weak var bottomMiddle: GameButton!
    @IBOutlet weak var bottomRight: GameButton!
    @IBOutlet var allFlipButtons: [GameButton]!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var playerOne = true
    var countColX = [Int]()
    var countRowX = [Int]()
    var countColO = [Int]()
    var countRowO = [Int]()
    var winX = 0
    var winO = 0

  override func viewDidLoad() {
    super.viewDidLoad()

  }
    func counter(_ sender: GameButton) {
        if playerOne {
            countColX.append(sender.col)
            countRowX.append(sender.row)
        } else {
            countColO.append(sender.col)
            countRowO.append(sender.row)
        }
    }
    func gameOver(winner: Bool) {
        if winner {
            if playerOne {
                winX += 1
                turnLabel.text = "Player one wins!"
                winnerLabel.text = "X wins: \(winX) & O wins: \(winO)"
                
            } else {
                winO += 1
                turnLabel.text = "Player two wins!"
                winnerLabel.text = "X wins: \(winX) & O wins: \(winO)"
            }
            topLeft.isEnabled = false
            topMiddle.isEnabled = false
            topRight.isEnabled = false
            middleLeft.isEnabled = false
            middleMiddle.isEnabled = false
            middleRight.isEnabled = false
            bottomLeft.isEnabled = false
            bottomMiddle.isEnabled = false
            bottomRight.isEnabled = false
        }
        
    }

    @IBAction func allButtons(_ sender: GameButton) {
//        let row = sender.row
//        let col = sender.col
        let sender = sender
        TicTacToeBrain.assignXO(player: playerOne, sender, text: turnLabel)
        counter(sender)
        gameOver(winner: TicTacToeBrain.checkWinnerVertHor(player: playerOne, sender, countColX: countColX, countRowX: countRowX, countColO: countColO, countRowO: countRowO))
        gameOver(winner: TicTacToeBrain.checkWinnerDiagX(topLeft: topLeft, topRight: topRight, middleMiddle: middleMiddle, bottomLeft: bottomLeft, bottomRight: bottomRight))
        gameOver(winner: TicTacToeBrain.checkWinnerDiagO(topLeft: topLeft, topRight: topRight, middleMiddle: middleMiddle, bottomLeft: bottomLeft, bottomRight: bottomRight))
        playerOne = !playerOne
        
    }

    @IBAction func newGame(_ sender: UIButton) {
        allFlipButtons.forEach {$0.isEnabled = true}
        allFlipButtons.forEach {$0.isUserInteractionEnabled = true}
        allFlipButtons.forEach {$0.setImage(nil, for: .normal)}
        countColX = [Int]()
        countRowX = [Int]()
        countColO = [Int]()
        countRowO = [Int]()
        playerOne = true
        turnLabel.text = "Player one's turn"

        
    }
}

