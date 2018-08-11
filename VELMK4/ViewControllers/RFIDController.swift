//
//  RFIDController.swift
//  VELMK4
//
//  Created by R VIKRAM on 08/08/18.
//  Copyright © 2018 R VIKRAM. All rights reserved.
//

import UIKit

class RFIDController: UIViewController {
    
    @IBOutlet private var equipIdTxt: UITextField?
    @IBOutlet private var equipDescTxt: UITextField?
    @IBOutlet private var rfidTagTxt: UITextField?
    @IBOutlet private var rfidScanTxt: UITextField?
    @IBOutlet private var pendingTxt: UITextField?
    @IBOutlet private var scanBtn: UIButton?
    @IBOutlet private var continueBtn: UIButton?
    @IBOutlet private var routePlanLbl: UILabel?
    @IBOutlet private var statusLbl: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        initViewItems() // Do any additional setup after loading the view.
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
    }
    
    @IBAction func scanBtnAction(sender: AnyObject){
        
    }
    
    @IBAction func continueBtnAction(sender: AnyObject){
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "GreaseReadyController") as! GreaseReadyController
        self.navigationController?.pushViewController(viewController, animated: true)
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
