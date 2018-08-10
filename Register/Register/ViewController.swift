//
//  ViewController.swift
//  Register
//
//  Created by Saeed Tavana on 8/7/18.
//  Copyright © 2018 Saeed Tavana. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import LocalAuthentication

class ViewController: UIViewController,UITextFieldDelegate ,UIPageViewControllerDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var myb: UIButton!
    
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "place your Finger to be able for login!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        //self.runSecretCode()
                        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier:"doctorpanleController") as! doctorControllerViewController
                        self.navigationController?.pushViewController(secondViewController, animated: true)
                        
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)
                        
                        
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        myb.layer.cornerRadius = 75
        myb.clipsToBounds = true
        
        username.text=nil
        password.text=nil
        
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.text=nil
        password.text=nil
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        username.resignFirstResponder()
        password.resignFirstResponder()
        return(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func FingerP(_ sender: Any) {
        authenticateUser()
    }
    
    @IBAction func login(_ sender: Any) {
        if username.text == "" || password.text == "" {
            let alertController = UIAlertController(title: "Warning", message:
                "Username or Pasword can not be empty .Enter username and password ", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true,completion: nil)
        }
        else
        {
            if let url = URL(string: "http://172.20.10.7:8080/register/login?username="+username.text!+"&password="+password.text!) {
                do {
                    let contents = try String(contentsOf: url)
                    
                    if contents == "true" {
                        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier:"doctorpanleController") as! doctorControllerViewController
                        self.navigationController?.pushViewController(secondViewController, animated: true)
                        
                    }
                    else
                    {
                        let alertController = UIAlertController(title: "ERROR", message:
                            "Username or Pasword is incorrect ,please try agian", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                        
                        self.present(alertController, animated: true,completion: nil)
                        
                        
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
    }
    
}

