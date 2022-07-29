//
//  777TableViewCell.swift
//  MyGames
//
//  Created by admin on 7/23/22.
//

import UIKit

class _77TableView: UIViewController {
  var listImage = [LotteryItem]()
    
    var timer:Timer?
    
    var firstBlock:LotteryItemView!
    
    var secondBlock:LotteryItemView!
    
    var thirdBlock:LotteryItemView!
    
    var label = UILabel()
    
    var score = 20
    
    override func viewDidLoad() {
      super.viewDidLoad()
        
        initData()
      initView()
        label = UILabel(frame: (CGRect(x: (windowWidth-100)/2, y: 50, width: 100, height: 60)))
        label.text = "$\(score)"
        label.font = .systemFont(ofSize: 25)
        self.view.addSubview(label)
        
        
    }
  
    @objc func onPress(){
       // initView()
        firstBlock.roll()
       secondBlock.roll()
        thirdBlock.roll()
    }
   
}




class LotteryItemView:UIView,UITableViewDelegate,UITableViewDataSource{
    
    var tableView:UITableView!
    
    var id = 0
    
var items: [LotteryItem]!
    init(frame:CGRect,items:[LotteryItem]){
        self.items = items
        self.items.append(contentsOf: items)
        super.init(frame: frame)
      
        initView(frame: frame)
    }
    func calkulate(){

        
    }
    func initView(frame:CGRect){
       
        tableView = UITableView(frame: CGRect(x: 5, y: 5, width: frame.width-10, height: frame.height-10))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LotteryItemCell.self, forCellReuseIdentifier: "LotteryItemCell")
       
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        self.addSubview(tableView)
        
      
      

      
    }
    func roll(){
        items.shuffle()
        self.id = Int.random(in: self.items.count/2 ... self.items.count-1)
        
        UIView.animate(withDuration: 3.0, delay: 4.0, options: .curveEaseIn) {
           
            self.tableView.scrollToRow(at: IndexPath.init(row: self.id, section: 0), at: .middle, animated: true)
           
//            self.tableView.selectRow(at: IndexPath.init(row: Int.random(in: self.items.count/2...self.items.count-1), section: 0), animated: true, scrollPosition: .middle)
//            
        } //completion:
//        { done in
//
//        }
      //  tableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LotteryItemCell(item: items[indexPath.row], frame: tableView.frame)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  self.frame.height
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class LotteryItemCell:UITableViewCell{
    
    init(item:LotteryItem,frame:CGRect){
        super.init(style: .default, reuseIdentifier: "LotteryItemCell")
        initView(frame: frame,item:item)
    }
    func  initView(frame:CGRect,item:LotteryItem){
        let baseView = UIView(frame: frame)
        baseView.backgroundColor = .clear
        self.contentView.addSubview(baseView)
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        image.image = UIImage(named: item.image)
        
        baseView.addSubview(image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



struct LotteryItem {
    
    var image:String
    var id:Int = 0
    //var price:Int = 0
    init(image:String,id:Int){
        self.id = id
        self.image = image
    }
    
}
extension _77TableView{
    
    func initData(){
        listImage.append(LotteryItem(image: "1", id: 1))
        listImage.append(LotteryItem(image: "2", id: 2))
        listImage.append(LotteryItem(image: "3", id: 3))
        listImage.append(LotteryItem(image: "4", id: 4))
        listImage.append(LotteryItem(image: "5", id: 5))
        listImage.append(LotteryItem(image: "6", id: 6))
        listImage.append(LotteryItem(image: "7", id: 7))
        listImage.append(LotteryItem(image: "8", id: 8))
        listImage.append(LotteryItem(image: "9", id: 9))
    }
   func initView(){
       self.view.backgroundColor = .lightGray
       let top:CGFloat = windowHeight*0.3
       let sideSpace:CGFloat = 25
       let space:CGFloat = 10
       let sizeItem:CGFloat = (windowWidth-70) / 3
        firstBlock = LotteryItemView(frame: CGRect(x: sideSpace, y: top, width: sizeItem, height: sizeItem), items: listImage)
       secondBlock = LotteryItemView(frame: CGRect(x: sideSpace+sizeItem+space, y: top, width: sizeItem, height: sizeItem), items: listImage)
       
       thirdBlock = LotteryItemView(frame: CGRect(x: 2*(space+sizeItem)+sideSpace, y: top, width: sizeItem, height: sizeItem), items: listImage)
       self.view.addSubview(firstBlock)
       self.view.addSubview(secondBlock)
       self.view.addSubview(thirdBlock)
       
       let button = UIButton(frame: CGRect(x: 20, y: 350, width: windowWidth-40, height: 60))
       button.layer.cornerRadius = 12
       button.backgroundColor = .green
       button.setTitleColor(.blue, for: .normal)
       button.setTitle("ROLL", for: .normal)
       button.addTarget(self, action: #selector(onPress), for: .touchUpInside)
       self.view.addSubview(button)
    }
}
