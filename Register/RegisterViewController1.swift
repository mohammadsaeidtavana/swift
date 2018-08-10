//
//  RegisterViewController1.swift
//  Register
//
//  Created by Saeed Tavana on 8/7/18.
//  Copyright © 2018 Saeed Tavana. All rights reserved.
//

import UIKit
import SwiftyJSON

class RegisterViewController1: UIViewController,UITextFieldDelegate ,UIPageViewControllerDelegate{

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var family: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var Rpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        username.resignFirstResponder()
        password.resignFirstResponder()
        name.resignFirstResponder()
        id.resignFirstResponder()
        password.resignFirstResponder()
        Rpassword.resignFirstResponder()
        return(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Register(_ sender: Any) {
        if id.text == "" || username.text == "" || password.text == "" || Rpassword.text == ""  {
            
            let alertController = UIAlertController(title: "Warning", message:
                "ID ,Username ,Password ,Re type password could not be empty  ", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true,completion: nil)
        }
        else
        {
            if password.text == Rpassword.text
            {
                if let url = URL(string: "http://172.20.10.7:8080/register/registerPesron?name="+name.text!+"&family="+family.text!+"&id="+id.text!+"&username="+username.text!+"&email="+email.text!+"&password="+password.text!) {
                    do {
                        let contents = try String(contentsOf: url)
                        
                        if contents == "true" {
                            let alertController = UIAlertController(title: "Info", message:
                                "New User has been added . please check your email for more information ", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alertController, animated: true,completion: nil)
                            name.text=""
                            family.text=""
                            id.text=""
                            username.text=""
                            password.text=""
                            email.text=""
                            Rpassword.text=""
                            
                        }
                        else
                        {
                            let alertController = UIAlertController(title: "ERROR", message:
                                "user has not added to system ", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alertController, animated: true,completion: nil)
                            name.text=""
                            family.text=""
                            id.text=""
                            username.text=""
                            password.text=""
                            email.text=""
                            Rpassword.text=""
                            
                            
                        }
                        
                    }
                    catch {
                        // contents could not be loaded
                        let alertController = UIAlertController(title: "ERROR", message:
                            "connection refused . check your internet  ", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                        
                        self.present(alertController, animated: true,completion: nil)
                    }
                    
                    ////////////////////
                    
                    
                }
            }
            else
            {
                let alertController = UIAlertController(title: "Warning", message:
                    "password and Retype password does not match  ", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true,completion: nil)
                
            }
            
        }
        
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
