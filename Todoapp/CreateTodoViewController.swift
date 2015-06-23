//
//  CreateTodoViewController.swift
//  Todoapp
//
//  Created by Magnus Oplenskdal on 18/06/15.
//  Copyright © 2015 Magnus Oplenskdal. All rights reserved.
//

import UIKit
import MapKit

class CreateTodoViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addButton: UIButton!
    
    var vc:NewTodoViewControllerDelegate?;
    var editableTodo:Todo?;
    
    
    let locationManager = CLLocationManager()
    

    
    @IBAction func pressedAddButton(sender: AnyObject) {
        if(editableTodo==nil){
            let todo = Todo(description:inputText.text , date:datePicker.date);
            vc?.didCreateTodo(todo)
        }else{
            editableTodo?.description = inputText?.text
            editableTodo?.date = datePicker.date
            vc?.didCreateTodo(editableTodo!)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(editableTodo != nil){
            inputText?.text = editableTodo?.description
            addButton?.setTitle("Edit", forState: .Normal)
        }
        
        setLocation()
        
    }
}

extension CreateTodoViewController: CLLocationManagerDelegate{
    
    func setLocation(){
        
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
           
            locationManager.delegate = self
            
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            
            locationManager.startUpdatingLocation()
        }
       
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [AnyObject]){
        print("updates")
        
        //let CLlocations = locations as! [CLLocation]
        //let location = CLlocations.last
        
        

        //let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)

        
        //let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("FAILED update " + error.localizedDescription)
    }
    
    
    
}


