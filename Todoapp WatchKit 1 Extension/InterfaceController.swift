//
//  InterfaceController.swift
//  Todoapp WatchKit 1 Extension
//
//  Created by Magnus Oplenskdal on 19/06/15.
//  Copyright © 2015 Magnus Oplenskdal. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

protocol switchHandler {
}
class InterfaceController: WKInterfaceController, switchHandler, WCSessionDelegate {
    
    var session:WCSession!;
    @IBOutlet var tableView: WKInterfaceTable!
    var fakeData = ["One","Two","Three","Four","Five",]
    
    @IBOutlet var label: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        label.setText("funker ikke")
        
        session = WCSession.defaultSession();
        session.delegate = self
        session.activateSession()
        
        
        //setDelegates()
        //connectToPhone()
        fillTableView()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        label.setText("IT WORKS")
        print("FUNK")
    }

}

extension InterfaceController {
    func setDelegates(){
        session.delegate = self
        print("setter delegate i watch")
    }
    func fillTableView(){
        tableView.setNumberOfRows(fakeData.count, withRowType: "watchListItem")
        
        for (var i = 0; i<fakeData.count; i++){
            let rowCtrl = tableView.rowControllerAtIndex(i) as! WatchListItem
            rowCtrl.switchSlider.setTitle(fakeData[i])
        }
    }
    
    func connectToPhone(){
        session.activateSession()
        print("session startet i watch")
        
    }
    func session(session: WCSession, didFinishUserInfoTransfer userInfoTransfer: WCSessionUserInfoTransfer, error: NSError?) {
        label.setText(error?.localizedDescription)
    }
    

}
