//
//  ObjectHandler.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/29/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ObjectHandler {
  func getEventsArrayFromJson(json:JSON) -> [Event] {
    let resultArray = json["events"]
    var dataArray = [Event]()
    
    for (index: String, subJson: JSON) in resultArray {
      var dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      
      let startTimeDateString = subJson["start_time"]
      let endTimeDateString = subJson["end_time"]
      
      
      if let startTime = dateFormatter.dateFromString(startTimeDateString.stringValue) {
        if let endTime = dateFormatter.dateFromString(endTimeDateString.stringValue) {
          let eventObj = Event(name: subJson["name"].stringValue, desc: subJson["description"].stringValue, location: subJson["location"].stringValue, startTime: startTime, endTime: endTime, groupName: subJson["group_name"].stringValue, groupURL: subJson["group_url"].stringValue)
          
          dataArray.append(eventObj)
        }
      }
      
      else {
        let name = subJson["start_time"].stringValue
        println("lalalalal for index \(name)")
      }
    }
    
    return dataArray
  }
  
  func getPodcastsArrayFromJson(json:JSON) -> [Podcast] {
    let resultArray = json["podcasts"]
    var dataArray = [Podcast]()
    
    for (index: String, subJson: JSON) in resultArray {
      var dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
      
      let podcastDateStr = subJson["date"]
      
      if let podcastDate = dateFormatter.dateFromString(podcastDateStr.stringValue) {
        let podcastObj = Podcast(title: subJson["title"].stringValue, desc: subJson["description"].stringValue, downloadLink: subJson["download_link"].stringValue, podcastDate: podcastDate)
        
        dataArray.append(podcastObj)
      }
    }
    
    return dataArray
  }
  
  func getReposArrayFromJson(json:JSON) -> [Repo] {
    let resultArray = json["repos"]
    println(resultArray)
    var dataArray = [Repo]()
    
    for (index: String, subJson: JSON) in resultArray {
      let repoObj = Repo(name: subJson["name"].stringValue, URL: subJson["html_url"].stringValue, language: subJson["language"].stringValue, description: subJson["description"].stringValue)
      
      dataArray.append(repoObj)
    }
    
    return dataArray
  }
}