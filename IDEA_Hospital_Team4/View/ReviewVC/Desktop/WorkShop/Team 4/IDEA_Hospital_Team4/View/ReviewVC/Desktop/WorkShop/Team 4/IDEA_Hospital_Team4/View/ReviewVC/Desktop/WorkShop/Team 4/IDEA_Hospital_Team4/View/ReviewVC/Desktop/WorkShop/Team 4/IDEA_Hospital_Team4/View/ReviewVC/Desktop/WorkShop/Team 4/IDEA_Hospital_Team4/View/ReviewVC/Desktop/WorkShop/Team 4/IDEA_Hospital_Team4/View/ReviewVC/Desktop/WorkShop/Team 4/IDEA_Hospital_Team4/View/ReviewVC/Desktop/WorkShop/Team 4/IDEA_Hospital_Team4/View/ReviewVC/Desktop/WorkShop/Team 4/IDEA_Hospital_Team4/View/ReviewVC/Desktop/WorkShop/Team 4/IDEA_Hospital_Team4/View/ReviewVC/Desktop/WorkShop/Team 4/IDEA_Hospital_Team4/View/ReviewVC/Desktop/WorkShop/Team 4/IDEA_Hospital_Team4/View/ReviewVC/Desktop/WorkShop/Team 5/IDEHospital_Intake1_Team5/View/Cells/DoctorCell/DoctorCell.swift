//
//  FavoritesAppointmentsTViewCell.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class DoctorCell: UITableViewCell {
    // MARK:- Outlets
    @IBOutlet weak var favoretDoctor: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var specialistLabel: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet var rateImageView: [UIImageView]!
    @IBOutlet weak var favoriteView: UIView!
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
    @IBOutlet weak var bookNowButton: UIButton!
    
    // MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpImages()
        self.labelConfiguration()
        self.setUpLineView()
        self.setUpIconsConfiguration()
        self.setUpViewProfileButton()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        bookNowButton.backgroundColor = ColorName.darkRoyalBlue.color
        bookNowButton.tintColor = ColorName.white.color
        bookNowButton.titleLabel?.font = FontFamily.PTSans.bold.font(size: 12)
    }
    private func setUpIconsConfiguration(){
        setUpIcons(Asset.whiteHeart.image, campanyIcon)
        setUpIcons(Asset.clock.image, waittingIcon)
        setUpIcons(Asset.pin.image, addressIcon)
        setUpIcons(Asset.dollar.image, feesIcon)
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
        setUpFavoretDoctorImage()
    }
    private func setUpFavoretDoctorImage(){
        favoretDoctor.layer.cornerRadius = favoretDoctor.frame.height / 2
        favoretDoctor?.contentMode = .scaleToFill
        favoretDoctor?.image = Asset.fav.image
        favoretDoctor?.layer.borderWidth = 1
        favoretDoctor?.backgroundColor = .clear
        favoretDoctor?.layer.borderColor = UIColor.clear.cgColor
    }
    private func setUpDoctoreImage(){
        doctorImageView?.layer.cornerRadius = doctorImageView?.frame.height ?? 50 / 2
        doctorImageView?.contentMode = .scaleToFill
        doctorImageView?.layer.borderWidth = 1
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
                rateImageView[tag].image = Asset.whiteStar.image
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
   
    func setupDoctorCellData(object: DoctoreItem){
        specialistLabel.isHidden = false
        self.setUpStars(object.rating)
        let image = getimage( object.image )
        doctorNameLabel.text = object.name
        reviewLabel.text = "\(object.reviewsCount)" + " Review"
        specialistLabel.text = object.specialty
        campanyNameLabel.text = object.companies[0]
        addressLabel.text = object.city + " : " + object.region + " - " + object.address
        waittingTimeLabel.text = "Waiting Time : " + String(object.waitingTime) + " minutes"
        feesLabel.text = "Examination Fees : " + String(object.fees) + " LE"
        doctorImageView.image = image
    }
    
}

