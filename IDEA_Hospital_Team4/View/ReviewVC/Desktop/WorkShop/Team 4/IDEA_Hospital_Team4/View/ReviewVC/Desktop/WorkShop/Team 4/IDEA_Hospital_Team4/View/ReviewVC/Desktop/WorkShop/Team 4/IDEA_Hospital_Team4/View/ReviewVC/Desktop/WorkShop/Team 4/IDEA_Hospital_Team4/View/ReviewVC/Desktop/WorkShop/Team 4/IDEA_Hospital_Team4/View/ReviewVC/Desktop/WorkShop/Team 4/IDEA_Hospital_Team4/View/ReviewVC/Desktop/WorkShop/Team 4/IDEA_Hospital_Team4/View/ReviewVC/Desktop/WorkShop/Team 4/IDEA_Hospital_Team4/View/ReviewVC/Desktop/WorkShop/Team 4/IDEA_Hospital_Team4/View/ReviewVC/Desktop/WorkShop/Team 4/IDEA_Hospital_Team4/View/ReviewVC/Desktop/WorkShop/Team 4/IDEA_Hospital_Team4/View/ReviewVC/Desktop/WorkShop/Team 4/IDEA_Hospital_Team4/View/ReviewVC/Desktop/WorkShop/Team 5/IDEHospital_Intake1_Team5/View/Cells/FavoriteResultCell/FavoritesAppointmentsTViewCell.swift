//
//  FavoritesAppointmentsTViewCell.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
protocol FavoritesCellDelegate : class {
    func deletePressButton(_ tag: Int)
    func doctorProfilePressButton(_ tag: Int)
}

class FavoritesAppointmentsTViewCell: UITableViewCell{
    
    // MARK:- Outlets
    @IBOutlet weak var deleteImageView: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var specialistLabel: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet var rateImageView: [UIImageView]!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var campanyNameLabel: UILabel!
    @IBOutlet weak var campanyIcon: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressIcon: UIImageView!
    
    @IBOutlet weak var waittingTimeLabel: UILabel!
    @IBOutlet weak var waittingIcon: UIImageView!
    
    @IBOutlet weak var feesLabel: UILabel!
    @IBOutlet weak var feesIcon: UIImageView!
    
    @IBOutlet weak var seprateWhiteLineView: UIView!
    @IBOutlet weak var viewProfileButton: UIButton!
    // MARK:- Properties
    var delegate: FavoritesCellDelegate?

    // MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpImages()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.labelConfiguration()
        self.setUpLineView()
        self.setUpIconsConfiguration()
        self.setUpViewProfileButton()
    }
    // MARK:- Actions
    @IBAction func doctorProfileButton(_ sender: UIButton)
    {  
       delegate?.doctorProfilePressButton(sender.tag)
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        delegate?.deletePressButton(sender.tag)
    }

    // MARK:- Configuration Of Cell
    private func setUpLineView(){
        seprateWhiteLineView.backgroundColor = ColorName.whiteTwo.color
    }
    private func labelConfiguration(){
        setUpInfoLabel(reviewLabel)
        setUpInfoLabel(campanyNameLabel)
        setUpInfoLabel(addressLabel)
        setUpInfoLabel(waittingTimeLabel)
        setUpInfoLabel(feesLabel)
        setUpHeadlineLabel(doctorNameLabel)
        setUpHeadlineLabel(specialistLabel)
    }
    private func setUpViewProfileButton(){
        viewProfileButton.backgroundColor = ColorName.darkRoyalBlue.color
        viewProfileButton.tintColor = ColorName.white.color
        viewProfileButton.titleLabel?.font = FontFamily.PTSans.bold.font(size: 12)
    }
    private func setUpIconsConfiguration(){
        setUpIcons(Asset.companyIcon.image, campanyIcon)
        setUpIcons(Asset.clockIcon.image, waittingIcon)
        setUpIcons(Asset.pinIcon.image, addressIcon)
        setUpIcons(Asset.feesIcon.image, feesIcon)
    }
    private func setUpInfoLabel( _ label: UILabel){
        label.textColor = ColorName.white.color
        label.font = FontFamily.PTSans.regular.font(size: 12)
        label.backgroundColor = .clear
        label.textAlignment = .left
    }

    private func setUpHeadlineLabel( _ label: UILabel){
        label.textColor = ColorName.white.color
        label.font = FontFamily.PTSans.bold.font(size: 15)
        label.backgroundColor = .clear
        label.textAlignment = .left
    }
    private func setUpImages(){
        setUpDoctoreImage()
        setUpDeleteImage()
    }
    private func setUpDeleteImage(){
        deleteImageView.layer.cornerRadius = deleteImageView.frame.height / 2
        deleteImageView.contentMode = .scaleToFill
        deleteImageView.image = Asset.close.image
        deleteImageView.layer.borderWidth = 1
        deleteImageView.backgroundColor = .clear
        if #available(iOS 13.0, *) {
            deleteImageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        } else {
            // Fallback on earlier versions
        }
    }
    private func setUpDoctoreImage(){
        doctorImageView.layer.cornerRadius = doctorImageView.frame.height / 2
        doctorImageView.contentMode = .scaleToFill
        doctorImageView.layer.borderWidth = 1
    }
    private func setUpIcons(_ image: UIImage, _ imageView: UIImageView){
        imageView.contentMode = .scaleToFill
        imageView.image = image
        imageView.backgroundColor = .clear
    }
    private func setUpStars(_ rate: Int){
        for tag in 0...4 {
            if rate > tag && rate > 0 {
                rateImageView[tag].image = Asset.rateYallow.image
            } else {
                rateImageView[tag].image = Asset.whiteStars.image
            }
            rateImageView[tag].contentMode = .scaleToFill
            rateImageView[tag].backgroundColor = .clear
        }
    }
    private func getimage(_ imageData: String) -> UIImage{
        let url = URL(string: imageData)
        let data = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: data!)!
        return image
    }
   
    func setupFavoriteCellData(object: FavoriteItems){
        self.setUpStars(object.rating)
        let image = getimage( object.image )
        doctorNameLabel.text = object.name
        reviewLabel.text = "\(object.reviewsCount)" + " Review"
        specialistLabel.text = object.specialty
        campanyNameLabel.text = object.bio
        addressLabel.text = object.city + " : " + object.region + " - " + object.address
        waittingTimeLabel.text = "Waiting Time : " + String(object.waitingTime) + " minutes"
        feesLabel.text = "Examination Fees : " + String(object.fees) + " LE"
        doctorImageView.image = image
    }
}
