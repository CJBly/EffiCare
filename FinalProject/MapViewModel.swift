//
//  MapViewModel.swift
//  FinalProject
//
//  Created by Connor Bly on 10/30/25.
//

import Foundation
import CoreLocation
import MapKit
import Combine

class MapViewModel: ObservableObject {
    @Published var healthcareLocations: [HealthcarePin] = []
    func searchForNearbyHealthcareFacilities(at coordinate: CLLocationCoordinate2D){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "healthcare OR hospital OR clinic OR urgent care"
        request.region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 5000,
            longitudinalMeters: 5000
        )
        let searchRequest = MKLocalSearch(request: request)
        searchRequest.start{ response, error in
            guard let response = response else{
                return
            }
            DispatchQueue.main.async{
                /*response.mapItems.forEach{ item in
                    let healthcarePin = HealthcarePin(name: item.name ?? "Unknown", coordinate: item.placemark.coordinate)
                    healthCarePins.append(healthcarePin)
                }*/
                self.healthcareLocations = response.mapItems.map{item in
                    HealthcarePin(name: item.name ?? "Unknown", address: item.placemark.title ?? "Address not available", coordinate: item.placemark.coordinate)
                }
            }
        }
        
    }
}
