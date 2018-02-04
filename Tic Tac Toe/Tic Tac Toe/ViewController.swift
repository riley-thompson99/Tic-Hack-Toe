//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Faduma Ahmed on 2018-02-03.
//  Copyright © 2018 Faduma Ahmed. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var Myview: UIView! // The board
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var subBoard0: UIImageView!
    
    @IBOutlet weak var subBoard1: UIImageView!
    
    @IBOutlet weak var subBoard2: UIImageView!
    
    @IBOutlet weak var subBoard3: UIImageView!
    
    @IBOutlet weak var subBoard4: UIImageView!
    
    @IBOutlet weak var subBoard5: UIImageView!
    
    @IBOutlet weak var subBoard6: UIImageView!
    
    @IBOutlet weak var subBoard7: UIImageView!
    
    @IBOutlet weak var subBoard8: UIImageView!
    
    @IBOutlet weak var turn: UILabel!
    
    //finds index
    func findIndex(coordinate: Int) -> Int {
        return ((coordinate-25)/36)
    }
    
    //finds coordinate to place image at
    func imageCoordinate(index: Int) -> Int {
        return ((36*index)+53)
    }
    
    func winnerCoordinate(index: Int) -> Int {
        return (108*index)+45
    }
    
    // set tile to x
    func setX(xc: Int, yc: Int) {
        let image = UIImage(named: "x.png")
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: imageCoordinate(index: findIndex(coordinate: xc)), y: imageCoordinate(index: findIndex(coordinate: yc)), width: 20, height: 20)
        view.addSubview(imageView)
    }
    
    func setXBoardWin(xc: Int, yc: Int) {
        let image = UIImage(named: "x.png")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: winnerCoordinate(index: xc), y: winnerCoordinate(index: yc), width: 100, height: 100)
        view.addSubview(imageView)
    }
    
    func setOBoardWin(xc: Int, yc: Int) {
        let image = UIImage(named: "o.png")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: winnerCoordinate(index: xc), y: winnerCoordinate(index: yc), width: 100, height: 100)
        view.addSubview(imageView)
    }
    
    func setO(xc: Int, yc: Int) {
        let image = UIImage(named: "o.png")
        let imageView = UIImageView(image: image!)
            
        imageView.frame = CGRect(x: imageCoordinate(index: findIndex(coordinate: xc)),
                                 y: imageCoordinate   (index: findIndex(coordinate: yc)),
                                 width: 20, height: 20)
        view.addSubview(imageView)
    }
    
    
    var board = Array(repeating: [0,0,0,0,0,0,0,0,0], count: 9)
    
    var turns:Int = 1
    
    func checkSubBoardWinner(subBoard: [Int]) -> Bool {
        if abs(subBoard[0] + subBoard[1] + subBoard[2]) == 3 ||
           abs(subBoard[3] + subBoard[4] + subBoard[5]) == 3 ||
           abs(subBoard[6] + subBoard[7] + subBoard[8]) == 3 ||
           abs(subBoard[0] + subBoard[3] + subBoard[6]) == 3 ||
           abs(subBoard[1] + subBoard[4] + subBoard[7]) == 3 ||
           abs(subBoard[2] + subBoard[5] + subBoard[8]) == 3 ||
           abs(subBoard[0] + subBoard[4] + subBoard[8]) == 3 ||
           abs(subBoard[2] + subBoard[4] + subBoard[5]) == 3 {
            return true
        } else {
            return false
        }
    }
    
    func checkGameWinner(board: [[Int]])  -> Bool {
        if (board[0] == board[1] && board[0] == board[2] && board[0].count == 1) ||
            (board[3] == board[4] && board[3] == board[5] && board[3].count == 1) ||
            (board[6] == board[7] && board[6] == board[8] && board[6].count == 1) ||
            (board[0] == board[3] && board[0] == board[6] && board[0].count == 1) ||
            (board[1] == board[4] && board[1] == board[7] && board[1].count == 1) ||
            (board[2] == board[5] && board[2] == board[8] && board[2].count == 1) ||
            (board[0] == board[4] && board[0] == board[8] && board[0].count == 1) ||
            (board[2] == board[4] && board[2] == board[5] && board[2].count == 1) {
            return true
        } else {
            return false
        }
    }
    
    // UPDATE BOARD ARRAY
    func getSubBoard(board: [[Int]], xc: Int, yc: Int) -> Int {
        var subBoard: Int = 0
        if xc <= 2 && yc <= 2 {
            subBoard = 0
        } else if xc <= 2 && yc <= 5 {
            subBoard = 3
        } else if xc <= 2 && yc <= 8 {
            subBoard = 6
        } else if xc <= 5 && yc <= 2 {
            subBoard = 1
        } else if xc <= 5 && yc <= 5 {
            subBoard = 4
        } else if xc <= 5 && yc <= 8 {
            subBoard = 7
        } else if xc <= 8 && yc <= 2 {
            subBoard = 2
        } else if xc <= 8 && yc <= 5 {
            subBoard = 5
        } else if xc <= 8 && yc <= 8 {
            subBoard = 8
        }
        return subBoard
    }
    
    func getTile(board: [[Int]], xc: Int, yc: Int) -> Int {
        var tile: Int = 0
        if xc%3 == 0 && yc%3 == 0 {
            tile = 0
        } else if xc%3 == 1 && yc%3 == 0 {
            tile = 1
        } else if xc%3 == 2 && yc%3 == 0 {
            tile = 2
        } else if xc%3 == 0 && yc%3 == 1 {
            tile = 3
        } else if xc%3 == 1 && yc%3 == 1 {
            tile = 4
        } else if xc%3 == 2 && yc%3 == 1 {
            tile = 5
        } else if xc%3 == 0 && yc%3 == 2 {
            tile = 6
        } else if xc%3 == 1 && yc%3 == 2 {
            tile = 7
        } else if xc%3 == 2 && yc%3 == 2 {
            tile = 8
        }
        return tile
    }
    
    func showMove(tile: Int) {
        clearColors()
        if board[tile].count == 1 {
            message.text =  "You can play anywhere"
        } else if tile == 0 {
            subBoard0.backgroundColor = UIColor.lightGray
        } else if tile == 1 {
            subBoard1.backgroundColor = UIColor.lightGray
        } else if tile == 2 {
            subBoard2.backgroundColor = UIColor.lightGray
        } else if tile == 3 {
            subBoard3.backgroundColor = UIColor.lightGray
        } else if tile == 4 {
            subBoard4.backgroundColor = UIColor.lightGray
        } else if tile == 5 {
            subBoard5.backgroundColor = UIColor.lightGray
        } else if tile == 6 {
            subBoard6.backgroundColor = UIColor.lightGray
        } else if tile == 7 {
            subBoard7.backgroundColor = UIColor.lightGray
        } else if tile == 8 {
            subBoard8.backgroundColor = UIColor.lightGray
        }
    }
    
    func clearColors() {
        subBoard0.backgroundColor = UIColor.clear
        subBoard1.backgroundColor = UIColor.clear
        subBoard2.backgroundColor = UIColor.clear
        subBoard3.backgroundColor = UIColor.clear
        subBoard4.backgroundColor = UIColor.clear
        subBoard5.backgroundColor = UIColor.clear
        subBoard6.backgroundColor = UIColor.clear
        subBoard7.backgroundColor = UIColor.clear
        subBoard8.backgroundColor = UIColor.clear
    }
    
    var tilePlayed: Int = 0
    
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if turns == 2 {
            turn.text = "X's Turn"
        }
        
        message.text = ""
        
        let touch = touches.first!
        let location = touch.location(in: Myview)
        
        if Int(location.x) >= 25 && Int(location.x) <= 349 &&
            Int(location.y) >= 25 && Int(location.y) <= 349 &&
            board[getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))].count != 1 {
            
            if (board[getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))][getTile(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))] == 0) && // empty tile
                
                (tilePlayed == getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y))) || turns == 1 || board[tilePlayed].count == 1) { // playing in correct subboard
                
                if turns%2 == 1 {
                    
                    turn.text = "O's Turn"
                    
                    setX(xc: Int(location.x), yc: Int(location.y)) // displays to user
                    
                    board[getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))][getTile(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))] = 1
                    
                    tilePlayed = getTile(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))
                    showMove(tile: tilePlayed)
                            
                    if checkSubBoardWinner(subBoard: board[getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))]) {
                        
                        board[getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))] = [1]
                        if checkGameWinner(board: board) {
                            message.text = "X wins! Good game!"
                        } else {
                            message.text = "X won a board!"
                            showMove(tile: tilePlayed)
                            setOBoardWin(xc: getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))%3, yc: getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))/3)
                        }
                    }
                    turns += 1
                } else {
                    turn.text = "X's Turn"
                    setO(xc: Int(location.x), yc: Int(location.y))
                    
                    board[getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))][getTile(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))] = -1
                    tilePlayed = getTile(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))
                    showMove(tile: tilePlayed)
                    
                    if checkSubBoardWinner(subBoard: board[getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))]) {
                        
                       board[getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))] = [-1]
                        if checkGameWinner(board: board) {
                            message.text = "O wins! Good game!"
                        } else {
                            message.text = "O won a board!"
                            showMove(tile: tilePlayed)
                            setOBoardWin(xc: getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))%3, yc: getSubBoard(board: board, xc: findIndex(coordinate: Int(location.x)), yc: findIndex(coordinate: Int(location.y)))/3)
                        }
                    }
                    turns += 1
                }
            } else {
                message.text = "You can't go there, try again."
            }
        } else {
            message.text = "You can't go there, try again."
        }
        for i in 0...8 {
            print(board[i])
        }
        print("\n")
    }
}
