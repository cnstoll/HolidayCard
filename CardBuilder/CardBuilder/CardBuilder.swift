//
//  CardBuilder.swift
//  CardBuilder
//
//  Created by Conrad Stoll on 12/7/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

public func printCard(_ card : Card) -> UIImage {
    
    let pdfData = NSMutableData()
    
    UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 640, height: 960), nil);
    UIGraphicsBeginPDFPage();
    
    let pdfContext = UIGraphicsGetCurrentContext()
    
    let pageView = UIView(frame: CGRect(x: 0, y: 0, width: 640, height: 960))
    card.view.frame.origin.y = 480
    pageView.addSubview(card.view)
    
    pageView.layer.render(in: pdfContext!)
    
    UIGraphicsEndPDFContext();
    
    
    let documentDirectories = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    let documentDirectory = documentDirectories.first
    let documentDirectoryURL = URL(fileURLWithPath: documentDirectory!)

    let documentDirectoryFilename = documentDirectoryURL.appendingPathComponent("HolidayCard.pdf")
    
    
    pdfData.write(toFile: documentDirectoryFilename.path, atomically: true)
    
    
    UIGraphicsBeginImageContext(card.view.bounds.size)
    card.view.layer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image!
}

public func printDocumentsDirectory() -> NSString {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
    
    return documentsPath
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
