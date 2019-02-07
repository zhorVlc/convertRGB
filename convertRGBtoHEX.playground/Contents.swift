import UIKit

extension UIColor {
    
    func toHexString() ->String {
        
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255) << 16 | (Int) (g*255) << 8 | (Int)(b*255)
        
        return NSString(format: "#%06x", rgb) as String
        
    }
    
    func hexToIntRGB(hexString: String) -> (CGFloat,CGFloat,CGFloat,CGFloat)? {
        
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let strHex = String(hexString[start...])
            
            if strHex.count == 6 {
                
                var hexNumber:UInt32 = 0
                let scanner =  Scanner(string: strHex)
                
                if scanner.scanHexInt32(&hexNumber){
                    
                    r = (CGFloat((hexNumber & 0xFF0000) >> 16) / 255) * 255
                    g = (CGFloat((hexNumber & 0x00FF00) >> 8) / 255) * 255
                    b = (CGFloat((hexNumber & 0x0000FF)) / 255) * 255
                    a = CGFloat(1.0)
                        
                    return  (r, g, b, a)
                }
            }
        }
        return nil
    }
}

let stringHex = UIColor(red: 155/255, green: 124/255, blue: 120/255, alpha: 1).toHexString() // "#9b7c78"

let (r,g,b,a) = UIColor().hexToIntRGB(hexString: stringHex)! // 155 , 124 ,120 , 1


