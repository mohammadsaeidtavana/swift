//
//  doctorControllerViewController.swift
//  Register
//
//  Created by Saeed Tavana on 8/7/18.
//  Copyright © 2018 Saeed Tavana. All rights reserved.
//
import Foundation
import UIKit


class doctorControllerViewController: UIViewController {

 

    @IBOutlet weak var text: UITextView!
    
    @IBOutlet weak var encodeText: UITextView!
    
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
 
        text.resignFirstResponder()
        encodeText.resignFirstResponder()

        return(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func encodeF(_ sender: Any) {
        let textToEncode=text.text
        let encodedText=textToEncode?.toBase64()
        encodeText.text=encodedText
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
