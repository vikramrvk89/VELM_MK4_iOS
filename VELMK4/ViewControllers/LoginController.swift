//
//  ViewController.swift
//  VELMK4
//
//  Created by R VIKRAM on 04/08/18.
//  Copyright © 2018 R VIKRAM. All rights reserved.
//

import UIKit
import DropDown

class LoginController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet private var userText: UITextField?
    @IBOutlet private var passwordText: UITextField?
    @IBOutlet private var signInBtn: UIButton?
    @IBOutlet private var signUpBtn: UIButton?
    @IBOutlet private var exitBtn: UIButton?
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.anchorView = userText
        dropDown.dataSource = DatabaseHandler.getInstance().getAllUsers()
        dropDown.textColor = UIColor.white
        dropDown.backgroundColor = UIColor.blue
        dropDown.separatorColor = UIColor.black
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.userText?.text = item
        }
        
        initViewItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func initViewItems(){
        signInBtn?.layer.cornerRadius = 5
        signInBtn?.clipsToBounds = true
        
        signUpBtn?.layer.cornerRadius = 5
        signUpBtn?.clipsToBounds = true
        
        exitBtn?.layer.cornerRadius = 5
        exitBtn?.clipsToBounds = true
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: (passwordText?.frame.height)! - 1, width: (passwordText?.frame.width)!, height: 1.0)
        bottomLine.backgroundColor = UIColor.blue.cgColor
        passwordText?.borderStyle = UITextBorderStyle.none
        passwordText?.layer.addSublayer(bottomLine)
        
        let userLine = CALayer()
        userLine.frame = CGRect(x: 0.0, y: (userText?.frame.height)! - 1, width: (userText?.frame.width)!, height: 1.0)
        userLine.backgroundColor = UIColor.blue.cgColor
        userText?.borderStyle = UITextBorderStyle.none
        userText?.layer.addSublayer(userLine)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userText {
            textField.resignFirstResponder()
            dropDown.show()
        }
        
    }
    @IBAction func signInBtnAction(sender: AnyObject){
        
        if userText?.text != "" && passwordText?.text != "" {
            if DatabaseHandler.getInstance().verifyUser(username: (userText?.text)!, password: (passwordText?.text)!){
                let viewController = self.storyboard?.instantiateViewController(withIdentifier: "BLESetupController") as! BLESetupController
                self.navigationController?.pushViewController(viewController, animated: true)
            }else{
              showAlertView(message: "Invalid Password")
            }
        }else{
            showAlertView(message: "All Fields Required")
        }
       
    }
    
    @IBAction func signUpBtnAction(sender: AnyObject){
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func exitBtnAction(sender: AnyObject){
        
    }
    
    func showAlertView(message: String){
        let alert = UIAlertController(title: "VELM_MK4", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}

