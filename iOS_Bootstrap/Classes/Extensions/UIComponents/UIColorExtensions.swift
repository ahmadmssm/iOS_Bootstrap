//
//  UIColorExtensions.swift
//  PassApp
//
//  Created by Ahmad Mahmoud on 3/28/18.
//

//  Hex
//  Ref : https://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values
public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(fromHex: Int) {
        self.init(
            red: (fromHex >> 16) & 0xFF,
            green: (fromHex >> 8) & 0xFF,
            blue: fromHex & 0xFF
        )
    }
    
    //
    static func color(fromHexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(colorInteger(fromHexString: fromHexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    private static func colorInteger(fromHexString: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: fromHexString)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    var redValue: CGFloat{
        return cgColor.components! [0]
    }
    
    var greenValue: CGFloat{
        return cgColor.components! [1]
    }
    
    var blueValue: CGFloat{
        return cgColor.components! [2]
    }
    
    var alphaValue: CGFloat{
        return cgColor.components! [3]
    }
    
    // credits to @andreaantonioni for this addition
    var isWhiteText: Bool {
        let red = self.redValue * 255
        let green = self.greenValue * 255
        let blue = self.blueValue * 255
        
        // https://en.wikipedia.org/wiki/YIQ
        // https://24ways.org/2010/calculating-color-contrast/
        let yiq = ((red * 299) + (green * 587) + (blue * 114)) / 1000
        return yiq < 192
    }
}

/* This is how to use
 
 let color = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
 let color2 = UIColor(fromHex: 0xFFFFFF)
 
 OR
 
 let color = UIColor.color(fromHexString: "#ffffff")
 
 // To get alpha : You can simply use the native UIColor.withAlphaComponent method.
 
 let semitransparentBlack = UIColor(rgb: 0x000000).withAlphaComponent(0.5)
 
*/
