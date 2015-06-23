//
//  Todo.swift
//  Todoapp
//
//  Created by Magnus Oplenskdal on 18/06/15.
//  Copyright © 2015 Magnus Oplenskdal. All rights reserved.
//

import Foundation

class Todo{
    var id = NSUUID().UUIDString;
    var description:String?
    var date: NSDate
    
    init(description:String?, date:NSDate){
        self.description = description;
        self.date = date;
    }
}