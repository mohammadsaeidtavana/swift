//
//  ViewControllerRegister.swift
//  Register
//
//  Created by Saeed Tavana on 8/7/18.
//  Copyright © 2018 Saeed Tavana. All rights reserved.
//

import UIKit

class ViewControllerRegister: UIPageViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var family: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var Rpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
