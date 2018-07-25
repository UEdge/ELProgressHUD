//
//  ViewController.swift
//  ELProgressHUDSwift
//
//  Created by Dylan on 2018/7/4.
//  Copyright © 2018年 Dylan. All rights reserved.
//

import UIKit
import ELProgressHUD

class ViewController: UIViewController {

//    var elp:ELProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @IBAction func showinfo(_ sender: Any) {
         print("showinfo");
        
        ELProgressHUD.showInfo("showInfo", toView: self.view)
//        DYAlertControllerTool.showAlert(currentVC: self, title:"title", meg: "msg", cancelBtn: "cancel", otherBtn: "other") { (action) in
//            print("click")
//        }
//        DYAlertControllerTool.showAlert(currentVC: self, cancelBtn: "關閉", meg: "msg", title: "title")
        
//        DYAlertControllerTool.showAlert(currentVC: self, title: "title", meg: "msg", cancelBtn: "cancel", otherBtn: "other", cencelHandler: { (action) in
//              print("cancekl")
//        }) { (action) in
//              print("ok ")
//        }
    }
 
    @IBAction func Click_Success(_ sender: Any) {
        print("Click_Success");
        ELProgressHUD.showSuccess("showSuccess", toView: self.view)
    }
    
    
   
    @IBAction func click_Error(_ sender: Any) {
        print("click_Error");
 
        
        ELProgressHUD.showError("showError", toView: self.view)
        
    }
    
    
    @IBAction func click_Warn(_ sender: Any) {
        print("click_Warn")
        ELProgressHUD.showWarn("showWarn", toView: self.view)
    }
    
    
    @IBAction func showLoadtoView(_ sender: Any) {
        
         print("showLoadtoView");
        ELProgressHUD.showLoadToView("上转中", View: self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            
            ELProgressHUD.hidehudForView(view: self.view)
//            ELProgressHUD.hideHud()
        }
        
        
    }
    
    
    @IBAction func showAutoMessage(_ sender: Any) {
         print("showAutoMessage");
//        ELProgressHUD.showAutoMessage("showAutoMessage")
    }
    
    
    @IBAction func showIconMessage(_ sender: Any) {
        
         print("showIconMessage");
        ELProgressHUD.showIconMessage("showIconMessage", View: self.view, RemainTime: 5)
        
    }
    @IBAction func showAutoMessage_2(_ sender: Any) {
        
         print("showAutoMessage_2");
        ELProgressHUD.showAutoMessage("showAutoMessage_2", View: self.view)
        
    }
   
    
    @IBAction func showMessage(_ sender: Any) {
         print("showMessage");
        ELProgressHUD.showMessage("showMessage", View: self.view, RemainTime: 1.5)
    }
    
    @IBAction func hidehudForView(_ sender: Any) {
        print("hidehudForView");
      
        ELProgressHUD.hidehudForView(view: self.view)
    }
    @IBAction func hideHud(_ sender: Any) {
        
            print("hideHud");
//        ELProgressHUD.hideHud()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    
}

