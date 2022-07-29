

import UIKit

class fifteenXOneViewController: UIViewController {
    var numbers  = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
    var winNumbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]
    
    var matrix = [ [0,0,0,0],
                   [0,0,0,0],
                   [0,0,0,0],
                   [0,0,0,0]]
    
    var buttons = [[UIButton]]()
    var progress = UIProgressView()
    
    var timer : Timer?
    
    var emptyIndex = MIndex(i: 3, j: 3)
    
    var score = 0
    
    var label = UILabel()
    
    var countTime = 0
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .darkGray
    let space:CGFloat = 10
      let counter = Progress(frame: CGRect(x: 10, y: 20, width: windowWidth-30, height: 12), interval: 180)
        counter.TinkColor = .systemBlue
        counter.backColor = .systemGreen
        self.view.addSubview(counter)
        let buttunsize = (UIScreen.main.bounds.width-3*space-40)/4
      label = UILabel(frame: CGRect(x: (windowWidth-100)/2, y: 70, width: 100, height: 40))
        self.view.addSubview(label)
        label.text = "Score:\(score)"
        let spotCGFloat = label.frame.maxY + 40
        // arrange buttons
        for i in 0...3{
            var temp = [UIButton]()
            for j in 0...3{
                let button = (drawButton(size: CGRect(x: 20 + CGFloat(j)*(space + buttunsize),
                    y:spotCGFloat + CGFloat(i)*(space + buttunsize), width: buttunsize, height: buttunsize), tag: i*4+j))
                
                temp.append(button)
            }
            buttons.append(temp)
            
        }
        start()
//        let spot  = MIndex(i: Int(buttons[3][3].frame.maxY) + 60, j: Int(windowWidth)/2 - 30)
//        let size = MIndex(i: 60, j: 120)
//        let x:CGFloat = 120
//        let y :CGFloat = 60
//        var btnContr = [UIButton]()
//        let button = drawButton(size: CGRect(x: CGFloat(spot.j)-10-y, y: CGFloat(spot.i)+5, width: y, height: x), tag: 0)
//        button.addTarget(self, action: #selector( pressContr), for: .touchUpInside)
//        button.setTitle(" ⇦", for: .normal)
//        btnContr.append(button)
//
//        let button1 = drawButton(size: CGRect(x: CGFloat(spot.j), y: CGFloat(spot.i), width: x, height: y), tag: 1)
//        button1.addTarget(self, action: #selector( pressContr), for: .touchUpInside)
//        button1.setTitle(" ⇧", for: .normal)
//        btnContr.append(button1)
//
//        let button2 = drawButton(size: CGRect(x: CGFloat(spot.j), y: CGFloat(spot.i)+y+10, width: x, height: y), tag: 2)
//        button2.addTarget(self, action: #selector( pressContr), for: .touchUpInside)
//        button2.setTitle("⇩", for: .normal)
//        btnContr.append(button2)
//
//        let button3 = drawButton(size: CGRect(x: CGFloat(spot.j)+x+10, y: CGFloat(spot.i)+5, width: y, height: x), tag: 3)
//        button3.addTarget(self, action: #selector( pressContr), for: .touchUpInside)
//        button3.setTitle("⇨", for: .normal)
//        btnContr.append(button3)
           initGesture()
        startTimer()
    }
    @objc func onTime(){
        countTime += 1
        if countTime < 180{
            
            let minute = countTime / 60
            let secund = countTime % 60
            label.text = "0\(minute):\(secund < 10 ?"0":"")\(secund)"
        }else{stopTimer()
            
            let Alert = UIAlertController(title: "YOU Lost", message: "do you want again", preferredStyle: .alert)
            let alertOk = UIAlertAction(title: "OK", style: .cancel)
            let alertExit = UIAlertAction(title: "Exit", style: .destructive){action in
                self.viewDidLoad()
                
            }
            Alert.addAction(alertOk)
            Alert.addAction(alertExit)
            self.present(Alert, animated: true)
           
        }
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTime), userInfo: nil, repeats: true)
    }
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    func check(){
        var value = true
        for i in 0...3{
            for j in 0...3{
                
                value = value && matrix[i][j] == winNumbers[i * 4 + j]
                }
                
            
        }
        if value{
            let Alert = UIAlertController(title: "YOU WIN", message: "do you want again", preferredStyle: .alert)
            let alertOk = UIAlertAction(title: "OK", style: .cancel)
            let alertExit = UIAlertAction(title: "Exit", style: .destructive){action in
                
            }
            Alert.addAction(alertOk)
            Alert.addAction(alertExit)
        }
            
    }
    func start(){
        self.numbers.shuffle()
       
        matrix[3][3] = 0
        initData()
       
    }
    func initData(){
        for i in 0...3{
            for j in 0...3{
                if i * 4 + j != 15{
                    buttons[i][j].setTitle("\(numbers[i * 4 + j])", for: .normal)
                    matrix[i][j] = numbers[i * 4 + j]
                }
            }
        }
    }
//    func shuffle(){
//        for i in 0...150{
//        var listStep = [MIndex]()
//        if emptyIndex.i > 0{
//            listStep.append(emptyIndex)
//
//        }
//        if emptyIndex.i < 15{
//            listStep.append(MIndex(i: emptyIndex.i+1, j: emptyIndex.j))
//        }
//        if emptyIndex.j > 0{
//            listStep.append(MIndex(i: emptyIndex.i+1, j: emptyIndex.j))
//        }
//        if emptyIndex.j < 15{
//            listStep.append(MIndex(i: emptyIndex.i+1, j: emptyIndex.j))
//        }
//        if let value = listStep.randomElement(){
//            moveIndex(index: value)
//        }
//
//        }
//    }
    func drawButton(size:CGRect,tag:Int) -> UIButton{
        let button = UIButton(frame: size)
        button.tag = tag
        button.layer.cornerRadius = 4
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        self.view.addSubview(button)
        
        return button
    }
    private func initGesture(){
        let pressUp = UISwipeGestureRecognizer(target: self, action: #selector(pressContr))
        pressUp.direction = .up
        let pressDown = UISwipeGestureRecognizer(target: self, action: #selector(pressContr))
        pressDown.direction = .down
        let pressLeft = UISwipeGestureRecognizer(target: self, action: #selector(pressContr))
        pressLeft.direction = .left
        let pressRight = UISwipeGestureRecognizer(target: self, action: #selector(pressContr))
        pressRight.direction = .right
        self.view.addGestureRecognizer(pressUp)
        self.view.addGestureRecognizer(pressDown)
        self.view.addGestureRecognizer(pressRight)
        self.view.addGestureRecognizer(pressLeft)
    }
   
    @objc func pressContr(_ gesture:UISwipeGestureRecognizer){
        if gesture.direction == .up{
            if emptyIndex.i < 3{
                moveIndex(index: MIndex(i: emptyIndex.i+1, j: emptyIndex.j))
            }
        }
        else if gesture.direction == .down{
            if emptyIndex.i > 0{
                moveIndex(index: MIndex(i: emptyIndex.i-1, j: emptyIndex.j))
            }
        }
        else if gesture.direction == .right{
            if emptyIndex.j > 0{
                moveIndex(index: MIndex(i: emptyIndex.i, j: emptyIndex.j-1))
            }
        }
        else if gesture.direction == .left{
            if emptyIndex.j < 3{
                moveIndex(index: MIndex(i: emptyIndex.i, j: emptyIndex.j+1))
            }
        }
            
        }
    func reload(){
        for i in 0 ... 3{
            for j in 0 ... 3{
                buttons[i][j].setTitle("\(matrix[i][j])", for: .normal)
            }
        }
        buttons[emptyIndex.i][emptyIndex.j].setTitle("", for: .normal)
       
        check()
    }
    func moveIndex(index:MIndex){
        matrix[emptyIndex.i][emptyIndex.j] =
        matrix[index.i][index.j]
        
        matrix[index.i][index.j] = 0
        
        emptyIndex = index
        
        
        reload()
    }
    
    
    func getIndex(index:Int) -> MIndex{
        let i = index / 4
        let j = index % 4
     
        return MIndex(i: i, j: j)
    }
    override func viewDidDisappear(_ animated: Bool) {
        stopTimer()
    }
}



struct MIndex{
    var i = Int()
    var j = Int()
    init(i:Int,j:Int){
        self.i = i
        self.j = j
    }
}












class Progress:UIView{
var timer:Timer?
    
   private var baseView = UIView()
    
    var tracnTink = UIView()
    
    var backColor = UIColor.black
    
    var TinkColor = UIColor.white
    
    var interval = 10
    
    private var countTime = 0
    
    private var v:CGFloat!
    
    private var vColor:Double!
    
    private var colorNum:Double = 0
    
    init(frame: CGRect,interval:Int) {
        super.init(frame: frame)
        baseView = UIView(frame: frame)
        self.interval = interval*2
        TinkColor = .systemGreen
       backColor = .systemBlue
        
        tracnTink = UIView(frame: CGRect(x: 2, y: 1, width: baseView.frame.width-4, height: baseView.frame.height-2))
        
        tracnTink.backgroundColor = UIColor(red: 30/100, green: 230/100, blue: 0/100, alpha: 0.7)
        
       baseView.backgroundColor = backColor
        self.addSubview(baseView)
        
        baseView.addSubview(tracnTink)
        
        v = tracnTink.frame.width/CGFloat(interval)/2
        vColor = 100 / Double(interval)
         
        baseView.layer.cornerRadius = baseView.frame.height/2
        tracnTink.layer.cornerRadius = tracnTink.frame.height/2
        
       
      
      
    startIt()
    }
   
    func startIt(){
        startTime()
        if interval < countTime{stopTime()}
    }
    @objc func onTime(){
       
        if countTime < interval{
            
            self.tracnTink.frame.size.width = self.tracnTink.frame.width-v
            
            self.reloadInputViews()
            
            tracnTink.backgroundColor = UIColor(red: (30+colorNum)/100, green: (200-colorNum)/100, blue: 0/100, alpha: 0.9)
          
          
        }
        else{stopTime()}
        countTime += 1
        colorNum += vColor
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func startTime(){
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(onTime), userInfo: nil, repeats: true)
    }
    func stopTime(){
        timer?.invalidate()
        timer = nil
    }
    
}
