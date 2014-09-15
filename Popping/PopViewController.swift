//
//  PopViewController.swift
//  Popping
//
//  Created by CraigGrummitt on 14/09/2014.
//  Copyright (c) 2014 CraigGrummitt. All rights reserved.
//

import UIKit

protocol PopViewControllerDelegate {
    func closePop(sender:AnyObject)
}

class PopViewController: UIViewController {
    var delegate:PopViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickCloseButton(sender: AnyObject) {
        self.delegate?.closePop(self)
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
