//
//  CompanyController.swift
//  VELMK4
//
//  Created by R VIKRAM on 07/08/18.
//  Copyright © 2018 R VIKRAM. All rights reserved.
//

import UIKit
import DropDown

class CompanyController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet private var companyTxt: UITextField?
    @IBOutlet private var planTxt: UITextField?
    @IBOutlet private var okBtn: UIButton?
    let companyDropDown = DropDown()
    let planDropDown = DropDown()

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
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func initViewItems(){
        //self.navigationController?.navigationBar.topItem?.title = "VELM_MK4"
        self.navigationItem.title = "VELM_MK4"
        okBtn?.layer.cornerRadius = 5
        okBtn?.clipsToBounds = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == companyTxt || textField == planTxt {
            textField.resignFirstResponder()
            companyDropDown.show()
        }
        
    }
    
    @IBAction func saveBtnAction(sender: AnyObject){
       
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
