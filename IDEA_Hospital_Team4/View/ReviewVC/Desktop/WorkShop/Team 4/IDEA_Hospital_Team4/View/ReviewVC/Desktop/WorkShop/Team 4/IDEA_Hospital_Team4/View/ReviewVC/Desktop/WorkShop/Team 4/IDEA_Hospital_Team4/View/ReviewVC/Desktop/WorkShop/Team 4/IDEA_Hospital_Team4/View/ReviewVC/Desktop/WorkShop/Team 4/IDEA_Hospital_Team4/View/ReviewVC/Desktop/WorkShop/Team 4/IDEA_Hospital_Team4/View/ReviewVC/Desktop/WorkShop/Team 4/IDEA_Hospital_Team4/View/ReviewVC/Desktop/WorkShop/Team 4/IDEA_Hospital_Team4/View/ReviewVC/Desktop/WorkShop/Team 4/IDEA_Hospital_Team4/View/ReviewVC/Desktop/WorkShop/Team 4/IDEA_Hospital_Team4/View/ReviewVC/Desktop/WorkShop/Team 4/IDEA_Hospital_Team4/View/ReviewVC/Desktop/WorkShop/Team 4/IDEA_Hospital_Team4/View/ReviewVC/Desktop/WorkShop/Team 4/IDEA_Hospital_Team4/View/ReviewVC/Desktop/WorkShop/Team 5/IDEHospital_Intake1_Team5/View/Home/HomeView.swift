//
//  HomeView.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/11/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
import SDWebImage

class HomeView: UIView {
    // MARK:- Outlets
    @IBOutlet weak var backgroundImagView: UIImageView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var heartImagView: UIImageView!
    @IBOutlet var servicesViews: [ShadowView]!
    @IBOutlet var serviceImagesView: [UIImageView]!
    @IBOutlet var servicesNamesLabels: [UILabel]!
    @IBOutlet weak var servicesView: UIView!
    
    // MARK:- Variables
    var idArray = [Int].self
    @IBAction func serviceChoosePressed(_ sender: UIButton) {
//        switch sender.tag{
//        case 0: SearchVC.create()
//            print("it is in 0 ")
//        case 1: SearchVC.create()
//            
//        case 2:print("it is in 2 ")
//            
//        case 3: SearchVC.create()
//            
//
//        default:
//            break
//        }
    }
    let servicesImagesArray = [Asset.doctorWhite.image, Asset.ctScan.image, Asset.nurse.image ,  Asset.veterinary.image]
    let servicesViewsColorsArray = [ColorName.darkRoyalBlue.color, ColorName.puke.color, ColorName.richPurple.color, ColorName.niceBlue.color]
    let serviceNameLabelArray = [LabelText.humanMedicineLabel, LabelText.mRILabel, LabelText.hOMENURSELabel , LabelText.veterinaryLabel ]
    // MARK:- Public Method
    func setup(){
        self.setupHomeImage()
        self.setupHomeLabel()
    }
}
// MARK:- Private Method
extension HomeView {
     func setupServicesConfiguration(){
        for tag in 0...3 {
            setupServicesImage(tag: tag, serviceImage: servicesImagesArray[tag])
            setupServicesView(tag: tag, color: servicesViewsColorsArray[tag])
            setupServicesLabel(tag: tag, serviceNameLabel: serviceNameLabelArray[tag])
            }
    }
    func setupServicesToViews(mainCategoriesArray: [CategoriesData]){
        for tag in 0...3 {
            print("id in userDefult : \(String(describing: UserDefaultsManager.shared().serviceID ?? nil))")
            let imageData = mainCategoriesArray[tag].image  ?? ""
            let image = self.getimage(imageData)
            let color = UIColor.hexStringToUIColor(hex: mainCategoriesArray[tag].color)
            setupServicesImage(tag: tag, serviceImage : image)
            setupServicesView(tag: tag, color: color)
            setupServicesLabel(tag: tag, serviceNameLabel: mainCategoriesArray[tag].name)
          }
    }
    private func getimage(_ imageData: String) -> UIImage{
        let url = URL(string: imageData)
        let data = try? Data(contentsOf: url!)
        let image = UIImage(data: data!)!
        return image
    }
    private func setupServicesImage(tag: Int, serviceImage: UIImage){
        serviceImagesView[tag].image = serviceImage
    }
    private func setupHomeImage(){
        self.backgroundImagView.image = Asset.main.image
        self.backgroundImagView.contentMode = .scaleToFill
        self.heartImagView.image = Asset.whiteHeart.image
    }

    private func setupHomeLabel(){
        homeLabel.text = LabelText.homeLabel
        homeLabel.textColor = ColorName.white.color
        homeLabel.textAlignment = .center
    }
    private func setupServicesLabel(tag: Int, serviceNameLabel: String){
        servicesNamesLabels[tag].text = serviceNameLabel
        servicesNamesLabels[tag].textColor = ColorName.white.color
        servicesNamesLabels[tag].font.withSize(15)
    }
    private func setupServicesView(tag: Int, color: UIColor){
        servicesViews[tag].backgroundColor = color
    }
}



