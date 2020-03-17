//
//  ViewController2.swift
//  TestActionSheetPicker
//
//  Created by Kavisha on 04/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIColor(red:0.10, green:0.12, blue:0.16, alpha:1.0)
        self.view.backgroundColor = UIColor.systemRed
    }
    
    
    @IBAction func onClick(_ sender: UIButton) {
        
        //let delg = ActionSheetPickerCustomPickerDelegate()
        
        let delg = ActionSheetPickerCustomPickerDelegate2()
        let initialSelections = [1, 1]
        
        let picker = ActionSheetCustomPicker.show(withTitle: "Select data", delegate: delg, showCancelButton: false,
                                                  origin: sender, initialSelections: initialSelections)
        
        guard let monthYearPicker = picker else {
            fatalError("Error obtaining picker!")
        }
        //picker?.pickerViewComponent.reloadAllComponents()
        
        monthYearPicker.setTextColor(UIColor.green)
        //monthYearPicker.show()
        //monthYearPicker.pickerBlurRadius = 30.0
        //monthYearPicker.pickerTextAttributes.addEntries(from: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)])
    }
}

class ActionSheetPickerCustomPickerDelegateOld: NSObject, ActionSheetCustomPickerDelegate {
    
    var notesToDisplayForKey: [String]?
    var scaleNames: [String]?
    
    var selectedKey: String?
    var selectedScale: String?
    
    override init() {
        super.init()
        notesToDisplayForKey = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
        scaleNames = ["Major", "Minor", "Dorian", "Spanish Gypsy"]
    }
    
    // MARK: - ActionSheetCustomPickerDelegate Optional's
    func actionSheetPickerDidSucceed(_ actionSheetPicker: AbstractActionSheetPicker?, origin: Any?) {
        print("actionSheetPickerDidSucceed HIT")
        
        var resultMessage: String?
        if !(selectedKey != nil) && !(selectedScale != nil) {
            resultMessage = "Nothing is selected, inital selections: \(notesToDisplayForKey![Int((actionSheetPicker?.pickerView as? UIPickerView)?.selectedRow(inComponent: 0) ?? 0)]), \(scaleNames![Int((actionSheetPicker?.pickerView as? UIPickerView)?.selectedRow(inComponent: 1) ?? 0)])"
        } else {
            resultMessage = "\(String(describing: selectedKey)) \(String(describing: selectedScale)) selected."
        }
        print(resultMessage as Any)
    }
    
    // MARK: - UIPickerViewDataSource Implementation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Returns
        switch component {
        case 0:
            return notesToDisplayForKey!.count
        case 1:
            return scaleNames!.count
        default:
            break
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0:
            return 60.0
        case 1:
            return 260.0
        default:
            break
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return notesToDisplayForKey![row]
        case 1:
            return scaleNames![row]
        default:
            break
        }
        return nil
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(String(format: "Row %li selected in component %li", row, component))
//        switch component {
//        case 0:
//            selectedKey = notesToDisplayForKey![row]
//            return
//        case 1:
//            selectedScale = scaleNames![row]
//            return
//        default:
//            break
//        }
//    }
    
    
}


class ActionSheetPickerCustomPickerDelegate2: NSObject, ActionSheetCustomPickerDelegate {
    
    var months  = [String]()
    var years   = [String]()
    
    override init() {
        months  = getMonths()
        years   = ["2019", "2020", "All"]
    }
    
    func actionSheetPickerDidSucceed(_ actionSheetPicker: AbstractActionSheetPicker?, origin: Any?) {
        print("actionSheetPickerDidSucceed HIT")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch (component) {
        case 0: return months.count
        case 1: return years.count
            
        default:break;
        }
        return 0;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow CALLED")
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            let val = months[row]
            print("ActionSheetPickerCustomPickerDelegate2 Value at 0\(val)")
            return val
        case 1:
            let val = years[row]
            print("ActionSheetPickerCustomPickerDelegate2 Value at 1\(val)")
            return val
        default:
            break
        }
        return nil
    }
}



