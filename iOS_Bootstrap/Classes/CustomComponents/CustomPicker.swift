//
//  CustomPicker.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/12/18.
//


public struct PickerData {
    
    init(index : Int, data : Any) {
        self.selectedItem = data
        self.index = index
    }
    
    public var index : Int?
    public var selectedItem : Any?
}

open class CustomPicker {
    
    public init () {}
    
    public func showMutiDataSelectionPicker(sender : UIView, title : String, dataSource : [[String]], initislSelection : [Int], okButton : UIButton?, cancelButton : UIButton?, completion: @escaping ([Int],[String]) -> ()) {
        let picker = ActionSheetMultipleStringPicker.init(title: title, rows: dataSource, initialSelection: initislSelection,  doneBlock: { picker, indexes, values in
            completion([1,2,3], values as! [String])
            return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        if (okButton != nil) {
            okButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let oKButtonItem : UIBarButtonItem = UIBarButtonItem(customView: okButton!)
            picker?.setDoneButton(oKButtonItem)
        }
        if (cancelButton != nil) {
            cancelButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let cancelButtonItem : UIBarButtonItem = UIBarButtonItem(customView: cancelButton!)
            picker?.setCancelButton(cancelButtonItem)
        }
        picker?.show()
    }
    
    public func showLocalePicker(sender : UIView, title : String, initislSelection : Int, currentLocaleButtonTitle : String?, okButton : UIButton?, cancelButton : UIButton?, completion: @escaping (TimeZone) -> ()) {
        let picker = ActionSheetLocalePicker.init(title: title, initialSelection: NSTimeZone.local, doneBlock: { _,timeZone in
            completion(timeZone!)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        if (currentLocaleButtonTitle != nil) {
            picker?.addCustomButton(withTitle: currentLocaleButtonTitle, value: Date())
        }
        else {
            picker?.addCustomButton(withTitle: "Current locale", value: NSTimeZone.local)
        }
        if (okButton != nil) {
            okButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let oKButtonItem : UIBarButtonItem = UIBarButtonItem(customView: okButton!)
            picker?.setDoneButton(oKButtonItem)
        }
        if (cancelButton != nil) {
            cancelButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let cancelButtonItem : UIBarButtonItem = UIBarButtonItem(customView: cancelButton!)
            picker?.setCancelButton(cancelButtonItem)
        }
        picker?.show()
    }
    
    public func showDataSelectionPicker(sender : UIView, title : String, dataSource : [String], initislSelection : Int, okButton : UIButton?, cancelButton : UIButton?, completion: @escaping (PickerData) -> ()) {
        let picker = ActionSheetStringPicker.init(title: title, rows: dataSource, initialSelection: initislSelection, doneBlock: {
            _, index, value in
            completion(PickerData(index: index, data: value as! String))
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        if (okButton != nil) {
            okButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let oKButtonItem : UIBarButtonItem = UIBarButtonItem(customView: okButton!)
            picker?.setDoneButton(oKButtonItem)
        }
        if (cancelButton != nil) {
            cancelButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let cancelButtonItem : UIBarButtonItem = UIBarButtonItem(customView: cancelButton!)
            picker?.setCancelButton(cancelButtonItem)
        }
        picker?.show()
    }
    
    public func showTimePicker(sender : UIView, title : String, currentLocaleButtonTitle : String?, okButton : UIButton?, cancelButton : UIButton?, completion: @escaping (Date) -> ()) {
        let datePicker = ActionSheetDatePicker(title: title, datePickerMode: UIDatePickerMode.time, selectedDate: Date(), doneBlock: {
            _, value, _ in
            completion(value as! Date)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        if (currentLocaleButtonTitle != nil) {
            datePicker?.addCustomButton(withTitle: currentLocaleButtonTitle, value: Date())
        }
        else {
            datePicker?.addCustomButton(withTitle: "Current time", value: Date())
        }
        if (okButton != nil) {
            okButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let oKButtonItem : UIBarButtonItem = UIBarButtonItem(customView: okButton!)
            datePicker?.setDoneButton(oKButtonItem)
        }
        if (cancelButton != nil) {
            cancelButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let cancelButtonItem : UIBarButtonItem = UIBarButtonItem(customView: cancelButton!)
            datePicker?.setCancelButton(cancelButtonItem)
        }
        datePicker?.show()
    }
    
    public func showDateTimePicker(sender : UIView, title : String, minimumDate : Date?, maximumDate : Date?, currentLocaleButtonTitle : String?, okButton : UIButton?, cancelButton : UIButton?, completion: @escaping (Date) -> ()) {
        let datePicker = ActionSheetDatePicker(title: title, datePickerMode: UIDatePickerMode.dateAndTime, selectedDate: Date(), doneBlock: {
            _, value, _ in
            completion(value as! Date)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        datePicker?.minimumDate = minimumDate
        datePicker?.maximumDate = maximumDate
        datePicker?.minuteInterval = 20
        if (currentLocaleButtonTitle != nil) {
            datePicker?.addCustomButton(withTitle: currentLocaleButtonTitle, value: Date())
        }
        else {
            datePicker?.addCustomButton(withTitle: "Current date & time", value: Date())
        }
        if (okButton != nil) {
            okButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let oKButtonItem : UIBarButtonItem = UIBarButtonItem(customView: okButton!)
            datePicker?.setDoneButton(oKButtonItem)
        }
        if (cancelButton != nil) {
            cancelButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let cancelButtonItem : UIBarButtonItem = UIBarButtonItem(customView: cancelButton!)
            datePicker?.setCancelButton(cancelButtonItem)
        }
        datePicker?.show()
    }
    
    public func showDatePicker(sender : UIView, title : String, minimumDate : Date?, maximumDate : Date?, currentLocaleButtonTitle : String?, okButton : UIButton?, cancelButton : UIButton?,completion: @escaping (Date) -> ()) {
        let datePicker = ActionSheetDatePicker(title: title, datePickerMode: UIDatePickerMode.date, selectedDate: Date(), doneBlock: {
            _, value, _ in
            completion(value as! Date)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        datePicker?.minimumDate = minimumDate
        datePicker?.maximumDate = maximumDate
        datePicker?.minuteInterval = 20
        if (currentLocaleButtonTitle != nil) {
            datePicker?.addCustomButton(withTitle: currentLocaleButtonTitle, value: Date())
        }
        else {
            datePicker?.addCustomButton(withTitle: "Current date", value: Date())
        }
        if (okButton != nil) {
            okButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let oKButtonItem : UIBarButtonItem = UIBarButtonItem(customView: okButton!)
            datePicker?.setDoneButton(oKButtonItem)
        }
        if (cancelButton != nil) {
            cancelButton?.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            let cancelButtonItem : UIBarButtonItem = UIBarButtonItem(customView: cancelButton!)
            datePicker?.setCancelButton(cancelButtonItem)
        }
        datePicker?.show()
    }
}
