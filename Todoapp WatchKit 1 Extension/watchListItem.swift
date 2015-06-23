//
//  watchListItem.swift
//  Todoapp
//
//  Created by Magnus Oplenskdal on 19/06/15.
//  Copyright © 2015 Magnus Oplenskdal. All rights reserved.
//

import Foundation
import WatchKit

class WatchListItem: NSObject{
    var ifc:switchHandler!
    
    @IBOutlet var tableRowController: WKInterfaceGroup!
    
    @IBOutlet var switchSlider: WKInterfaceSwitch!
    
    @IBAction func switchAction(value: Bool) {

    }
    
    
}