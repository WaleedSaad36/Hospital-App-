//
//  AppointmentsCell.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/23/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit
protocol AppointmentsCellDelegate : class {
    func deletePressButton(_ tag: Int)
    func mapViewPressButton(_ tag: Int)
}

class AppointmentsCell: UITableViewCell ,UITextViewDelegate {
    // MARK:- Outlets
    @IBOutlet weak var deleteImageView1: UIImageView!
    @IBOutlet weak var doctorNameLabel1: UILabel!
    @IBOutlet weak var reviewLabel1: UILabel!
    @IBOutlet weak var doctorImageView1: UIImageView!
    @IBOutlet var rateImageView1: [UIImageView]!
    @IBOutlet weak var deleteButton1: UIButton!
    @IBOutlet weak var pinIconAppoint1: UIImageView!
    @IBOutlet weak var mapViewLabel1: UILabel!
    @IBOutlet weak var dateAppointmentLabel1: UILabel!
    @IBOutlet weak var timeAppointmentLabel1: UILabel!
    @IBOutlet weak var mapViewButton1: UIButton!
    @IBOutlet weak var contentTextView1: UITextView!
    @IBOutlet weak var seprateWhiteLineView1: UIView!
    @IBOutlet weak var contentTextViewHieght : NSLayoutConstraint!
    // MARK:- Properties
    var delegate: AppointmentsCellDelegate?
    
    // MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    // MARK:- Actions
    @IBAction func mapViewButton(_ sender: UIButton) {
       delegate?.mapViewPressButton(sender.tag)
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        delegate?.deletePressButton(sender.tag)
    }

    func setup(){
    self.setUpImages()
    self.labelConfiguration()
    self.setUpLineView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK:- Configuration Of Cell
    private func setUpLineView(){
        seprateWhiteLineView1.backgroundColor = ColorName.whiteTwo.color
    }
    func convertTimestamp(timeStamp: Int64)  -> String{
         if let timeResult = (timeStamp as? Int64) {
            let date = Date(timeIntervalSince1970: TimeInterval(timeResult))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            dateFormatter.setLocalizedDateFormatFromTemplate("EEEE,dd MMMM, yyy hh:mm a") // set template after setting locale
            let localDate = dateFormatter.string(from: date)
            print("in convert : \(localDate)")
            return String(localDate)
        }
    }

    private func labelConfiguration(){
        setUpInfoLabel(reviewLabel1, 12)
        setUpInfoLabel(mapViewLabel1, 13)
        setUpInfoLabel(timeAppointmentLabel1, 13)
        setUpInfoLabel(dateAppointmentLabel1, 13)
        setUpHeadlineLabel(doctorNameLabel1)
    }
    private func setUpInfoLabel( _ label: UILabel, _ fontsize: Int){
        label.textColor = ColorName.white.color
        label.font = FontFamily.PTSans.regular.font(size: CGFloat(fontsize))
        label.backgroundColor = .clear
        label.textAlignment = .left
    }
    private func setUpInfoTextView(){
        contentTextView1.textColor = ColorName.white.color
        contentTextView1.font = FontFamily.PTSans.regular.font(size: 12)
        contentTextView1.backgroundColor = .clear
        contentTextView1.textAlignment = .left
        contentTextViewHieght.constant = self.contentTextView1.contentSize.height
        contentTextView1.isScrollEnabled = false
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
        deleteImageView1.layer.cornerRadius = deleteImageView1.frame.height / 2
        deleteImageView1.contentMode = .scaleToFill
        deleteImageView1.image = Asset.close.image
        deleteImageView1.layer.borderWidth = 1
        deleteImageView1.backgroundColor = .clear
        pinIconAppoint1.backgroundColor = .clear
        pinIconAppoint1.image = Asset.pinIcon.image
        if #available(iOS 13.0, *) {
            deleteImageView1.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        } else {
            // Fallback on earlier versions
        }
    }
    private func setUpDoctoreImage(){
        doctorImageView1.layer.cornerRadius = doctorImageView1.frame.height / 2
        doctorImageView1.contentMode = .scaleToFill
        doctorImageView1.layer.borderWidth = 1
    }
    private func setUpIcons(_ image: UIImage, _ imageView: UIImageView){
        imageView.contentMode = .scaleToFill
        imageView.image = image
        imageView.backgroundColor = .clear
    }
    private func setUpStars(_ rate: Int){
        for tag in 0...4 {
            if rate > tag && rate > 0 {
                rateImageView1[tag].image = Asset.rateYallow.image
            } else {
                rateImageView1[tag].image = Asset.whiteStars.image
            }
            rateImageView1[tag].contentMode = .scaleToFill
            rateImageView1[tag].backgroundColor = .clear
        }
    }
    private func getimage(_ imageData: String) -> UIImage{
        let url = URL(string: imageData)
        let data = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: data!)!
        return image
    }
    func setupAppointmentCellData(object: AppointmentItems){
        let timeStamp = object.appointment
        self.setUpStars(object.doctor.rating)
        let image = getimage( object.doctor.image )
        doctorNameLabel1.text = object.doctor.name
        reviewLabel1.text = "\(object.doctor.reviewsCount)" + " Review"
        contentTextView1.text = object.doctor.bio
        self.setUpInfoTextView()
        mapViewLabel1.text = "View on map"
        let dateTimeString = String(convertTimestamp(timeStamp:Int64(timeStamp))).components(separatedBy: ", ")
        let line =  String(convertTimestamp(timeStamp:Int64(timeStamp))).split(separator: ",", maxSplits: 1)
        print("line \(line)")
        print("dateTimeString : \(dateTimeString)")
        let resualt = String(convertTimestamp(timeStamp:Int64(timeStamp)))
        
        dateAppointmentLabel1.text = "\(dateTimeString[0])," + "\(dateTimeString[1])"
        + "\(dateTimeString[2])"
        timeAppointmentLabel1.text = dateTimeString.last
        doctorImageView1.image = image
//        let date =  String(object.appointment).split(separator: ".", maxSplits: <#T##Int#>, omittingEmptySubsequences: <#T##Bool#>)
        //timeAppointmentLabel1.text = String(object.appointment)
    }
    func setupAppointmentCellData1(){
        self.setUpStars(4)
        doctorNameLabel1.text = "Abeer"
        reviewLabel1.text = "100 Review"
        mapViewLabel1.text = "View on map"
        dateAppointmentLabel1.text = "Sunday,22 October 2017"
    }
}


