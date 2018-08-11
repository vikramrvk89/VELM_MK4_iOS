//
//  BLESetupController.swift
//  VELMK4
//
//  Created by R VIKRAM on 07/08/18.
//  Copyright © 2018 R VIKRAM. All rights reserved.
//

import UIKit

class BLESetupController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet private var rfidTxt: UITextField?
    @IBOutlet private var gfmTxt: UITextField?
    @IBOutlet private var scanBtn: UIButton?
    @IBOutlet private var saveBtn: UIButton?
    @IBOutlet private var bleTableView: UITableView?


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
        bleTableView?.register(BLECell.self, forCellReuseIdentifier: "BLECell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = self.bleTableView!.dequeueReusableCell(withIdentifier: "BLECell")! as! BLECell
    
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveBtnAction(sender: AnyObject){
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RFIDController") as! RFIDController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func scanBtnAction(sender: AnyObject){
        
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
