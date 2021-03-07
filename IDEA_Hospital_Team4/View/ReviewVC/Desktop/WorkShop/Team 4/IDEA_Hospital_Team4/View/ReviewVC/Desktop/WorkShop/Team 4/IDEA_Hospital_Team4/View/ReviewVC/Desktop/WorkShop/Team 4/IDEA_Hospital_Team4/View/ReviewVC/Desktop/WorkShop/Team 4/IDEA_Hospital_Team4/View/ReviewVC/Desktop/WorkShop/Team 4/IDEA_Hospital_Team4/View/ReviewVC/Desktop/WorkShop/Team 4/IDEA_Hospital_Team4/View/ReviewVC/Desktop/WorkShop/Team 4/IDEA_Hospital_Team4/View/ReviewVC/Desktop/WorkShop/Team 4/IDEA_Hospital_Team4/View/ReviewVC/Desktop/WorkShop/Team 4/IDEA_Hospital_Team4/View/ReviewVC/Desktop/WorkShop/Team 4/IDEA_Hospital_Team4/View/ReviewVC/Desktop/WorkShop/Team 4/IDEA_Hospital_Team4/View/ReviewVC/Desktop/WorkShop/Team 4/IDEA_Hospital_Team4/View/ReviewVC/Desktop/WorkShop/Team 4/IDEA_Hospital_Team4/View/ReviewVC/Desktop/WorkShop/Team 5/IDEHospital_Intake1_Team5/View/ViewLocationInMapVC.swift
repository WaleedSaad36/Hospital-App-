//
//  ViewLocationInMapVC.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/24/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces
import GoogleMaps

class ViewLocationInMapVC: UIViewController, GMSMapViewDelegate {
    //MARK:- outlet
        @IBOutlet weak var mapForView: UIView!
        //MARK:- property
        var infoLoc : InfLocData?
        var camera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 10)
        var mapView : GMSMapView?
        var locationManager = CLLocationManager()
        var markers = [GMSMarker]()
        override func viewDidLoad() {
            super.viewDidLoad()
            tabBarController?.tabBar.isHidden = true
            if let infoLocData = UserDefaults.standard.value(forKey:UserDefaultsKeys.infoLocData) as? Data {
                infoLoc = try? PropertyListDecoder().decode(InfLocData.self, from: infoLocData)
            }
            mapForView.frame = self.view.frame
            mapViewConfigure()
            viewOnMap()
            print("infoLoc: \(infoLoc)")
        }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

        //MARK:- Methods
    class func create() -> ViewLocationInMapVC {
        let viewLocationInMapVC: ViewLocationInMapVC = UIViewController.create(storyboardName: Storyboards.mainTabBar, identifier: ViewControllers.viewLocationInMapVC)
        return viewLocationInMapVC
    }

        func mapViewConfigure(){
            mapView = GMSMapView()
            mapView = GMSMapView.map(withFrame: mapForView.frame, camera: camera)
            mapView!.center = self.view.center
            self.mapForView.addSubview(mapView!)
            mapView!.delegate = self
            mapView!.mapType = .normal
            mapView!.isTrafficEnabled = true
            self.camera = GMSCameraPosition.camera(withLatitude: infoLoc?.lat ?? 0 , longitude: infoLoc?.lng  ?? 0 , zoom: 1000)
            self.mapView?.animate(to: self.camera)
            //get my location
            self.mapView!.isMyLocationEnabled = true
            //Location Manager code to fetch current location
        }
        override func viewWillAppear(_ animated: Bool) {
        }
        func locationOnMap() {
            //Location on map
           let locationOnmap =
                { [unowned self] (index: Int, item: String) in
                    CATransaction.begin()
                    CATransaction.setAnimationDuration(10.0)
                    self.camera = GMSCameraPosition.camera(withTarget: self.markers[0].position, zoom: 15)
                    self.mapView?.animate(to: self.camera)
                    
                    CATransaction.commit()
            }
        }
        
        func viewOnMap() {
            var index = 0
            markers.removeAll()
            mapView?.clear()
                let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: infoLoc?.lat ?? 0 , longitude: infoLoc?.lng ?? 0 )
                print("marker.position : \(marker.position)")
            marker.snippet = infoLoc?.address  ?? "no address"
            marker.icon = Asset.pin.image
            marker.tracksViewChanges = true
            marker.tracksInfoWindowChanges = true
            marker.map = mapView
            camera = GMSCameraPosition.camera(withTarget: marker.position, zoom: 10)
            marker.title = infoLoc?.name ?? "no name"
                index += 1
            markers.append(marker)
            CATransaction.begin()
            CATransaction.setAnimationDuration(1.5)
            
            if markers.count == 0
            {
                camera = GMSCameraPosition(target: .init(latitude: 0, longitude: 0), zoom: 12)
            }
            else
            {
                camera = GMSCameraPosition(target: markers[markers.count/2].position, zoom: 30)
            }
            
            mapView?.animate(to: camera)
            CATransaction.commit()
            self.viewDetail()
            
        }
        
        func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
            
            guard markers.firstIndex(of: marker) != nil
                else
            {
                print("error in index")
                return
            }
           
            
        }
        
        
        func viewDetail(){
            var buttons = [UIAlertAction]()
            let getDirection = UIAlertAction(title: "GetDirection", style: .default) {
                (UIAlertAction) in
                var cordinates = [Double]()
                cordinates.removeAll()
                cordinates.append(self.infoLoc?.lat ?? 0)
                cordinates.append(self.infoLoc?.lng ?? 0)
                self.openMapForPlace(receivedCordinates: cordinates)
                
            }
            buttons.append(getDirection)
            showCustomActionSheet(sheetTitle: infoLoc?.address ?? "no address" , actionButtons: buttons)
        }
    func openMapForPlace(receivedCordinates : [Double]) {

        let lat1 : Double = receivedCordinates[0]
        let lng1 : Double = receivedCordinates[1]
            let application = UIApplication.shared
            let coordinate = "\(lat1),\(lng1)"
            let encodedTitle = title?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let handlers = [
                ("Apple Maps", "http://maps.apple.com/?q=\(encodedTitle)&ll=\(coordinate)")]
                .compactMap { (name, address) in URL(string: address).map { (name, $0) } }
                .filter { (_, url) in application.canOpenURL(url) }

        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
            
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: ColorName.pinkishGrey.color]
        let titleString = NSAttributedString(string: "select navigation App" , attributes: titleAttributes)
        
        alert.setValue(titleString, forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: handlers[0].0, style: .default) { _ in
            
                    let latitude:CLLocationDegrees =  lat1
                    let longitude:CLLocationDegrees =  lng1
            
                    let regionDistance:CLLocationDistance = 100
                    let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
                    let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
                    let options = [
                        MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                        MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
                    ]
                    let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
                    let mapItem = MKMapItem(placemark: placemark)
                    mapItem.name = ""
                    mapItem.openInMaps(launchOptions: options)
        })
                alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
    
