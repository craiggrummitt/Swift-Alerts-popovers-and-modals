//
//  FirstViewController.swift
//  Popping
//
//  Created by CraigGrummitt on 14/09/2014.
//  Copyright (c) 2014 CraigGrummitt. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var actionsheetButton: UIButton!
    @IBAction func clickAlertButton(sender: UIButton) {
        var style:UIAlertController.Style
        var styleName:String
        if (sender == alertButton) {
            style = .alert
            styleName = "Alert"
        } else {
            style = .actionSheet
            styleName = "ActionSheet"
        }
        let alertController = UIAlertController(title: "Example \(styleName)", message: "This is an \(styleName).", preferredStyle:style )
        alertController.popoverPresentationController?.sourceView = self.actionsheetButton
        alertController.popoverPresentationController?.sourceRect = self.actionsheetButton.bounds

        let callAction = UIAlertAction(title: "OK", style: .default, handler: {
                action in
                print("hit alert")
            }
        )
        alertController.addAction(callAction)
        
        present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

