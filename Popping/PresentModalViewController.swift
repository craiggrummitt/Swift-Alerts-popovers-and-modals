//
//  PresentModalViewController.swift
//  Popping
//
//  Created by Craig Grummitt on 22/10/2015.
//  Copyright © 2015 CraigGrummitt. All rights reserved.
//

import UIKit

class PresentModalViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate, PopViewControllerDelegate {

    @IBOutlet weak var transitionPicker: UIPickerView!
    @IBOutlet weak var presentationPicker: UIPickerView!
    
    let pickerTransitionArray = ["CoverVertical","FlipHorizontal","CrossDissolve","PartialCurl"]
    let pickerPresentationArray = ["FullScreen","PageSheet","FormSheet","CurrentContext","Custom","OverFullScreen","OverCurrentContext","Popover"]
    @IBOutlet weak var presentButton: UIButton!
    @IBOutlet weak var xSlider: UISlider!
    @IBOutlet weak var ySlider: UISlider!
    
    var popupViewController:PopViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionPicker.dataSource = self
        transitionPicker.delegate = self
        presentationPicker.dataSource = self
        presentationPicker.delegate = self
    }
    //MARK: pickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == transitionPicker) {
            return pickerTransitionArray.count //UIModalTransitionStyle
        } else {
            return pickerPresentationArray.count //UIModalPresentationStyle
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == transitionPicker) {
            return(pickerTransitionArray[row])
        } else {
            return(pickerPresentationArray[row])
        }
    }
    
    //MARK: present
    
    @IBAction func clickPresent(sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        popupViewController = (sb.instantiateViewController(withIdentifier: "popper") as! PopViewController)
        popupViewController!.delegate = self
        
        guard let trans = UIModalTransitionStyle(rawValue: transitionPicker.selectedRow(inComponent: 0))
            else {return}
        popupViewController!.modalTransitionStyle = trans
        
        guard let pres:UIModalPresentationStyle = UIModalPresentationStyle(rawValue: presentationPicker.selectedRow(inComponent: 0))
            else {return}
        popupViewController!.modalPresentationStyle = pres
        
        if (pres == .formSheet && trans == .partialCurl) {
            let alertController = UIAlertController(title: "Ooops!", message: "Sorry, that combination is not available!", preferredStyle:.alert )
            let callAction = UIAlertAction(title: "OK", style: .default, handler: {
                action in
                print("hit alert")
            })
            alertController.addAction(callAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        popupViewController!.preferredContentSize = CGSize(width:self.view.frame.width * CGFloat(xSlider.value / 100.0), height:self.view.frame.height * CGFloat(ySlider.value / 100.0))
        popupViewController!.popoverPresentationController?.sourceView = self.presentButton.imageView
        popupViewController!.popoverPresentationController?.sourceRect = self.presentButton.bounds
        
        self.present(popupViewController!, animated: true, completion: {})
    }
    
    func closePop(sender:AnyObject) {
        self.dismiss(animated: true, completion: {})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }}
