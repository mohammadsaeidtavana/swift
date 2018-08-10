//
//  DecodeViewController.swift
//  Register
//
//  Created by Saeed Tavana on 8/8/18.
//  Copyright © 2018 Saeed Tavana. All rights reserved.
//
import Foundation
import UIKit

extension String {
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
class DecodeViewController: UIViewController {
    
    
    
    

    
    @IBOutlet weak var text2: UITextView!
    @IBOutlet weak var decodedtext: UITextView!
    
    
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var encodetext: UITextView!
    
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
        encodetext.resignFirstResponder()
        text2.resignFirstResponder()
        decodedtext.resignFirstResponder()
        
        return(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func encodeTextF(_ sender: Any) {
        
        let textToEncode=text.text
        encodetext.text=textToEncode?.toBase64()
        
    }
    
    @IBAction func decodeTextF(_ sender: Any) {
        let textToDecode=text2.text
        decodedtext.text=textToDecode?.fromBase64()
    }
    
    @IBAction func OpenT(_ sender: Any) {
           UIApplication.shared.openURL(NSURL(string: "tg://msg?")! as URL)
    }
    
    
    @IBAction func OpenW(_ sender: Any) {
         UIApplication.shared.openURL(NSURL(string: "whatsapp://send?")! as URL)
    }
    
    @IBAction func OpenWhatsapp(_ sender: Any) {
        
        UIApplication.shared.openURL(NSURL(string: "whatsapp://send?")! as URL)
    }
    
    @IBAction func OpenTelegram(_ sender: Any) {
        
        UIApplication.shared.openURL(NSURL(string: "tg://msg?")! as URL)
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
