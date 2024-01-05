//
//  GoogleMaps.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 12/10/23.
//

import GoogleMaps

extension MapTableViewCell {
    
    func setDataForCell(srDetails: MySRequestDetailCell) {
        let coordinates = srDetails.coordinates
        let mapLocation = CLLocationCoordinate2D(
            latitude: Double(coordinates.first ?? 0),
            longitude: Double(coordinates.last ?? 0)
        )
        self.setUpMapView(mapLocation)
    }
    
    /**
     Set mapview
     - parameters:
     - location: CLLocationCoordinate2D instance
     */
    func setUpMapView(_ location: CLLocationCoordinate2D) {
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapMainView
        
        let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: 18)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapMainView = mapView
    }
    
    /// clear Google map instance
    func clearMapInstance() {
        if mapMainView != nil {
            mapMainView.clear()
            mapMainView = nil
        }
    }
    
}
