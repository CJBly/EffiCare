//
//  LocationManager.swift
//
//  Created by Connor Bly on 10/30/25.
//
import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var location: CLLocation?
    @Published var permissionDenied = false
    private let locationManager: CLLocationManager
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestPermission(){
        locationManager.requestWhenInUseAuthorization()
        //locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .denied, .restricted:
            DispatchQueue.main.async {
                self.permissionDenied = true
            }
        case .authorizedWhenInUse, .authorizedAlways:
            self.permissionDenied = false
            manager.startUpdatingLocation()
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            DispatchQueue.main.async {
                self.location = location
                self.locationManager.stopUpdatingLocation()
            }
        }
    }
}
