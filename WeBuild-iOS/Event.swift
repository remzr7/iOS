//
//  Event.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/13/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import Foundation

class Event : NSObject, NSCoding {
  let eventName, eventDescription, eventLocation, groupName, groupURL : String
  let eventStartTime, eventEndTime : NSDate
  
  init(name: String, desc: String, location: String, startTime: NSDate, endTime: NSDate, groupName: String, groupURL: String) {
    self.eventName = name
    self.eventDescription = desc
    self.eventLocation = location
    self.eventStartTime = startTime
    self.eventEndTime = endTime
    self.groupName = groupName
    self.groupURL = groupURL
  }
  
  required init(coder aDecoder: NSCoder) {
    self.eventName = aDecoder.decodeObjectForKey("eventName") as String
    self.eventDescription = aDecoder.decodeObjectForKey("eventDescription") as String
    self.eventLocation = aDecoder.decodeObjectForKey("eventLocation") as String
    self.eventStartTime = aDecoder.decodeObjectForKey("eventStartTime") as NSDate
    self.eventEndTime = aDecoder.decodeObjectForKey("eventEndTime") as NSDate
    self.groupName = aDecoder.decodeObjectForKey("groupName") as String
    self.groupURL = aDecoder.decodeObjectForKey("groupURL") as String
    
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.eventName, forKey: "eventName")
    aCoder.encodeObject(self.eventDescription, forKey: "eventDescription")
    aCoder.encodeObject(self.eventLocation, forKey: "eventLocation")
    aCoder.encodeObject(self.eventStartTime, forKey: "eventStartTime")
    aCoder.encodeObject(self.eventEndTime, forKey: "eventEndTime")
    aCoder.encodeObject(self.groupName, forKey: "groupName")
    aCoder.encodeObject(self.groupURL, forKey: "groupURL")
  }
}