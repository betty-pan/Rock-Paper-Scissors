//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by BettyPan on 2020/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winLoseLabel: UILabel!
    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var stoneButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    
    //user方顯示之圖片
    let paperImage = UIImage(named: "paper")
    let scissorImage = UIImage(named: "scissor")
    let rockImage = UIImage(named: "rock")
    //computer方圖片array
    let computerImages = ["paper", "scissor", "rock"]
    //宣告user, cpu分數
    var userScoreNumber = 0
    var computerScoreNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    //computer方的隨機圖片
    func picRandom() {
        computerImageView.image = UIImage(named: computerImages.randomElement()!)
        //將圖片鏡像翻轉
        computerImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    //設定達成五分為獲勝
    func finalResult() {
        if userScoreNumber == 5 {
            winLoseLabel.textColor = UIColor.yellow
            winLoseLabel.text = "YOU WIN"
            paperButton.isHidden = true
            scissorButton.isHidden = true
            stoneButton.isHidden = true
            restartButton.isHidden = false
            
        }else if computerScoreNumber == 5 {
            winLoseLabel.textColor = UIColor.black
            winLoseLabel.text = "YOU LOSE"
            paperButton.isHidden = true
            scissorButton.isHidden = true
            stoneButton.isHidden = true
            restartButton.isHidden = false
        }
    }

    @IBAction func doPaper(_ sender: UIButton) {
        userImageView.image = paperImage
        picRandom()
        if computerImageView.image == UIImage(named: computerImages[0]) {
            winLoseLabel.text = "DRAW"
        }else if computerImageView.image == UIImage(named: computerImages[1]) {
            winLoseLabel.text = "YOU  LOSE"
            computerScoreNumber = computerScoreNumber + 1
            computerScoreLabel.text = "\(computerScoreNumber)"
        }else{
            winLoseLabel.text = "YOU  WIN"
            userScoreNumber = userScoreNumber + 1
            userScoreLabel.text = "\(userScoreNumber)"
        }
        finalResult()
    }
    
    @IBAction func doScissor(_ sender: UIButton) {
        userImageView.image = scissorImage
       picRandom()
        if computerImageView.image == UIImage(named: computerImages[0]) {
            winLoseLabel.text = "YOU  WIN"
            userScoreNumber = userScoreNumber + 1
            userScoreLabel.text = "\(userScoreNumber)"
        }else if computerImageView.image == UIImage(named: computerImages[1]) {
            winLoseLabel.text = "DRAW"
        }else{
            winLoseLabel.text = "YOU  LOSE"
            computerScoreNumber = computerScoreNumber + 1
            computerScoreLabel.text = "\(computerScoreNumber)"
        }
        finalResult()
    }
    
    @IBAction func doRock(_ sender: UIButton) {
        userImageView.image = rockImage
        picRandom()
        if computerImageView.image == UIImage(named: computerImages[0]) {
            winLoseLabel.text = "YOU  LOSE"
            computerScoreNumber = computerScoreNumber + 1
            computerScoreLabel.text = "\(computerScoreNumber)"
        }else if computerImageView.image == UIImage(named: computerImages[1]) {
            winLoseLabel.text = "YOU  WIN"
            userScoreNumber = userScoreNumber + 1
            userScoreLabel.text = "\(userScoreNumber)"
        }else{
            winLoseLabel.text = "DRAW"
        }
        finalResult()
    }
    @IBAction func restart(_ sender: UIButton) {
        paperButton.isHidden = false
        scissorButton.isHidden = false
        stoneButton.isHidden = false
        restartButton.isHidden = true
        userScoreNumber = 0
        userScoreLabel.text = "\(userScoreNumber)"
        computerScoreNumber = 0
        computerScoreLabel.text = "\(computerScoreNumber)"
        winLoseLabel.text = "Ready?"
        winLoseLabel.textColor = UIColor.white
        
    }
    
    
}

