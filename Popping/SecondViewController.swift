//
//  SecondViewController.swift
//  Popping
//
//  Created by CraigGrummitt on 14/09/2014.
//  Copyright (c) 2014 CraigGrummitt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate, PopViewControllerDelegate {

    @IBOutlet weak var transitionPicker: UIPickerView!
    @IBOutlet weak var presentationPicker: UIPickerView!
    @IBOutlet weak var presentButton: UIButton!
    @IBOutlet weak var xSlider: UISlider!
    @IBOutlet weak var ySlider: UISlider!
    
    
    let pickerTransitionArray = ["CoverVertical","FlipHorizontal","CrossDissolve","PartialCurl"]
    let pickerPresentationArray = ["FullScreen","PageSheet","FormSheet","CurrentContext","Custom","OverFullScreen","OverCurrentContext","Popover"]
    
    var popupViewController:PopViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionPicker.dataSource = self
        transitionPicker.delegate = self
        presentationPicker.dataSource = self
        presentationPicker.delegate = self
    }
    //MARK: pickerViewDelegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == transitionPicker) {
            return pickerTransitionArray.count //UIModalTransitionStyle
        } else {
            return pickerPresentationArray.count //UIModalPresentationStyle
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if (pickerView == transitionPicker) {
            return(pickerTransitionArray[row])
        } else {
            return(pickerPresentationArray[row])
        }
    }
    //MARK: present
    
    @IBAction func clickPresent(sender: AnyObject) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        popupViewController = (sb.instantiateViewControllerWithIdentifier("popper")! as PopViewController)
        popupViewController!.delegate = self
        
        //you'd think there'd be an easier way to hook up an enum to a picker...

        var trans:UIModalTransitionStyle
        switch transitionPicker.selectedRowInComponent(0) {
        case 0:
            trans = .CoverVertical
        case 1:
            trans = .FlipHorizontal
        case 2:
            trans = .CrossDissolve
        case 3:
            trans = .PartialCurl
        default:
            trans = .CoverVertical
        }
        popupViewController!.modalTransitionStyle = trans
        
        
        var pres:UIModalPresentationStyle
        switch presentationPicker.selectedRowInComponent(0) {
        case 0:
            pres = .FullScreen
        case 1:
            pres = .PageSheet
        case 2:
            pres = .FormSheet
        case 3:
            pres = .CurrentContext
        case 4:
            pres = .Custom
        case 5:
            pres = .OverFullScreen
        case 6:
            pres = .OverCurrentContext
        case 7:
            pres = .Popover
        default:
            pres = .FullScreen
        }
        popupViewController!.modalPresentationStyle = pres
        
        if (pres == .FormSheet && trans == .PartialCurl) {
            let alertController = UIAlertController(title: "Ooops!", message: "Sorry, that combination is not available!", preferredStyle:.Alert )
            let callAction = UIAlertAction(title: "OK", style: .Default, handler: {
                action in
                println("hit alert")
            })
            alertController.addAction(callAction)
            presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        popupViewController!.preferredContentSize = CGSize(width:self.view.frame.width * CGFloat(xSlider.value / 100.0), height:self.view.frame.height * CGFloat(ySlider.value / 100.0))
        popupViewController!.popoverPresentationController?.sourceView = self.presentButton.imageView
        popupViewController!.popoverPresentationController?.sourceRect = self.presentButton.bounds
    
        self.presentViewController(popupViewController!, animated: true, completion: {})
    }
    
    func closePop(sender:AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

