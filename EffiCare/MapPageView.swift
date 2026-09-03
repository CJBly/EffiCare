//
//  MapPageView.swift
//
//  Created by Connor Bly on 10/30/25.
//
import SwiftUI
import CoreLocation
import MapKit

struct MapPageView: View{
    @ObservedObject var locationManager: LocationManager
    @StateObject private var mapViewModel = MapViewModel()
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, annotationItems: mapViewModel.healthcareLocations){ pin in
                MapAnnotation(coordinate: pin.coordinate){
                    Image(systemName: "cross-circle-fill")
                        .font(.title)
                        .foregroundColor(.red)
                    /*VStack{
                     
                     /*Text(pin.name)
                      .font(.caption)
                      .fixedSize()*/
                     }*/
                }
            }
            .frame(height: 300)
            .padding()
            if locationManager.permissionDenied{
                VStack{
                    Text("Can't show Healthcare Facilities Permission Denied")
                }
            }
            else if mapViewModel.healthcareLocations.isEmpty{
                Text("Fetching nearby healthcare facilities")
            }
            else{
                VStack{
                    Text("Healthcare Facilities Near You")
                        .font(.title2)
                        .bold(true)
                    List(mapViewModel.healthcareLocations){pin in
                        VStack(alignment: .leading, spacing: 4){
                            Text(pin.name)
                                .font(.headline)
                            Text(pin.address)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .listStyle(PlainListStyle())
                }

            }
        }
        .onAppear{
            locationManager.requestPermission()
            /*locationManager.location = CLLocation(latitude: 37.3349, longitude: -122.00902)*/
        }
        .onReceive(locationManager.$location){ location in
            if let userLocation = location{
                region = MKCoordinateRegion(
                    center: userLocation.coordinate,
                    latitudinalMeters: 3000,
                    longitudinalMeters: 3000)
                mapViewModel.searchForNearbyHealthcareFacilities(at: userLocation.coordinate)
            }
        }
    }
}

