//
//  PopperViewController.swift
//  Popping
//
//  Created by CraigGrummitt on 15/09/2014.
//  Copyright (c) 2014 CraigGrummitt. All rights reserved.
//

import UIKit

class PopperViewController: UIViewController, PopViewControllerDelegate {
    var popover:UIPopoverController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goPopover(sender: AnyObject) {
        
         let sb = UIStoryboard(name: "Main", bundle: nil)
        let popoverViewController = (sb.instantiateViewControllerWithIdentifier("popper")! as PopViewController)
        popoverViewController.delegate = self
        
        popover=UIPopoverController(contentViewController: popoverViewController)

        popover!.presentPopoverFromRect(sender.frame, inView: self.view, permittedArrowDirections: .Any, animated: true)
    }
    
    func closePop(sender:AnyObject) {
        popover!.dismissPopoverAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
