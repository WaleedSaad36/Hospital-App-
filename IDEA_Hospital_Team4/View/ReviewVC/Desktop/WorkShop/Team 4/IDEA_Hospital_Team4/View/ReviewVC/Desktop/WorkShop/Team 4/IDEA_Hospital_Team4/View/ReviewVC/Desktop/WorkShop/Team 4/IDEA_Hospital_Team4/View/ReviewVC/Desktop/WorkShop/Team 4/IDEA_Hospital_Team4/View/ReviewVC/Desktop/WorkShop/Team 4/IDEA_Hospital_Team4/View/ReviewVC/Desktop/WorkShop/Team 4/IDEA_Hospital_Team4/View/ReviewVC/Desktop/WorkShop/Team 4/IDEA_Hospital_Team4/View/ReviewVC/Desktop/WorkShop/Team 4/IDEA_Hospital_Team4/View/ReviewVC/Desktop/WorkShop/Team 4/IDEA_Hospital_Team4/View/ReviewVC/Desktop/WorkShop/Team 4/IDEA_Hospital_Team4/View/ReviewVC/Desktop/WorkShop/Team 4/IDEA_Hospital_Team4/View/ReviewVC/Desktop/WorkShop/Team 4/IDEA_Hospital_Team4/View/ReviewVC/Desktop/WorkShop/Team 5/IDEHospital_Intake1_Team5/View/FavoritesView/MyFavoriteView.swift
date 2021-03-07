//
//  MyFavoriteView.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class MyFavoriteView: UIView {
        // MARK:- Outletss
        @IBOutlet weak var favoriteTableView: UITableView!
        @IBOutlet weak var noFavoriteLabel: UILabel!
        @IBOutlet weak var backgroundImageView: UIImageView!
    // MARK:- Public Method
        func setup(){
            self.setupLabel()
            self.tableViewConfiguration()
            self.addBackground()
        }
    }
    // MARK:- Private Method
    extension MyFavoriteView {
        private  func setupLabel(){
            noFavoriteLabel.text = LabelText.noDataFoundLabel
            noFavoriteLabel.textColor = ColorName.whiteTwo.color
            noFavoriteLabel.font = FontFamily.PTSans.bold.font(size: 16)
        }
        private func tableViewConfiguration(){
            self.favoriteTableView.register(UINib(nibName: Cells.favoritesResultTViewCell, bundle: nil), forCellReuseIdentifier: Cells.favoritesResultTViewCell)
            self.favoriteTableView.separatorStyle = .none
            self.favoriteTableView.rowHeight = UITableView.automaticDimension
            self.favoriteTableView.isOpaque = false
            self.noFavoriteLabel.isHidden = true
            self.favoriteTableView.backgroundColor = .clear
            self.favoriteTableView.reloadData()
        }
        func addBackground(){
            // Add a background view to the table view
            backgroundImageView.image  = Asset.main.image
            backgroundImageView.contentMode = .scaleAspectFill
        }
    }
    
    
    


