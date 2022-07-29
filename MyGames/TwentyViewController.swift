//
//  2048ViewController.swift
//  MyGames
//
//  Created by admin on 7/9/22.
//

import UIKit

class TwentyViewController: UIViewController {
    private var baseView = UIView()
    
    var buttons = [[UIButton]]()
    var matrix  = [[0,0,0,0],
                   [0,0,0,0],
                   [0,0,0,0],
                   [0,0,0,0]]
    //2  4  8  16  32  64  128  256  512  1024  2048  4096  9192
    let colors = [UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                  UIColor(red: 242.0/255.0, green: 177.0/255.0, blue: 121.0/255.0, alpha: 0.9),
                  UIColor(red: 245.0/255.0, green: 149.0/255.0, blue: 99.0/255.0, alpha: 0.9),
                  UIColor(red: 246.0/255.0, green: 124.0/255.0, blue: 95.0/255.0, alpha: 0.9),
                  UIColor(red: 246.0/255.0, green: 94.0/255.0, blue: 59.0/255.0, alpha: 0.9),
                  UIColor(red: 237.0/255.0, green: 207.0/255.0, blue: 114.0/255.0, alpha: 0.9),
                  UIColor(red: 238.0/255.0, green: 228.0/255.0, blue: 218.0/255.0, alpha: 0.9),
                  
                  UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                  UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                  UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                  UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                  UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                  UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),]
    let colorBtn = [2:UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9), 4:UIColor(red: 242.0/255.0, green: 177.0/255.0, blue: 121.0/255.0, alpha: 0.9),
                    8:UIColor(red: 245.0/255.0, green: 149.0/255.0, blue: 99.0/255.0, alpha: 0.9),
                    16:UIColor(red: 246.0/255.0, green: 124.0/255.0, blue: 95.0/255.0, alpha: 0.9),
                    32:UIColor(red: 246.0/255.0, green: 94.0/255.0, blue: 59.0/255.0, alpha: 0.9),
                    64:UIColor(red: 237.0/255.0, green: 207.0/255.0, blue: 114.0/255.0, alpha: 0.9),
                    128:UIColor(red: 238.0/255.0, green: 228.0/255.0, blue: 218.0/255.0, alpha: 0.9),
                    
                    256:UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                    512:UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                    512:UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                    1024:UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                    2048:UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9),
                    4096:UIColor(red: 237.0/255.0, green: 224.0/255.0, blue: 200.0/255.0, alpha: 0.9)]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        baseView = UIView(frame: CGRect(x: 10, y: 120, width: windowWidth-20, height: windowWidth-20))
        baseView.backgroundColor = .gray
        self.view.addSubview(baseView)
        
        start()
    }
    func start(){
        
        
        let space:CGFloat = 10
        
        let buttonsize:CGFloat = (baseView.frame.width-5*space)/4
        
        for i in 0...3{
            var tempList = [UIButton]()
            for j in 0...3{
                
                tempList.append( createButton(frame:
                                                CGRect(x: CGFloat(j+1)*space + CGFloat(j)*buttonsize,
                                                       y:CGFloat(i+1)*space + CGFloat(i)*buttonsize,
                                                       width: buttonsize, height: buttonsize), tag: 4*i+j))
            }
            buttons.append(tempList)
        }
        let  gestureUP = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        gestureUP.direction = .up
        
        let  gestureDown = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        gestureDown.direction = .down
        
        let  gestureRight = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        gestureRight.direction = .right
        
        let  gestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(_:)))
        gestureLeft.direction = .left
        
    }
    @objc func onSwipe(_ gesture: UISwipeGestureRecognizer){
        if gesture.direction == .up{
            for i in 0...3{
            for j in 0...2{
               if matrix[2-j][i] == matrix[3-j][i]{
                    matrix[i][3-j] = 2 * matrix[i][3-j]
                   matrix[i][2-j] = 0
                }
            }
            }
        }
        else if gesture.direction == .down{
            
        }
        else if gesture.direction == .right{
            for i in 0...3{
                var temp = 0
            for j in 1...3{
               if matrix[i][2-j] == matrix[i][temp]{
                    matrix[i][3-j] = 2 * matrix[i][3-j]
                   matrix[i][2-j] = 0
                }
            }
            }
          
        }
        else {
            for i in 0...3{
                var temp = 0
                if matrix[i][0] > 0{temp = 0}
                else if matrix[i][1] > 0 {temp = 1}
                else if matrix[i][2] > 0{temp = 2}
            for j in 1...3{
               if matrix[i][temp] == matrix[i][j]{
                    matrix[i][temp] = 2 * matrix[i][temp]
                   matrix[i][j] = 0
                }
                else if matrix[i][j] > 0{
                    temp = j
                }
            }
            }
        }
        drawNum()
    }
    func Appear(){
        
    }
    func createButton(frame:CGRect,tag:Int) -> UIButton{
        let button = UIButton(frame: frame)
        button.tag = tag
        button.backgroundColor = .lightGray
        baseView.addSubview(button)
        return button
        
        
        
    }
    
}
extension TwentyViewController{
    func swipe(i:Int,j:Int){
        
        
    }
    func drawNum(){
        for i in 0...3{
            for j in 0...3{
               
                if matrix[i][j] > 0{
                    buttons[i][j].setTitle("\(matrix[i][j])", for: .normal)
                    buttons[i][j].setTitleColor(colorBtn[matrix[i][j]], for: .normal)
                }
            }
        }
    }
}
