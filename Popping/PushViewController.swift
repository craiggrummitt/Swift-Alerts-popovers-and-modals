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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return(pickerTransitionArray[row])
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTransitionArray.count
    }
    
    //MARK: IBActions
    @IBAction func clickPushButton(sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        pusherViewController = (sb.instantiateViewController(withIdentifier: "pusher") as UIViewController)
        self.navigationController?.pushViewController(pusherViewController!, animated: true)
    }
    @IBAction func clickPushChangeAnimation(sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        pusherViewController = (sb.instantiateViewController(withIdentifier: "pusher") as UIViewController)
        
        var trans:UIView.AnimationTransition
        switch transitionPicker.selectedRow(inComponent: 0) {
        case 0:
            trans = .curlDown
        case 1:
            trans = .curlUp
        case 2:
            trans = .flipFromLeft
        case 3:
            trans = .flipFromRight
        default:
            trans = .none
        }

//        var navigationController = UINavigationController()
        UIView.animate(withDuration: 0.75, animations: {
            UIView.setAnimationCurve(.easeInOut)
            self.navigationController?.pushViewController(self.pusherViewController!, animated: false)
            UIView.setAnimationTransition(trans, for: self.navigationController!.view, cache: false)
            
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
