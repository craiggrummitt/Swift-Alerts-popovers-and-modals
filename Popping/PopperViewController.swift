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
    
    @IBAction func goPopover(sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let popoverViewController = (sb.instantiateViewController(withIdentifier: "popper") as! PopViewController)
        popoverViewController.delegate = self
        
        popover=UIPopoverController(contentViewController: popoverViewController)

        popover!.present(from: sender.frame, in: self.view, permittedArrowDirections: .any, animated: true)
    }
    
    func closePop(sender:AnyObject) {
        popover!.dismiss(animated: true)
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
