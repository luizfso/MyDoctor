//
//  ViewControllerMyDoctor.swift
//  MyDoctor
//
//  Created by Luiz Fernando Santiago on 9/28/14.
//  Copyright (c) 2014 Luiz Fernando Santiago. All rights reserved.
//

import UIKit

class ViewControllerMyDoctor: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func RollBackButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
