//
//  ViewController.swift
//  TestActionSheetPicker
//
//  Created by Kavisha on 04/03/20.
//  Copyright © 2020 Kavisha. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.10, green:0.12, blue:0.16, alpha:1.0)
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        
        let delg = ActionSheetPickerCustomPickerDelegate()
        let initialSelections = [1, 1]
        
        let picker = ActionSheetCustomPicker.show(withTitle: "Select Month & Year", delegate: delg, showCancelButton: true,
                                                  origin: sender, initialSelections: initialSelections)
        
        guard let monthYearPicker = picker else {
            fatalError("Error obtaining picker!")
        }
        
        monthYearPicker.pickerBlurRadius = 30.0
        monthYearPicker.pickerTextAttributes.addEntries(from: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)])
    }
}

class ActionSheetPickerCustomPickerDelegate: NSObject, ActionSheetCustomPickerDelegate {
    
    var customMonth = "Custom"
    var customYearData = "All Notes"
    
    var months  = [String]()
    var years   = [String]()
    
    var selectedMonth = ""
    var selectedYear = ""
    
    override init() {
        var monthList = getMonths()
        monthList.append(customMonth)
        
        months  = monthList
        years   = ["2019", "2020", customYearData]
    }
    
    func actionSheetPickerDidSucceed(_ actionSheetPicker: AbstractActionSheetPicker?, origin: Any?) {
        print("actionSheetPickerDidSucceed HIT")
        print("Chosen month \(selectedMonth), and year \(selectedYear)")
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
        
        print(String(format: "Row %li selected in component %li", row, component))
        switch component {
        case 0:
            selectedMonth = months[row]
            if selectedMonth == customMonth {
                pickerView.selectRow(2, inComponent: 1, animated: true)
                
            }else {
                let component2SelectedRow = pickerView.selectedRow(inComponent: 1)
                if component2SelectedRow == 2 {
                    pickerView.selectRow(1, inComponent: 1, animated: true)
                }
            }
            return
            
        case 1:
            selectedYear = years[row]
            if selectedYear == customYearData {
                pickerView.selectRow(12, inComponent: 0, animated: true)
            }
            else {
                let component1SelectedRow = pickerView.selectedRow(inComponent: 0)
                if component1SelectedRow == 12 {
                    pickerView.selectRow(11, inComponent: 0, animated: true)
                }
            }
            return
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0:
            return 200.0
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

func getMonths() -> [String] {
    
    var months: [String] = []
    var monthIndex = 0
    
    for _ in 1...12 {
        let monthValue = DateFormatter().monthSymbols[monthIndex].capitalized
        months.append(monthValue)
        
        monthIndex += 1
    }
    return months
}




