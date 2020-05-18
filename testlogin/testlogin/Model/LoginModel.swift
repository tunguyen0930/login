//
//  LoginModel.swift
//  testlogin
//
//  Created by Nguyen Anh Tu on 5/18/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginModel : Mappable {
    var result : Bool?
    var message : String?
    var data : LoginDataModel?

    required init?(map: Map) {
    
    }
    
    init () {
        
    }

     func mapping(map: Map) {
        result <- map["result"]
        message <- map["message"]
        data <- map["data"]
    }
}

class LoginDataModel : Mappable {
    var id : Int?
    var email : String?
    var name : String?
    var phone : String?
    var address : String?
    var latitude : String?
    var longitude : String?
    var birthday : String?
    var gender : Int?
    var facebook_id : String?
    var google_id : String?
    var device_token : String?
    var cover : String?
    var type : Int?
    var receive_notification : Bool?
    var access_token : String?
    var avatar_url : String?
    var cover_url : String?
    var friend_count : Int?
    var follower_count : Int?
    var review_count : Int?
    var check_in_count : Int?
    var media_count : Int?
    var friend_status : String?
    var follow_status : Int?
    var is_influence : Bool?

    required init?(map: Map) {

    }

     func mapping(map: Map) {

        id <- map["id"]
        email <- map["email"]
        name <- map["name"]
        phone <- map["phone"]
        address <- map["address"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        birthday <- map["birthday"]
        gender <- map["gender"]
        facebook_id <- map["facebook_id"]
        google_id <- map["google_id"]
        device_token <- map["device_token"]
        cover <- map["cover"]
        type <- map["type"]
        receive_notification <- map["receive_notification"]
        access_token <- map["access_token"]
        avatar_url <- map["avatar_url"]
        cover_url <- map["cover_url"]
        friend_count <- map["friend_count"]
        follower_count <- map["follower_count"]
        review_count <- map["review_count"]
        check_in_count <- map["check_in_count"]
        media_count <- map["media_count"]
        friend_status <- map["friend_status"]
        follow_status <- map["follow_status"]
        is_influence <- map["is_influence"]
    }
}
