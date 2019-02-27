//
//  ViewController.swift
//  MyMap
//
//  Created by t2kmato on 2019/02/27.
//  Copyright © 2019 t2kmato. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Text Fieldのdelegate通知先を設定
        inputText.delegate = self
        
    }

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var dispMap: MKMapView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let searchKey = textField.text {
            print(searchKey)
            
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(searchKey, completionHandler: { (placemarks, error) in
                if let unwrapPlacemarks = placemarks {
                    if let firstPlacemark = unwrapPlacemarks.first {
                        if let location = firstPlacemark.location {
                            let targetCoordinate = location.coordinate
                            print(targetCoordinate)
                            
                            let pin = MKPointAnnotation()
                            pin.coordinate = targetCoordinate
                            pin.title = searchKey
                            self.dispMap.addAnnotation(pin)
                            self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                        }
                    }
                }
            })
        }
        
        return true
    }
    @IBAction func changeMapButton(_ sender: Any) {
        if dispMap.mapType == .standard {
            dispMap.mapType = .satellite
        } else if dispMap.mapType == .satellite {
            dispMap.mapType = .hybrid
        } else if dispMap.mapType == .hybrid {
            dispMap.mapType = .satelliteFlyover
        } else if dispMap.mapType == .satelliteFlyover {
            dispMap.mapType = .hybridFlyover
        } else if dispMap.mapType == .hybridFlyover {
            dispMap.mapType = .mutedStandard
        } else {
            dispMap.mapType = .standard
        }
    }
    
}

