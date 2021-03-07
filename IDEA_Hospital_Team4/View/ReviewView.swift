//
//  ReviewView.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/10/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import UIKit
import Cosmos

class ReviewView: UIView {

    //MARK:- Outlets
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var LabelRate: UILabel!
    @IBOutlet weak var addCommentTxt: PaddedTextField!
    @IBOutlet weak var starsStackView: CosmosView!
    @IBOutlet weak var submitReviewBtn: IDEHospitalButton!
    
    //MARK:- Properties
    
    //MARK:- Public Methods
    func setUp() {
        self.layoutIfNeeded()
        setUpBackground()
        submitReviewBtn.setup(title: "Submit Review")
        setUplabel()
        setupTextField()
        setUpRatingCosmos()
    }
    
    
    
}
extension ReviewView{
    private func setUpBackground() {
        background.image = Asset.background.image
        background.contentMode = .scaleAspectFill
    }
    
    
    private func setUplabel() {
        LabelRate.backgroundColor = .clear
        LabelRate.text = "Please rate your experience with the doctor"
        LabelRate.tintColor = .white
        LabelRate.sizeToFit()
        LabelRate.font = FontFamily.PTSans.bold.font(size: 14)
    }
    private func setUpRatingCosmos(){
        starsStackView.settings.updateOnTouch = true
        
        // Show only fully filled stars
        starsStackView.settings.fillMode = .full
        // Other fill modes: .half, .precise
        
        // Change the size of the stars
        starsStackView.settings.starSize = 20
        
        
        // Set the distance between stars
        starsStackView.settings.starMargin = 3
        
        // Set the color of a filled star
        starsStackView.settings.filledColor = UIColor.orange
        
        // Set the border color of an empty star
        starsStackView.settings.emptyBorderColor = UIColor.orange
        
        // Set the border color of a filled star
        starsStackView.settings.filledBorderColor = UIColor.orange
        
        // Set image for the filled star
        starsStackView.settings.filledImage = UIImage(named: "GoldFilledStar")
        
        // Set image for the empty star
        starsStackView.settings.emptyImage = UIImage(named: "GoldEmptyStar")
        self.backgroundColor = .clear
    }
    
    private func setupTextField() {
        addCommentTxt.attributedPlaceholder = NSAttributedString(string: "Add Comment",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: FontFamily.PTSans.bold.font(size: 12)])
        addCommentTxt.tintColor = .white
        addCommentTxt.textColor = .white
        addCommentTxt.font = FontFamily.PTSans.bold.font(size: 12)
        addCommentTxt.borderStyle = .none
        addCommentTxt.setUnderLine()
    }
}
