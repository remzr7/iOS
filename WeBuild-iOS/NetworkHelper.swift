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
          eventsArray = self.util.fetchAndStoreData(APIType.Event, jsonValue: json)
        } else {
          eventsArray = self.util.fetchDataFromFileSystem(APIType.Event, jsonValue: json)
        }
    }
    
    return eventsArray
  }
  
  func getAllPodcasts() -> [AnyObject] {
    var podcastsArray = []
    
    Alamofire.request(.GET, podcastURL)
      .responseJSON { (request, response, json, error) in
        if error != nil {
          println(error)
          return
        }
        
        if self.util.checkIfAPITimeStampHasChanged(APIType.Podcast, jsonValue: json) {
          podcastsArray = self.util.fetchAndStoreData(APIType.Podcast, jsonValue: json)
        } else {
          podcastsArray = self.util.fetchDataFromFileSystem(APIType.Podcast, jsonValue: json)
        }
    }
    
    return podcastsArray
  }
  
  func getAllRepos() -> [AnyObject] {
    var reposArray = []
    
    Alamofire.request(.GET, repoURL)
      .responseJSON { (request, response, json, error) in
        if error != nil {
          println(error)
          return
        }
        
        if self.util.checkIfAPITimeStampHasChanged(APIType.Repo, jsonValue: json) {
          reposArray = self.util.fetchAndStoreData(APIType.Repo, jsonValue: json)
        } else {
          reposArray = self.util.fetchDataFromFileSystem(APIType.Repo, jsonValue: json)
        }
    }
    
    return reposArray
  }
}