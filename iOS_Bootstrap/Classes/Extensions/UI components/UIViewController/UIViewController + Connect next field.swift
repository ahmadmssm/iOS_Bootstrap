//
//  UIViewController + Connect next field.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/20/19.
//

public extension UIViewController {
    func connectFields(fields:[UITextField]) -> Void {
        guard let last = fields.last else { return }
        for i in 0 ..< fields.count - 1 {
            if fields[i].keyboardType == .decimalPad || fields[i].keyboardType == .numberPad || fields[i].keyboardType == .phonePad {
                fields[i].returnKeyType = .next
                fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: UIControl.Event.editingDidEnd)
            }
            else {
                fields[i].returnKeyType = .next
                fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
            }
        }
        if last.keyboardType == .decimalPad || last.keyboardType == .numberPad || last.keyboardType == .phonePad {
            last.returnKeyType = .go
        }
        else {
            last.returnKeyType = .done
            last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
        }
    }
}
