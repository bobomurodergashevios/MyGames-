
import UIKit

class TicTacToeViewController: UIViewController {
let winList = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[2,5,7],[1,4,7],[0,4,8],[2,4,6]]
    
    var titleList = ["","","","","","","","",""]
    
    var buttonList = [UIButton]()
    
    var titleLabel:UILabel!
    
    var baseView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        titleLabel = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width-80)/2, y: 60, width: 80, height: 40))
       
        titleLabel.text = "X yurishi"
        self.view.addSubview(titleLabel)
        
         baseView = UIView(frame: CGRect(x: 10, y: titleLabel.frame.maxY + 40, width: UIScreen.main.bounds.width-20, height: UIScreen.main.bounds.width-20))
        baseView.backgroundColor = .darkGray
        self.view.addSubview(baseView)
        let spacing:CGFloat = 10
        let buttonSize:CGFloat = (baseView.frame.width-40) / 3
        for i in 0 ... 8{
          
            drawButton(frame: CGRect(x: CGFloat(i%3+1)*spacing + CGFloat(i%3)*buttonSize, y: CGFloat(i/3+1)*spacing + CGFloat(i/3)*buttonSize, width: buttonSize, height: buttonSize), tag: i)

        }
        
        makeToReady()
    }
    func winGamer(symbol:String)->Int?{
        for item in winList{
            if titleList[item[0]] == titleList[item[1]],
               titleList[item[0]] == symbol,
               titleList[item[2]] == ""{return item[2]}
            
            if titleList[item[0]] == titleList[item[2]],
               titleList[item[0]] == symbol,
               titleList[item[1]] == ""{return item[1]}
            
            if titleList[item[1]] == titleList[item[2]],
               titleList[item[1]] == symbol,
               titleList[item[0]] == ""{return item[0]}
        }
        return nil}
    
    func reArrangement(symbol2:String)->Int?{
        for item in winList{
            if titleList[item[0]] == titleList[item[1]],
               titleList[item[0]] == "",
               titleList[item[2]] == symbol2{ return item[1]}
            
            if titleList[item[0]] == titleList[item[2]],
               titleList[item[0]] == "",
               titleList[item[1]] == symbol2{return item[2]}
            
            if titleList[item[1]] == titleList[item[2]],
               titleList[item[1]] == "",
               titleList[item[0]] == symbol2{return item[1]}
        }
        
        return nil}
   
    func turnCom()-> Int{
        
      
        if let win = winGamer(symbol: "O"){return win}
        if let win = winGamer(symbol: "X"){return win}
        if let win = reArrangement(symbol2: "O"){return win}
       
        
        var list = [Int]()
        if titleList[4] == ""{list.append(4)}
        for i in 0...8{
            if titleList[i] == ""{list.append(i)}
        }
        
        return list[0]
        
    }
    func check(){
        for item in winList{
            if titleList[item[0]] == titleList[item[1]],
               titleList[item[0]] == titleList[item[2]]{
                if titleList[item[0]] == "X"{
                    titleLabel.text = "X yutdi"
                }else{
                    titleLabel.text = "O yutdi"
                }
                break
            }
        }
    }
    @objc func onPressButton(_ sander:UIButton){
        if titleList[sander.tag] == ""{
            sander.setTitle("X", for: .normal)
            titleList[sander.tag] = "X"
            check()
           let p = turnCom()
            titleList[p] = "O"
            buttonList[p].setTitle("O", for: .normal)
            check()
          
        }
    }

    
    func drawButton(frame:CGRect,tag:Int){
        let newButton = UIButton(frame: frame)
        newButton.titleLabel?.font = .boldSystemFont(ofSize: 36)
        newButton.backgroundColor = .white
        newButton.tag = tag
        newButton.setTitleColor(.black, for: .normal)
        newButton.setTitle("", for: .normal)
        buttonList.append(newButton)
        baseView.addSubview(newButton)
    }
    func makeToReady(){
        for button in buttonList {
            button.addTarget(self, action: #selector(onPressButton(_:)), for: .touchUpInside)
        }
    }
}
