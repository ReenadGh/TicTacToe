//
//  ViewController.swift
//  TTTApp
//
//  Created by Reenad gh on 02/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var endOfGameMessage: UILabel!
    var CurrentPlayer = 1 ;
    var stopTheGame = false
    var myBoard = [0,0,0,0,0,0,0,0,0]
    let WinList = [[0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8], [2,4,6]]
    @IBAction func BoardPrussed(_ sender: UIButton) {
        
        
        if (myBoard[sender.tag-1]==0 && stopTheGame == false ){
            
            if CurrentPlayer == 1{
                sender.setImage(UIImage(named: "x.png"), for: .normal)
                myBoard[sender.tag-1] = CurrentPlayer
                CurrentPlayer = 2
            }else {
                
                sender.setImage(UIImage(named: "o.png"), for: .normal)
                myBoard[sender.tag-1] =  CurrentPlayer
                CurrentPlayer = 1
                
            }}
        
        
        for line in WinList{
            
            if myBoard[line[0]] != 0 && myBoard[line[0]]==myBoard[line[1]] && myBoard[line[1]]==myBoard[line[2]]{
                stopTheGame = true
                
                if myBoard[line[0]] == 1 {
                    endOfGameMessage.text = "X is Win ! "
                    
                }else  if myBoard[line[0]] == 2 {
                    endOfGameMessage.text = "O is Win ! "
                    
                    
                }
                
                
            }
            
        }
        
    }
    
    
    @IBAction func restartTheGame(_ sender: UIButton) {
        myBoard = [0,0,0,0,0,0,0,0,0]
        stopTheGame = false
        endOfGameMessage.text = ""
        CurrentPlayer = 1
        for i in 1...9{
            let myButton = view.viewWithTag(i) as! UIButton
            myButton.setImage(UIImage(named: "empty.png"), for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.layer.cornerRadius = 10
        
    }
    
    
}

