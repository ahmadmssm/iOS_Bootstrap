//
//  RegEx.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/14/18.
//

public enum RegEx: String {
    // Email pattern
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    // Password length 8 - 15
    case password = "^.{8,15}$"
    // e.g: hello every one
    case alphabeticStringWithSpace = "^[a-zA-Z ]*$"
    // HelloWorld
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$"
}
