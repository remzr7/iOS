//
//  Podcast.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/13/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import Foundation

class Podcast : NSObject, NSCoding {
  let podcastTitle, podcastDescription, downloadLink : String
  let podcastDate : NSDate
  
  init(title: String, desc: String, downloadLink: String, podcastDate:NSDate) {
    self.podcastTitle = title
    self.podcastDescription = desc
    self.downloadLink = downloadLink
    self.podcastDate = podcastDate
  }
  
  required init(coder aDecoder: NSCoder) {
    self.podcastTitle = aDecoder.decodeObjectForKey("podcastTitle") as! String
    self.podcastDescription = aDecoder.decodeObjectForKey("podcastDescription") as! String
    self.downloadLink = aDecoder.decodeObjectForKey("downloadLink") as! String
    self.podcastDate = aDecoder.decodeObjectForKey("podcastDate") as! NSDate
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.podcastTitle, forKey: "podcastTitle")
    aCoder.encodeObject(self.podcastDescription, forKey: "podcastDescription")
    aCoder.encodeObject(self.downloadLink, forKey: "downloadLink")
    aCoder.encodeObject(self.podcastDate, forKey: "podcastDate")
  }
}
