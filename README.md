# convertRGB Convert object UIColor integer to hex String or convert hex String to integer


EXAMPLE:

let stringHex = UIColor(red: 155/255, green: 124/255, blue: 120/255, alpha: 1).toHexString() // "#9b7c78"


let (r,g,b,a) = UIColor().hexToIntRGB(hexString: stringHex)! // 155 , 124 ,120 , 1

