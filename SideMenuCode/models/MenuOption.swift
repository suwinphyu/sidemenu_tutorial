//
//  MenuOption.swift
//  SideMenuCode
//
//  Created by Su Win Phyu on 12/1/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import UIKit

enum MenuOption :Int , CustomStringConvertible {
   
    
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description : String{
        switch self {
        case .Profile: return "Profile"
        case .Inbox : return "Inbox"
        case .Notifications : return "Notifications"
        case .Settings : return "Settings"
       
        }
    }
    
    var menuImage : UIImage{
        switch self {
        case .Profile: return UIImage(named: "icons8-gender_neutral_user") ?? UIImage()
        case .Inbox : return UIImage(named: "icons8-reddit_inbox") ?? UIImage()
        case .Notifications : return UIImage(named: "icons8-menu") ?? UIImage()
        case .Settings : return UIImage(named: "icons8-settings") ?? UIImage()
      
    
        }
    }
}
