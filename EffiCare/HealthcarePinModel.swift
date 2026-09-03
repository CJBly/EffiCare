//
//  HealthcarePinModel.swift
//
//  Created by Connor Bly on 10/30/25.
//
import Foundation
import CoreLocation
struct HealthcarePin: Identifiable{
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}
