//
//  ProfileViewController.swift
//  Order In Library
//
//  Created by Student on 5/14/18.
//  Copyright © 2018 Balgard. All rights reserved.
//

import UIKit
var firstName = ""
var lastName = ""


class ProfileViewController: UIViewController {

    @IBOutlet weak var fNameTextField: UITextField!
    
    @IBOutlet weak var lNameTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
    }
    
    
    @IBAction func createButton(_ sender: UIButton)
    {
        firstName = fNameTextField.text!
        lastName = lNameTextField.text!
    }
    

}
