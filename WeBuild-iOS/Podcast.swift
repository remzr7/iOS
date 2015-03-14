//
//  Podcast.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/13/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import Foundation

class Podcast {
    let podcastTitle, podcastDescription, downloadLink : String
    let podcastDate : NSDate
  
    init(title: String, desc: String, downloadLink: String, podcastDate:NSDate) {
      self.podcastTitle = title
      self.podcastDescription = desc
      self.downloadLink = downloadLink
      self.podcastDate = podcastDate
    }
}
