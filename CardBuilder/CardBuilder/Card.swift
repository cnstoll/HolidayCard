//
//  Card.swift
//  CardBuilder
//
//  Created by Conrad Stoll on 12/7/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

import Foundation
import UIKit

private var imageCacheDictionary = [ClipArt : UIImage]()


open class Card {
    
    let view : UIView
    
    open func debugQuickLookObject() -> AnyObject? {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    open var backgroundColor : Color = Color.lightGreen {
        didSet {
            addBackgroundColor(self.backgroundColor)
        }
    }
    
    open var greetingText : String = "" {
        didSet {
            addGreetingText(self.greetingText)
        }
    }
    
    open var messageText : String = "" {
        didSet {
            addMessageText(self.messageText)
        }
    }
    
    open var messageFont : Font = Font.markerFelt {
        didSet {
            changeMessageFont(self.messageFont)
        }
    }
    
    open var greetingFont : Font = Font.markerFelt {
        didSet {
            changeGreetingFont(self.greetingFont)
        }
    }
    
    
    public init() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 640, height: 480))
        
        Card.loadCustomFonts()
        
        greetingLabel = UILabel(frame: CGRect(x: 0, y: 60, width: 640, height: 140))
        greetingLabel.backgroundColor = UIColor.clear
        greetingLabel.font = UIFont(name: "MarkerFelt-Thin", size: 64)
        greetingLabel.textAlignment = NSTextAlignment.center
        greetingLabel.numberOfLines = 0
        greetingLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        greetingLabel.clipsToBounds = false
        view.addSubview(greetingLabel)
        
        messageLabel = UILabel(frame: CGRect(x: 0, y: 400, width: 640, height: 80))
        messageLabel.backgroundColor = UIColor.clear
        messageLabel.font = UIFont(name: "MarkerFelt-Thin", size: 36)
        messageLabel.textAlignment = NSTextAlignment.center
        view.addSubview(messageLabel)
        
        clipArtDictionary = [ClipArt : UIImageView]()
    }
    
    open func addBackgroundColor(_ color : Color) {
        view.backgroundColor = Card.colorForColor(color)
    }
    
    open func addGreetingText(_ text : String) {
        greetingLabel.text = text
    }
    
    open func addMessageText(_ text : String) {
        messageLabel.text = text
    }
    
    open func addClipArtImage(_ image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let _ = existingView {
            
        } else {
            let newView = UIImageView(frame: frameForClipArt(image))
            newView.contentMode = UIViewContentMode.scaleAspectFit
            newView.image = imageForClipArt(image)
            view.addSubview(newView)
            clipArtDictionary[image] = newView
        }
    }
    
    open func moveClipArtImageUp(_ image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let theExistingView = existingView {
            let Y = theExistingView.frame.origin.y
            var newY = Y - 40
            
            if (newY < 0) {
                newY = 0
            }
            
            existingView?.frame.origin.y = newY
        }
    }
    
    open func moveClipArtImageDown(_ image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let theExistingView = existingView {
            let Y = theExistingView.frame.origin.y
            var newY = Y + 40
            
            if (newY < 0) {
                newY = 0
            }
            
            existingView?.frame.origin.y = newY
        }
    }
    
    open func moveClipArtImageLeft(_ image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let theExistingView = existingView {
            let X = theExistingView.frame.origin.x
            var newX = X - 40
            
            if (newX < 0) {
                newX = 0
            }
            
            existingView?.frame.origin.x = newX
        }
    }
    
    open func moveClipArtImageRight(_ image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let theExistingView = existingView {
            let X = theExistingView.frame.origin.x
            var newX = X + 40
            
            if (newX < 0) {
                newX = 0
            }
            
            existingView?.frame.origin.x = newX
        }
    }
    
    open func changeGreetingFont(_ font : Font) {
        greetingLabel.font = greetingFontForFont(font)
    }
    
    open func changeMessageFont(_ font : Font) {
        messageLabel.font = messageFontForFont(font)
    }
    
    
    
    
    
    fileprivate let greetingLabel : UILabel
    fileprivate let messageLabel : UILabel
    fileprivate var clipArtDictionary : [ClipArt : UIImageView]
    
    

    
    class func colorForColor(_ color : Color) -> UIColor {
        switch(color) {
        case .lightBlue:
            return UIColor(netHex:0xBDDEF5)
        case .lightGreen:
            return UIColor(netHex:0xABE29D)
        case .lightOrange:
            return UIColor(netHex:0xF4CF99)
        case .lightRed:
            return UIColor(netHex:0xFFA194)
        case .lightYellow:
            return UIColor(netHex: 0xF0F4A9)
        case .hollyGreen:
            return UIColor(netHex: 0x72b48f)
        case .snowWhite:
            return UIColor(netHex: 0xf4f1e4)
        case .blueSky:
            return UIColor(netHex: 0x80c6d7)
        }
    }
    
    fileprivate func imageForClipArt(_ clipArt : ClipArt) -> UIImage {
        if let image = imageCacheDictionary[clipArt] {
            return image
        }
        
        var imageName = "snowman"
        
        switch(clipArt) {
        case .dradle:
            imageName = "dradle"
        case .garland:
            imageName = "garland"
        case .holly:
            imageName = "holly"
        case .menorah:
            imageName = "menorah"
        case .present:
            imageName = "present"
        case .snowflake1:
            imageName = "snowflake1-a"
        case .snowflake2:
            imageName = "snowflake2-a"
        case .snowman:
            imageName = "snowman"
        case .star:
            imageName = "star"
        case .tree:
            imageName = "tree"
        }
        
        let bundle = Bundle.main
        let path = bundle.path(forResource: imageName, ofType: "png")
        let image = UIImage(contentsOfFile: path!)
        
        if let cacheImage = image {
            imageCacheDictionary[clipArt] = cacheImage
        }
        
        return image!
    }
    
    fileprivate func frameForClipArt(_ clipArt : ClipArt) -> CGRect {
        switch(clipArt) {
        case .dradle:
            return CGRect(x: 440, y: 320, width: 60, height: 90)
        case .garland:
            return CGRect(x: 0, y: -20, width: 640, height: 256)
        case .holly:
            return CGRect(x: 300, y: 340, width: 80, height: 60)
        case .menorah:
            return CGRect(x: 180, y: 240, width: 80, height: 80)
        case .present:
            return CGRect(x: 280, y: 180, width: 70, height: 80)
        case .snowflake1:
            return CGRect(x: 380, y: 240, width: 80, height: 80)
        case .snowflake2:
            return CGRect(x: 120, y: 160, width: 80, height: 80)
        case .snowman:
            return CGRect(x: 540, y: 360, width: 90, height: 120)
        case .star:
            return CGRect(x: 440, y: 120, width: 80, height: 80)
        case .tree:
            return CGRect(x: 60, y: 250, width: 120, height: 220)
        }
    }
    
    fileprivate func greetingFontForFont(_ font : Font) -> UIFont {
        switch(font) {
        case .abrilFatFace:
            return UIFont(name: "Abril FatFace", size: 52)!
        case .handlee:
            return UIFont(name: "Handlee-Regular", size: 64)!
        case .markerFelt:
            return UIFont(name: "MarkerFelt-Thin", size: 64)!
        case .pacifico:
            return UIFont(name: "Pacifico", size: 48)!
        case .satisfy:
            return UIFont(name: "Satisfy", size: 52)!
        case .savoye:
            return UIFont(name: "SavoyeLetPlain", size: 96)!
        case .zapfino:
            return UIFont(name: "Zapfino", size: 40)!
        }
    }
    
    fileprivate func messageFontForFont(_ font : Font) -> UIFont {
        switch(font) {
        case .abrilFatFace:
            return UIFont(name: "Abril FatFace", size: 24)!
        case .handlee:
            return UIFont(name: "Handlee-Regular", size: 32)!
        case .markerFelt:
            return UIFont(name: "MarkerFelt-Thin", size: 32)!
        case .pacifico:
            return UIFont(name: "Pacifico", size: 32)!
        case .satisfy:
            return UIFont(name: "Satisfy", size: 32)!
        case .savoye:
            return UIFont(name: "SavoyeLetPlain", size: 48)!
        case .zapfino:
            return UIFont(name: "Zapfino", size: 28)!
        }
    }
    
    fileprivate class func loadCustomFonts() {
        loadCustomFontWithName("AbrilFatFace")
        loadCustomFontWithName("Handlee")
        loadCustomFontWithName("Pacifico")
        loadCustomFontWithName("Satisfy")
    }
    
    fileprivate class func loadCustomFontWithName(_ name : String) {
        let bundle = Bundle.main

        let path = bundle.path(forResource: name, ofType: "ttf")
        
        if let fontPath = path {
            let data = try? Data(contentsOf: URL(fileURLWithPath: fontPath))
            let providerRef = CGDataProvider(data: data! as CFData)
            let font = CGFont(providerRef!)
            CTFontManagerRegisterGraphicsFont(font, nil)
        }
    }
}



