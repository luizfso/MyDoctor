//
//  ViewController.swift
//  MyDoctor
//
//  Created by Luiz Fernando Santiago on 9/27/14.
//  Copyright (c) 2014 Luiz Fernando Santiago. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet var fbLoginView : FBLoginView!
    
    @IBOutlet weak var textfieldUsername: UITextField!
    
    @IBOutlet weak var textfieldPassword: UITextField!
    
    @IBOutlet weak var labelError: UILabel!
    
    @IBAction func buttonLogin(sender: AnyObject)
    {
        var user = "luiz"
        var pass = "1234"
        
        if textfieldUsername.text == user &&
        textfieldPassword.text == pass
        {
            let MainMenuScene = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuScene") as ViewControllerMenu
            self.navigationController?.pushViewController(MainMenuScene, animated: true)
            textfieldUsername.resignFirstResponder()
            textfieldPassword.resignFirstResponder()
            
        }
         else
        
        {
            labelError.text = "Usuário ou Senha incorreta"
            labelError.textColor = UIColor.redColor()
            textfieldUsername.resignFirstResponder()
            textfieldPassword.resignFirstResponder()
            textfieldUsername.text = ""
            textfieldPassword.text = ""
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // FACEBOOK DELEGATE METHODS
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        println("This is where you perform a segue.")
        let MainMenuScene = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuScene") as ViewControllerMenu
        self.navigationController?.pushViewController(MainMenuScene, animated: true)
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        println("User Name: \(user.name)")
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

