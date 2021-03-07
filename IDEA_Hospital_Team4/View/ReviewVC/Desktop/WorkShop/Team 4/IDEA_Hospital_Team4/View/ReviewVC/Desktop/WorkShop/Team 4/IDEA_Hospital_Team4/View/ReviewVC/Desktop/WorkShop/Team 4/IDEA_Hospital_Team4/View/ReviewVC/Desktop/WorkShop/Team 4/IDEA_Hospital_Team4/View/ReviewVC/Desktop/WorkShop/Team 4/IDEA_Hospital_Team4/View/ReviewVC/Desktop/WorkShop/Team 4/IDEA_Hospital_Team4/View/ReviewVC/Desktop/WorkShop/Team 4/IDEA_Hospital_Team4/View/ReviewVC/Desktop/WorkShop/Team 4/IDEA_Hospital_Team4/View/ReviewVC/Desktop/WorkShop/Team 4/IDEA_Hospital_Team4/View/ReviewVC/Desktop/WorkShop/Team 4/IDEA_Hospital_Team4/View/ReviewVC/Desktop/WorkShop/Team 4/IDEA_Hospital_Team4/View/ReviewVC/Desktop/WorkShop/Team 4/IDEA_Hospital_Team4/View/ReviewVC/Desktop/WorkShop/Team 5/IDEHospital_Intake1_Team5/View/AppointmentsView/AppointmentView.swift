//
//  MyFavoriteView.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import UIKit

class AppointmentView: UIView {
        // MARK:- Outletss
        @IBOutlet weak var appointmentTableView: UITableView!
        @IBOutlet weak var noAppointmentLabel: UILabel!
        @IBOutlet weak var backgroundImageView1: UIImageView!
    // MARK:- Public Method
        func setup(){
            self.setupLabel()
            self.tableViewConfiguration()
            self.addBackground()
        }
    }
    // MARK:- Private Method
    extension AppointmentView {
        private  func setupLabel(){
            noAppointmentLabel.text = LabelText.noDataFoundLabel
            noAppointmentLabel.textColor = ColorName.whiteTwo.color
            noAppointmentLabel.font = FontFamily.PTSans.bold.font(size: 16)
        }
        private func tableViewConfiguration(){
            self.appointmentTableView.register(UINib(nibName: Cells.appointmentsCell , bundle: nil), forCellReuseIdentifier: Cells.appointmentsCell)
            self.appointmentTableView.tintColor = .clear
            self.appointmentTableView.separatorStyle = .none
            self.appointmentTableView.rowHeight = UITableView.automaticDimension
            self.appointmentTableView.isOpaque = false
            self.noAppointmentLabel.isHidden = true
            self.appointmentTableView.backgroundColor = .clear
            self.appointmentTableView.reloadData()
        }
        func addBackground(){
            // Add a background view to the table view
            backgroundImageView1.image  = Asset.main.image
            backgroundImageView1.contentMode = .scaleAspectFill
        }
    }
    
    
    


