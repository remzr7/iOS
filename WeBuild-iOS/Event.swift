//
//  Event.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/13/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import Foundation

class Event {
    let eventName, eventDescription, eventLocation, groupName, groupURL : String
    let eventDate, eventStartTime, eventEndTime : NSDate
  
    init(name: String, desc: String, location: String, date: NSDate, startTime: NSDate, endTime: NSDate, groupName: String, groupURL: String) {
      self.eventName = name
      self.eventDescription = desc
      self.eventLocation = location
      self.eventDate = date
      self.eventStartTime = startTime
      self.eventEndTime = endTime
      self.groupName = groupName
      self.groupURL = groupURL
    }
}