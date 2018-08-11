//
//  RegisterController.swift
//  VELMK4
//
//  Created by R VIKRAM on 07/08/18.
//  Copyright © 2018 R VIKRAM. All rights reserved.
//

import UIKit

class RegisterController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet private var adminPasswordTxt: UITextField?
    @IBOutlet private var userTxt: UITextField?
    @IBOutlet private var userPasswordTxt: UITextField?
    @IBOutlet private var confirmPasswordTxt: UITextField?
    @IBOutlet private var homeBtn: UIButton?
    @IBOutlet private var saveBtn: UIButton?
    @IBOutlet private var verifyBtn: UIButton?


    override func viewDidLoad() {
        super.viewDidLoad()
     initViewItems()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        if textField == confirmPasswordTxt{
            NotificationCenter.default.removeObserver(self)

        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == confirmPasswordTxt {
            NotificationCenter.default.addObserver(self, selector: #selector(RegisterController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(RegisterController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        }
        
    }
    
    func initViewItems(){
        homeBtn?.layer.cornerRadius = 5
        homeBtn?.clipsToBounds = true
        
        saveBtn?.layer.cornerRadius = 5
        saveBtn?.clipsToBounds = true
        
        verifyBtn?.layer.cornerRadius = 5
        verifyBtn?.clipsToBounds = true
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: (adminPasswordTxt?.frame.height)! - 1, width: (adminPasswordTxt?.frame.width)!, height: 1.0)
        bottomLine.backgroundColor = UIColor.red.cgColor
        adminPasswordTxt?.borderStyle = UITextBorderStyle.none
        adminPasswordTxt?.layer.addSublayer(bottomLine)
        
        let nameLine = CALayer()
        nameLine.frame = CGRect(x: 0.0, y: (userTxt?.frame.height)! - 1, width: (userTxt?.frame.width)!, height: 1.0)
        nameLine.backgroundColor = UIColor.red.cgColor
        userTxt?.borderStyle = UITextBorderStyle.none
        userTxt?.layer.addSublayer(nameLine)
        
        let passwordLine = CALayer()
        passwordLine.frame = CGRect(x: 0.0, y: (userPasswordTxt?.frame.height)! - 1, width: (userPasswordTxt?.frame.width)!, height: 1.0)
        passwordLine.backgroundColor = UIColor.red.cgColor
        userPasswordTxt?.borderStyle = UITextBorderStyle.none
        userPasswordTxt?.layer.addSublayer(passwordLine)
        
        
        let confirmLine = CALayer()
        confirmLine.frame = CGRect(x: 0.0, y: (confirmPasswordTxt?.frame.height)! - 1, width: (confirmPasswordTxt?.frame.width)!, height: 1.0)
        confirmLine.backgroundColor = UIColor.red.cgColor
        confirmPasswordTxt?.borderStyle = UITextBorderStyle.none
        confirmPasswordTxt?.layer.addSublayer(confirmLine)
    }
    
    @IBAction func verifyBtnAction(sender: AnyObject){
        
        if adminPasswordTxt?.text == "okbyanna"{
            self.saveBtn?.isEnabled = true
            self.userTxt?.isEnabled = true
            self.userPasswordTxt?.isEnabled = true
            self.confirmPasswordTxt?.isEnabled = true
            self.adminPasswordTxt?.isEnabled = false
            self.verifyBtn?.isEnabled = false
            showAlertView(message:"Admin Password Verified")
        }else{
            showAlertView(message:"Wrong Admin Password")
        }
        
    }
    
    @IBAction func homeBtnAction(sender: AnyObject){
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func saveBtnAction(sender: AnyObject){
        if userTxt?.text != "" && userPasswordTxt?.text != "" && confirmPasswordTxt?.text != ""{
            if userPasswordTxt?.text == confirmPasswordTxt?.text{
                if !DatabaseHandler.getInstance().checkUser(username:(userTxt?.text)!){
                    if(DatabaseHandler.getInstance().InsertUser(username: (userTxt?.text)!, password: (userPasswordTxt?.text)!)){
                        self.navigationController?.popViewController(animated: true)
                        showAlertView(message:"User Registered Successfully")
                    }
                }else{
                    showAlertView(message:"User Already Registered")
                }
            }else{
                showAlertView(message:"Passwords don't match.")
            }
            
        }else{
            showAlertView(message:"All Fields Required")
        }
        
    }
    
    func showAlertView(message: String){
        let alert = UIAlertController(title: "VELM_MK4", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
