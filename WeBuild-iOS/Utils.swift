//
//  Utils.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/28/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Utils {
  func checkIfAPITimeStampHasChanged(apiType:APIType, jsonValue:AnyObject?) -> Bool {
    var keyToCheck : String
    
    switch apiType {
    case APIType.Event:
      keyToCheck = "Event"
    case APIType.Podcast:
      keyToCheck = "Podcast"
    case APIType.Repo:
      keyToCheck = "Repo"
    default:
      return true
    }
    
    var json = JSON(jsonValue!)
    var generationDateString = json["meta"]["generated_at"]
    
    if generationDateString {
      var dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
      
      if let generationDateValue = dateFormatter.dateFromString(generationDateString.stringValue) {
        let checkIfValueIsChanged = self.checkIfUserDefaultsValueHasChanged(keyToCheck, storedDate: generationDateValue)
        return checkIfValueIsChanged
      }
    }
    
    return true
  }
  
  func checkIfUserDefaultsValueHasChanged(keyToCheck:String, storedDate:NSDate) -> Bool {
    if (NSUserDefaults.standardUserDefaults().objectForKey(keyToCheck) != nil) {
      if (NSUserDefaults.standardUserDefaults().valueForKey(keyToCheck) as NSDate == storedDate) {
        return false
      }
    }
    
    NSUserDefaults.standardUserDefaults().setObject(storedDate, forKey: keyToCheck)
    return true
  }
}
