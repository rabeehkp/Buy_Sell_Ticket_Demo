//
//  extensions.swift
//  dr lite
//
//  Created by Anas Zaheer on 13/05/17.
//  Copyright © 2017 nfnlabs. All rights reserved.
//

import Foundation
import UIKit

//MARK: -UIViewController
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: -Bool
extension Bool{
    func toString() -> String{
        if self{
            return "1"
        }
        else{
            return "0"
        }
    }
}

//MARK: -Date
extension Date{
    func isBetweeen(date date1: Date, andDate date2: Date) -> Bool{
        return date1.compare(self) == self.compare(date2)
    }
}

//MARK: -Int
extension Int
{
    var radian : CGFloat
    {
        return CGFloat(self) / 180.0 * CGFloat(Double.pi)
    }
}

//MARK: -UIColor
extension UIColor
{
    class func uicolorFromHex(_ rgbValue:UInt32, alpha : CGFloat)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0xFF) / 255.0
        return UIColor(red:red, green:green, blue:blue, alpha: alpha)
    }
}

//MARK: - UITableView
extension UITableView{
    func dequeue<T>(_ identifier :String, _ OfClass :T.Type) -> T{
        var cell = self.dequeueReusableCell(withIdentifier: identifier) as? T
        if cell == nil{
            self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = self.dequeueReusableCell(withIdentifier: identifier) as? T
        }
        return cell!
    }
}

//MARK: -CollectionView
extension UICollectionView{
    func dequeue<T>(_ identifier :String, _ indexPath:IndexPath, _ OfClass :T.Type) -> T{
        var cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
        if cell == nil{
            self.register(UINib(nibName: identifier, bundle:nil), forCellWithReuseIdentifier: identifier)
            cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
        }
        return cell!
    }
    
    func dequeueXib<T>(_ identifier :String, _ indexPath:IndexPath, _ OfClass :T.Type) -> T{
        self.register(UINib(nibName: identifier, bundle:nil), forCellWithReuseIdentifier: identifier)
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
        return cell!
    }
}

//MARK: -UITextField
class UITextfieldExtension: UITextField{
    var cellIndex: Int? = nil
}

//MARK: -UILabel
extension UILabel {
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}

//MARK: -String
extension String {
    func dynamic_StringHeight(text:String, width:CGFloat, fontSize:CGFloat) -> CGFloat{
        let dynamicHt = text.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: fontSize)], context: nil)
        return dynamicHt.height
    }
    
    func dynamic_StringHeightWithFont(font:UIFont, text:String, width:CGFloat, fontSize:CGFloat) -> CGFloat{
        let dynamicHt = text.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:font], context: nil)
        return dynamicHt.height
    }
    
    // Returns true if the string has at least one character in common with matchCharacters.
    func containsCharactersIn(_ matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) != nil
    }
    
    
    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(_ matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    
    // Returns true if the string has no characters in common with matchCharacters.
    func doesNotContainCharactersIn(_ matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) == nil
    }
    
    // Returns true if the string represents a proper numeric value.
    // This method uses the device's current locale setting to determine
    // which decimal separator it will accept.
    func isNumeric() -> Bool
    {
        let scanner = Scanner(string: self)
        
        // A newly-created scanner has no locale by default.
        // We'll set our scanner's locale to the user's locale
        // so that it recognizes the decimal separator that
        // the user expects (for example, in North America,
        // "." is the decimal separator, while in many parts
        // of Europe, "," is used).
        scanner.locale = Locale.current
        
        return scanner.scanDecimal(nil) && scanner.isAtEnd
    }
    
    //Replace String
    func replaceString(_ string:String,occurrencesOfString:String, replaceString:String) -> String
    {
        return string.replacingOccurrences(of: occurrencesOfString, with: replaceString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    //Trim the white spaces
    func trimWhiteSpace() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func index(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes(of string: String, options: CompareOptions = .literal) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.upperBound
        }
        return result
    }
    func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.upperBound
        }
        return result
    }
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text:String, font:UIFont) -> NSMutableAttributedString {
        let attrs = [NSAttributedStringKey.font:font]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes: attrs)
        self.append(boldString)
        return self
    }
    
    @discardableResult func normal(_ text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.append(normal)
        return self
    }
    
    enum scripting : Int
    {
        case aSub = -1
        case aSuper = 1
    }
    
    func characterSubscriptAndSuperscript(string:String,
                                          characters:[Character],
                                          type:scripting,
                                          fontSize:CGFloat,
                                          scriptFontSize:CGFloat,
                                          offSet:Int,
                                          length:[Int],
                                          alignment:NSTextAlignment)-> NSMutableAttributedString
    {
        let paraghraphStyle = NSMutableParagraphStyle()
        // Set The Paragraph aligmnet , you can ignore this part and delet off the function
        paraghraphStyle.alignment = alignment
        
        var scriptedCharaterLocation = Int()
        //Define the fonts you want to use and sizes
        
        
        let stringFont = UIFont(name: "Times New Roman", size: fontSize)//UIFont.boldSystemFont(ofSize: fontSize)
        let scriptFont = UIFont(name: "Times New Roman", size: scriptFontSize)//UIFont.boldSystemFont(ofSize: scriptFontSize)
        // Define Attributes of the text body , this part can be removed of the function
        let attString = NSMutableAttributedString(string:string, attributes: [NSAttributedStringKey.font:stringFont!,NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.paragraphStyle: paraghraphStyle])
        
        // the enum is used here declaring the required offset
        let baseLineOffset = offSet * type.rawValue
        // enumerated the main text characters using a for loop
        for (i,c) in string.characters.enumerated()
        {
            // enumerated the array of first characters to subscript
            for (theLength,aCharacter) in characters.enumerated()
            {
                if c == aCharacter
                {
                    // Get to location of the first character
                    scriptedCharaterLocation = i
                    //Now set attributes starting from the character above
                    attString.setAttributes([NSAttributedStringKey.font:scriptFont!,
                                             // baseline off set from . the enum i.e. +/- 1
                        NSAttributedStringKey.baselineOffset:baseLineOffset,
                        NSAttributedStringKey.foregroundColor:UIColor.black],
                                            // the range from above location
                        range:NSRange(location:scriptedCharaterLocation,
                                      // you define the length in the length array
                            // if subscripting at different location
                            // you need to define the length for each one
                            length:length[theLength]))
                    
                }
            }
        }
        return attString
    }
}


extension UIImage {
    func resizeToSize(_ size: CGSize) -> UIImage?
    {
        
        // Begins an image context with the specified size
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        // Draws the input image (self) in the specified size
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        // Gets an UIImage from the image context
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        // Ends the image context
        UIGraphicsEndImageContext()
        
        // Returns the final image, or NULL on error
        return result
    }
    
    // Crops an input image (self) to a specified rect
    func cropImage(_ rect : CGRect) -> UIImage?
    {
        var rectTransform: CGAffineTransform!
        
        switch (self.imageOrientation) {
            
        case UIImageOrientation.left :
            
            rectTransform = CGAffineTransform(rotationAngle: 90.radian).translatedBy(x: 0, y: -self.size.height)
            break;
        case UIImageOrientation.up :
            
            //      rectTransform = CGAffineTransform(rotationAngle: -90.radian).translatedBy(x: -self.size.width, y: 0)
            rectTransform = CGAffineTransform(rotationAngle: -180.radian).translatedBy(x: -self.size.width, y: -self.size.height)
            break;
        case UIImageOrientation.down:
            rectTransform = CGAffineTransform(rotationAngle: -180.radian).translatedBy(x: -self.size.width, y: -self.size.height)
            
            //    case UIImageOrientation.left :
            //
            //      rectTransform = CGAffineTransform(rotationAngle: 90.radian).translatedBy(x: 0, y: -self.size.height)
            //      break;
            //    case UIImageOrientation.right :
            //
            //      rectTransform = CGAffineTransform(rotationAngle: -90.radian).translatedBy(x: -self.size.width, y: 0)
            //      break;
            //    case UIImageOrientation.down:
            //      rectTransform = CGAffineTransform(rotationAngle: -180.radian).translatedBy(x: -self.size.width, y: -self.size.height)
            
        default:
            
            rectTransform = CGAffineTransform.identity
        }
        
        rectTransform = rectTransform.scaledBy(x: self.scale, y: self.scale);
        
        if let imageRef = self.cgImage!.cropping(to: rect.applying(rectTransform)) {
            
            let image = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
            return image
        }
        else {
            return nil
        }
    }
}

extension Array where Element : Collection,
Element.Iterator.Element : Equatable, Element.Index == Int {
    
    func indices(of x: Element.Iterator.Element) -> (Int, Int)? {
        for (i, row) in self.enumerated() {
            if let j = row.index(of: x) {
                return (i, j)
            }
        }
        return nil
    }
}
