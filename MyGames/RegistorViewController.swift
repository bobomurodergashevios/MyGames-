//
//  RegistorViewController.swift
//  MyGames
//
//  Created by admin on 7/18/22.
//

import UIKit

class RegistorViewController: UIViewController {
    var baseView : UIView!
    
    var loginText = UITextField()
    var passwordText = UITextField()
    var  repasswordText = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray

         baseView = UIView(frame: CGRect(x: 10, y: 80, width: windowWidth-20, height: windowWidth-20))
        baseView.layer.cornerRadius = 16
        baseView.backgroundColor = .lightGray
        self.view.addSubview(baseView)
        
        
        
        let loginLabel = UILabel(frame: CGRect(x: 10, y: 20, width: baseView.frame.width-20, height: 30))
        loginLabel.text = "Add login!"
        baseView.addSubview(loginLabel)
        
        let loginView = UIView(frame: CGRect(x: 10, y: loginLabel.frame.maxY, width: baseView.frame.width-20, height: 40))
        loginView.backgroundColor = .white
        loginView.layer.cornerRadius = 14
        baseView.addSubview(loginView)
        
        loginText = UITextField(frame: CGRect(x: 20, y: 0, width: loginView.frame.width-40, height: 40))
        loginText.backgroundColor = .white
        loginText.font = .systemFont(ofSize: 23)
        loginView.addSubview(loginText)
        
        
        
        let passwordLabel = UILabel(frame: CGRect(x: 10, y:loginView.frame.maxY + 30, width: baseView.frame.width-20, height: 30))
        passwordLabel.text = "Add Password!"
        baseView.addSubview(passwordLabel)
        
        let passwordView = UIView(frame: CGRect(x: 10, y: passwordLabel.frame.maxY, width: baseView.frame.width-20, height: 40))
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 14
        baseView.addSubview(passwordView)
        
        passwordText = UITextField(frame: CGRect(x: 20, y: 0, width: passwordView.frame.width-40, height: 40))
        passwordText.backgroundColor = .white
        passwordText.font = .systemFont(ofSize: 23)
        passwordView.addSubview(passwordText)
        
        
        
        
        let repasswordLabel = UILabel(frame: CGRect(x: 10, y: passwordView.frame.maxY + 30, width: baseView.frame.width-20, height: 30))
        repasswordLabel.text = "write password again"
        baseView.addSubview(repasswordLabel)
        
        let repasswordView = UIView(frame: CGRect(x: 10, y: repasswordLabel.frame.maxY, width: baseView.frame.width-20, height: 40))
        repasswordView.backgroundColor = .white
        repasswordView.layer.cornerRadius = 14
        baseView.addSubview(repasswordView)
        
        repasswordText = UITextField(frame: CGRect(x: 20, y: 0, width: repasswordView.frame.width-40, height: 40))
        repasswordText.backgroundColor = .white
        repasswordText.font = .systemFont(ofSize: 23)
        repasswordView.addSubview(repasswordText)
        
        
        
        let btnRgst = UIButton(frame: CGRect(x: 30, y: baseView.frame.maxY+40, width: windowWidth-60, height: 60))
        btnRgst.backgroundColor = .blue
        btnRgst.setTitleColor(.green, for: .normal)
        btnRgst.addTarget(self, action: #selector(pressRgst(_:)), for: .touchUpInside)
        btnRgst.layer.cornerRadius = 18
        btnRgst.setTitle("OK", for: .normal)
        btnRgst.titleLabel?.font = .systemFont(ofSize: 26)
        
        self.view.addSubview(btnRgst)
        
    }
    @objc func pressRgst(_ sander:UIButton){
        if repasswordText.text == passwordText.text &&
            loginText.text?.count ?? 0 > 1{
            File.AddRegister(register: register(password: passwordText.text ?? "", login: loginText.text ?? ""))
            navigationController?.popViewController(animated: true)
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
