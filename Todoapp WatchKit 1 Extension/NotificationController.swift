//
//  NotificationController.swift
//  Todoapp WatchKit 1 Extension
//
//  Created by Magnus Oplenskdal on 19/06/15.
//  Copyright © 2015 Magnus Oplenskdal. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class NotificationController: WKUserNotificationInterfaceController {
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}



