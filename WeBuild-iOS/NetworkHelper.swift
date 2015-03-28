//
//  NetworkHelper.swift
//  WeBuild-iOS
//
//  Created by Behera, Subhransu on 3/13/15.
//  Copyright (c) 2015 WeBuild.SG. All rights reserved.
//

import Foundation
import Alamofire

let eventURL = "https://webuild.sg/api/v1/events"
let podcastURL = "https://webuild.sg/api/v1/podcasts"
let repoURL = "https://webuild.sg/api/v1/repos"

enum APIType {
  case Event
  case Podcast
  case Repo
}

struct NetworkHelper {
  let util = Utils()
  
  func getAllEvents() -> [AnyObject] {
    var eventsArray = []
    
    Alamofire.request(.GET, eventURL)
      .responseJSON { (request, response, json, error) in
        if error != nil {
          println(error)
          return
        }
        
        if self.util.checkIfAPITimeStampHasChanged(APIType.Event, jsonValue: json) {
          println("require stuffs to be reloaded")
        } else {
          println("no need to reload new stuffs")
        }
    }
    
    return eventsArray
  }
  
  func getAllPodcasts() -> [AnyObject] {
    var podcastsArray = []
    
    Alamofire.request(.GET, podcastURL)
      .responseJSON { (request, response, JSON, error) in
        if error != nil {
          println(error)
          return
        }
        
        // JSON Serialization here ...
        println(JSON)
    }
    
    return podcastsArray
  }    
}