//
//  ViewController2.swift
//  TestActionSheetPicker
//
//  Created by Kavisha on 04/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ViewController2 : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClick(_ sender: UIButton) {
        
        let delg = ActionSheetPickerCustomPickerDelegate2()
        let initialSelections = [1, 1]
        
        let picker = ActionSheetCustomPicker.show(withTitle: "Select Key & Scale", delegate: delg, showCancelButton: true,
                                                  origin: sender, initialSelections: initialSelections)
        
        guard let monthYearPicker = picker else {
            fatalError("Error obtaining month & year picker!")
        }
        
        monthYearPicker.pickerBackgroundColor = UIColor.green
        monthYearPicker.setTextColor(UIColor.black)
        monthYearPicker.pickerBlurRadius = 30.0
        
    }
    
    
}


class ActionSheetPickerCustomPickerDelegate3: NSObject, ActionSheetCustomPickerDelegate {
    
    //    var notesToDisplayForKey  = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
    //    var scaleNames = ["Major", "Minor", "Dorian", "Spanish Gypsy"]
    
    var notesToDisplayForKey  = ["C", "Db", "D", "Eb"]
    var scaleNames = ["Major", "Minor", "Dorian", "Spanish Gypsy"]
    
    /*func actionSheetPicker(_ actionSheetPicker: AbstractActionSheetPicker!, configurePickerView pickerView: UIPickerView!) {
     print("configurePickerView")
     pickerView.delegate = self
     //pickerView.dataSource = self
     }*/
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow")
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch (component) {
        case 0: return notesToDisplayForKey.count
        case 1: return scaleNames.count
        default:break;
        }
        return 0;
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0:
            return 60.0
        case 1:
            return 100.0
        default:
            break
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            let val = notesToDisplayForKey[row]
            print("Value at 0\(val)")
            return val
        case 1:
            let val = scaleNames[row]
            print("Value at 1\(val)")
            return scaleNames[row]
        default:
            break
        }
        return nil
    }
    
    /*func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
     var pickerLabel = view as? UILabel
     if pickerLabel == nil {
     pickerLabel = UILabel()
     }
     /*let obj = (data)[component][row]
     
     
     // use the object if it is already a NSString,
     // otherwise, use the description, just like the toString() method in Java
     // else, use String with no text to ensure this delegate do not return a nil value.
     
     if (obj is String) {
     attributeTitle = NSAttributedString(string: obj as? String ?? "", attributes: pickerTextAttributes)
     }
     
     if obj.responds(to: #selector(description)) {
     attributeTitle = NSAttributedString(string: obj.perform(#selector(description)), attributes: pickerTextAttributes)
     }
     
     if attributeTitle == nil {
     attributeTitle = NSAttributedString(string: "", attributes: pickerTextAttributes)
     }*/
     var attributeTitle: NSAttributedString = NSAttributedString(string: "Okay")
     pickerLabel?.attributedText = attributeTitle
     return pickerLabel!
     
     }*/
    
    
}
