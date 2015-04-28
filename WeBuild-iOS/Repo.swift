//
//  Repo.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/29/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import Foundation

class Repo : NSObject, NSCoding {
  let repoName, repoURL, repoLang, repoDesc : String
  
  init(name:String, URL:String, language:String, description:String) {
    self.repoName = name
    self.repoURL = URL
    self.repoLang = language
    self.repoDesc = description
  }
  
  required init(coder aDecoder: NSCoder) {
    self.repoName = aDecoder.decodeObjectForKey("repoName") as String
    self.repoURL = aDecoder.decodeObjectForKey("repoURL") as String
    self.repoLang = aDecoder.decodeObjectForKey("repoLang") as String
    self.repoDesc = aDecoder.decodeObjectForKey("repoDesc") as String    
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.repoName, forKey: "repoName")
    aCoder.encodeObject(self.repoURL, forKey: "repoURL")
    aCoder.encodeObject(self.repoLang, forKey: "repoLang")
    aCoder.encodeObject(self.repoDesc, forKey: "repoDesc")
  }
}