//
//  ForgetViewController.swift
//  Register
//
//  Created by Saeed Tavana on 8/7/18.
//  Copyright © 2018 Saeed Tavana. All rights reserved.
//

import UIKit

class ForgetViewController: UIViewController,UITextFieldDelegate ,UIPageViewControllerDelegate {

    @IBOutlet weak var rpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var id: UITextField!
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
        rpassword.resignFirstResponder()
        username.resignFirstResponder()
        id.resignFirstResponder()
        password.resignFirstResponder()
        return(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Request(_ sender: Any) {
        
        if id.text == "" || username.text == "" || password.text == "" || rpassword.text == ""  {
            
            let alertController = UIAlertController(title: "Warning", message:
                "ID ,Username ,Password ,Re type password could not be empty  ", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true,completion: nil)
        }
        else
        {
            if password.text == rpassword.text
            {
                if let url = URL(string: "http://172.20.10.7:8080/register/reset?id="+id.text!+"&username="+username.text!+"&password="+password.text!) {
                    do {
                        let contents = try String(contentsOf: url)
                        
                        if contents == "true" {
                            let alertController = UIAlertController(title: "Info", message:
                                "New password has been set . please check your email for more information ", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alertController, animated: true,completion: nil)
                    
                            id.text=""
                            username.text=""
                            password.text=""
                            rpassword.text=""
                            
                        }
                        else
                        {
                            let alertController = UIAlertController(title: "ERROR", message:
                                "user has not added to system ", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alertController, animated: true,completion: nil)
                            
                            id.text=""
                            username.text=""
                            password.text=""
                            rpassword.text=""
                            
                            
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
