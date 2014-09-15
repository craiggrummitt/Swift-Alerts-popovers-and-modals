//
//  PushViewController.swift
//  Popping
//
//  Created by CraigGrummitt on 14/09/2014.
//  Copyright (c) 2014 CraigGrummitt. All rights reserved.
//

import UIKit

class PushViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var transitionPicker: UIPickerView!
    
    var pusherViewController:UIViewController!
    let pickerTransitionArray = ["CurlDown","CurlUp","FlipFromLeft","FlipFromRight","None"] //UIViewAnimationTransition
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitionPicker.dataSource = self
        transitionPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    //MARK: pickerViewDelegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTransitionArray.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return(pickerTransitionArray[row])
    }
    
    //MARK: IBActions
    @IBAction func clickPushButton(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        pusherViewController = (sb.instantiateViewControllerWithIdentifier("pusher")! as UIViewController)
        self.navigationController?.pushViewController(pusherViewController!, animated: true)
    }
    @IBAction func clickPushChangeAnimation(sender: AnyObject) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        pusherViewController = (sb.instantiateViewControllerWithIdentifier("pusher")! as UIViewController)
        
        var trans:UIViewAnimationTransition
        switch transitionPicker.selectedRowInComponent(0) {
        case 0:
            trans = .CurlDown
        case 1:
            trans = .CurlUp
        case 2:
            trans = .FlipFromLeft
        case 3:
            trans = .FlipFromRight
        default:
            trans = .None
        }

        var navigationController = UINavigationController()
        UIView.animateWithDuration(0.75, animations: {
            UIView.setAnimationCurve(.EaseInOut)
            self.navigationController?.pushViewController(self.pusherViewController!, animated: false)
            UIView.setAnimationTransition(trans, forView: self.navigationController!.view, cache: false)
            
        })
        
        /*MainView *nextView = [[MainView alloc] init];
        [UIView animateWithDuration:0.75
        animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [self.navigationController pushViewController:nextView animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
        }];*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
