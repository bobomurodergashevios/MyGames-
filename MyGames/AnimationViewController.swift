//
//  AnimationViewController.swift
//  MyGames
//
//  Created by admin on 7/26/22.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var baseView = UIView()
    
    var button = [UIButton]()
    
  
    
    var spotButton = [place]()
    
    var width:CGFloat!
    
    var height:CGFloat!
    
    var velocity:CGFloat = 300
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    func initView(){
        baseView = UIView(frame: CGRect(x: 0, y: 50, width: windowWidth, height: windowWidth+80))
        baseView.backgroundColor = .green
        self.view.backgroundColor = .systemGray
        self.view.addSubview(baseView)
        width = baseView.frame.width-40
        height = baseView.frame.height-40
        
        let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button1.layer.cornerRadius = 20
        button1.backgroundColor = .blue
        baseView.addSubview(button1)
        button.append(button1)
      
        
        let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        button2.layer.cornerRadius = 20
        button2.backgroundColor = .blue
        baseView.addSubview(button2)
        button2.backgroundColor = .brown
        button.append(button2)
        
        
       
        
       
        
        let start = UIButton(frame: (CGRect(x: 30, y: baseView.frame.maxY+50, width: windowWidth-60, height: 60)))
        start.setTitle("Start", for: .normal)
        start.addTarget(self, action: #selector(onPress), for: .touchUpInside)
        self.view.addSubview(start)
        
        spotButton.append(place(x: 100, y: baseView.frame.height-40))
        spotButton.append(place(x: 100, y: baseView.frame.height-40))
 
    }
    @objc func onPress(){
        movement(i: 0)
        movement(i: 1)
      
    }
    
    
func movement(i:Int){
       
        var newPlace = place(x: self.button[i].frame.minX, y: self.button[i].frame.minY)
       
      
        
        var t1 = 0.0
       
        
    
        let a = self.calkulate(spot: newPlace,i: i)
    print(a,newPlace)
        let s = sqrt(pow(spotButton[i].x-a.x, 2)+pow(spotButton[i].y-a.y, 2))
        t1 = s / velocity
//        print(t1)
       t1 = CGFloat(Int(t1 * 100))
        t1 /= 100
       
        UIView.animate(withDuration: t1, delay: 0.0, options: .curveEaseOut) {
            
           // print(self.spotButton,newPlace)
           
            self.button[i].transform = CGAffineTransform(translationX: a.x, y: a.y)
            
    
                
            
        } completion: { done in
            self.movement(i:i)
        }
         
         
   
     

    }
    func calkulate(spot:place,i:Int)->place{
        let x = spot.x - spotButton[i].x
        
        let y = spot.y - spotButton[i].y
        
        var tag:CGFloat = x / y
        if tag < 0{
            tag *= -1
        }
        
        var value = place(x: 0, y: 0)
        
        
        if spotButton[i].x == 100 && spotButton[i].y == baseView.frame.height-40{
            value = firstTime(i: i)
        }
        else if spot.x == 0{
           value = left(spot: spot, tag: tag, y: y)
            
        }
        else if spot.x == width{
            value = right(spot: spot, tag: tag, y: y)
        }
        else if spot.y == 0{
           //chapga
            value = top(spot: spot, tag: tag, x: x)
            
        }
        
       else if spot.y == height{
         value = buttom(spot: spot, tag: tag, x: x)
        }
        
        
        spotButton[i] = spot

        return value
    }
    
}
struct place{
    var x:CGFloat!
    var y:CGFloat!
    init(x:CGFloat,y:CGFloat){
        self.x = x
        self.y = y
    }
}
extension AnimationViewController{
    
    func top(spot:place,tag:CGFloat,x:CGFloat)->place{
        print("top")
        var value = place(x: 0, y: 0)
        
        if x > 0{
           
            if (width - spot.x) / tag > height{
                value.y = height
                value.x = width - spot.x - (height * tag)
            }else{
                
                value.x = width
                value.y = (width-spot.x) / tag
            }
        }
        else //onga burishi
        {
           

        if spot.x / tag > height{
            value.y = height
            value.x = tag * (spot.x / tag - height)
        }else{
            value.x = 0
            value.y = spot.x / tag
        }
            
        }
        return value
    }
    func buttom(spot:place,tag:CGFloat,x:CGFloat)->place{
        print("bottom")
        var value = place(x: 0, y: 0)
        if x < 0{//chapga -> hato bolishi mumkun y>0
            
            if spot.x / tag > height{
                value.y = 0
                value.x = spot.x - (tag * height)
            }else{
                

                value.x = 0
                value.y = height - (spot.x / tag)
            }
            
        }else//onga
        {
            if (width - spot.x) / tag > height{
                value.y = 0
                value.x = width-spot.x - (height * tag)
            }
            else{
                                value.x = width
                value.y = height - ((width - spot.x) / tag)
            }
        }
        return value
    }
    func right(spot:place,tag:CGFloat,y:CGFloat)->place{
        print("right",spot,(height - spot.y) * tag)
        print(height,width,tag)
        var value = place(x: 0, y: 0)
        if y > 0{
            if (height - spot.y) * tag   > width{//pastga
                print("pastga")
                value.x = 0
                value.y = spot.y + (width / tag) //width / tag
            }else{

                value.y = height
                value.x = width - ((height-spot.y)*tag)
            }
        }else{       print("tepaga")  //tepaga
            
            if spot.y * tag > width{
               print("to left")
                value.x = 0
                value.y = spot.y - (width / tag)
            }else{
                print("top")
                value.y = 0
                value.x = width - (spot.y*tag)
            }
        }
        return value
    }
    func left(spot:place,tag:CGFloat,y:CGFloat) -> place{
        print("left")
        var value = place(x: 0, y: 0)
        
        if y > 0{//chapga
           
            if tag * (height-spot.y) > width{
                value.x = width
                value.y = spot.y + (width / tag)
            }else{
                                value.y = height
                    value.x = (height - spot.y) * tag
            }
            
            
        } else{  //onga
            

            if tag * spot.y > width{
                value.x = width
                value.y = spot.y - (width / tag)
            }
            else {value.y = 0
                value.x = spot.y * tag
            }
        }
        return value
    }
    func firstTime(i:Int) -> place{
        print("firstTime")
        if i == 0 {return place(x: width, y: 200)}
        return place(x: width, y: 100)
    }
   
}
