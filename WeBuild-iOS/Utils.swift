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
    var dateFormatter = NSDateFormatter()
    
    switch apiType {
    case APIType.Event:
      keyToCheck = "Event"
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
      
    case APIType.Podcast:
      keyToCheck = "Podcast"
      dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
      
    case APIType.Repo:
      keyToCheck = "Repo"
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
      
    default:
      return true
    }
    
    var json = JSON(jsonValue!)
    var generationDateString = json["meta"]["generated_at"]
    
    if generationDateString {
      if let generationDateValue = dateFormatter.dateFromString(generationDateString.stringValue) {
        let checkIfValueIsChanged = self.checkIfUserDefaultsValueHasChanged(keyToCheck, storedDate: generationDateValue)
        return checkIfValueIsChanged
      }
    }
    
    return true
  }
  
  func checkIfUserDefaultsValueHasChanged(keyToCheck:String, storedDate:NSDate) -> Bool {
    if (NSUserDefaults.standardUserDefaults().objectForKey(keyToCheck) != nil) {
      if (NSUserDefaults.standardUserDefaults().valueForKey(keyToCheck) as! NSDate == storedDate) {
        return false
      }
    }
    
    NSUserDefaults.standardUserDefaults().setObject(storedDate, forKey: keyToCheck)
    return true
  }
  
  func fetchAndStoreData(apiType:APIType, jsonValue:AnyObject?) -> [AnyObject] {
    var dataArray = [AnyObject]()
    var nameOfFilePrefix : String
    var json = JSON(jsonValue!)
    
    switch apiType {
    case APIType.Event:
      nameOfFilePrefix = "events"
      dataArray = ObjectHandler().getEventsArrayFromJson(json)
      
    case APIType.Podcast:
      nameOfFilePrefix = "podcasts"
      dataArray = ObjectHandler().getPodcastsArrayFromJson(json)
      
    case APIType.Repo:
      nameOfFilePrefix = "repos"
      dataArray = ObjectHandler().getReposArrayFromJson(json)
    default:
      return dataArray
    }
    
    var paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0] as! String
    var getFilePath = paths.stringByAppendingPathComponent("\(nameOfFilePrefix).plist") as NSString
    var checkValidation = NSFileManager.defaultManager()
    
    println(getFilePath)

    if (checkValidation.fileExistsAtPath(getFilePath as String)) {
        NSFileManager.defaultManager().removeItemAtPath(getFilePath as String, error: nil)
    }
    
    NSFileManager.defaultManager().createFileAtPath(getFilePath as String,
    contents:NSKeyedArchiver.archivedDataWithRootObject(dataArray), attributes: nil)
    
    return dataArray
  }
  
  func fetchDataFromFileSystem(apiType:APIType, jsonValue:AnyObject?) -> [AnyObject] {
    var dataArray = [AnyObject]()
    var nameOfFilePrefix : String
    
    switch apiType {
    case APIType.Event:
      nameOfFilePrefix = "events"
    case APIType.Podcast:
      nameOfFilePrefix = "podcasts"
    case APIType.Repo:
      nameOfFilePrefix = "repos"
    default:
      return dataArray
    }
    
    var paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0] as! String
    var getFilePath = paths.stringByAppendingPathComponent("\(nameOfFilePrefix).plist")
    var checkValidation = NSFileManager.defaultManager()
    
    println(getFilePath)
    
    if (checkValidation.fileExistsAtPath(getFilePath)) {
       dataArray = NSKeyedUnarchiver.unarchiveObjectWithFile(getFilePath) as! Array
       println(dataArray)
    } else {
      dataArray = self.fetchAndStoreData(apiType, jsonValue: jsonValue)
    }
    
    return dataArray
  }
}
