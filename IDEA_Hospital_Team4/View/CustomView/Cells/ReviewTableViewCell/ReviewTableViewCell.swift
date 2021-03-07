//
//  ReviewTableViewCell.swift
//  IDE Hospital
//
//  Created by Ibrahim El-geddawy on 10/18/20.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    // MARK:- Outlets
    @IBOutlet weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var starStackView: UIStackView!
    
    // MARK: - Properties
    static let ID = "\(ReviewTableViewCell.self)"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .clear
        self.setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- Public Methodes
    func configure(review: ReviewModel){
        self.commentLabel.text = review.comment ?? ""
        self.reviewerNameLabel.text = review.commentedBy ?? ""
        self.setupStars(rating: review.rating ?? 0)
    }
}

//MARK:- Private Methodes
extension ReviewTableViewCell{
    private func setupUI(){
        self.setupReviewerNameLabel()
        self.setupCommentLabel()
    }
    private func setupReviewerNameLabel(){
        self.reviewerNameLabel.font = FontFamily.PTSans.bold.font(size: 12)
        self.reviewerNameLabel.textColor = UIColor(hexString: "#001867")
    }
    private func setupCommentLabel(){
        self.commentLabel.font = FontFamily.PTSans.regular.font(size: 10)
        self.commentLabel.textColor = UIColor(hexString: "#0a0a0a")
        self.commentLabel.numberOfLines = 0
    }
    private func setupStars(rating: Int) {
        var starts = rating
        if starts > 5 {
            starts = 5
        } else if starts <= 0 {
           return
        }
        for starIndex in 0...starts - 1 {
            let startImageView = starStackView.arrangedSubviews[starIndex] as! UIImageView
            startImageView.image = Asset.star.image
        }
    }
}
