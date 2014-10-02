//
//  ViewControllerMenu.swift
//  MyDoctor
//
//  Created by Luiz Fernando Santiago on 9/27/14.
//  Copyright (c) 2014 Luiz Fernando Santiago. All rights reserved.
//

import UIKit
import iAd
import MapKit

class ViewControllerMenu: UIViewController, FBLoginViewDelegate, ADBannerViewDelegate, MKMapViewDelegate {

    
    @IBAction func ButtonMap(sender: AnyObject) {
        println("teste2")
        let MapViewScene = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewScene") as ViewControllerMap
        println("teste3")
        self.navigationController?.pushViewController(MapViewScene, animated: true)
       
    }
    
    @IBAction func ButtonTableDrugs(sender: AnyObject) {
        let TableDrugsScene = self.storyboard?.instantiateViewControllerWithIdentifier("TableDrugsScene") as ViewControllerTableDrugs
        self.navigationController?.pushViewController(TableDrugsScene, animated: true)
    }
    
    @IBAction func ButtonMyDoctor(sender: AnyObject) {
        let MyDoctorScene = self.storyboard?.instantiateViewControllerWithIdentifier("MyDoctorScene") as ViewControllerMyDoctor
        self.navigationController?.pushViewController(MyDoctorScene, animated: true)
    }
    
    @IBAction func ButtonMyDrugs(sender: AnyObject) {
        let RemeberDrugsScene = self.storyboard?.instantiateViewControllerWithIdentifier("RemeberDrugsScene") as ViewControllerRembDrugs
        self.navigationController?.pushViewController(RemeberDrugsScene, animated: true)
    }
    
    @IBAction func RollBackButton(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        var fbLoginView: FBLoginView!
    }
    
    @IBOutlet weak var fbLoginView: FBLoginView!
    
    
    @IBOutlet var iAdBanner: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("teste1")
        
        self.canDisplayBannerAds = true
        self.iAdBanner.delegate = self
        self.iAdBanner.hidden = true //hide until ad loaded
        // Do any additional setup after loading the view.
        
    }
    
    
    //------------------------
    
    // FUNCTIONS FOR iAD BANNER
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewWillLoadAd")
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        self.iAdBanner.hidden = false //now show banner as ad is loaded
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        
        //optional resume paused game code
        
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        NSLog("bannerViewActionShouldBegin")
        
        //optional pause game code
        
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("bannerView")
        
    }
    
    //------------------------
    
    // FACEBOOK DELEGATE METHODS
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        let LoginScene = self.storyboard?.instantiateViewControllerWithIdentifier("LoginScene") as ViewController
        self.navigationController?.pushViewController(LoginScene, animated: true)
        println("User Logged In")
        println("This is where you perform a segue.")
        
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
    
    
    //------------------------
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
}
