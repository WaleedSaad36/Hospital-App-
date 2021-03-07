//
//  bookAppointmentVC.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Eslam Sebaie on 1/4/21.
//

import UIKit
protocol bookAppointmentVCProtocol: class {
    func showAlert(img: UIImage,message: String)
}
class bookAppointmentVC: UIViewController {

    
    @IBOutlet var bookAppointView: bookAppointmentView!
    private var bookAppointViewModal: BookAppointmentViewModal!
    var docName = ""
    var presenting = UIViewController()
    var user = userAppoint()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenting = self.presentingViewController!
        bookAppointView.updateUI()
        bookAppointView.setDetailLabel(appointment: bookAppointViewModal.returnUserApp().appointment!, name: docName)
    }
    
    //MARK:- CreateVC
    class func create(data: userAppoint) -> bookAppointmentVC {
        let bookVC: bookAppointmentVC = UIViewController.create(storyboardName: Storyboards.bookAppointment, identifier: ViewControllers.bookAppointmentVC)
        bookVC.bookAppointViewModal = BookAppointmentViewModal(view: bookVC, data: data)
        return bookVC
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        let cancel = cancelAppointmentVC.create()
        cancel.modalPresentationStyle = .overCurrentContext
        self.dismiss(animated: true, completion: nil)
        
        let OK = AlertButton1 {
            self.presenting.dismiss(animated: true, completion: nil)
        }
        
        let Cancel = AlertButton1 {
            let book = bookAppointmentVC.create(data: self.user)
            book.modalPresentationStyle = .overCurrentContext
            self.presenting.dismiss(animated: true, completion: nil)
            self.presenting.present(book, animated: true, completion: nil)
        }
        let alertPayload = AlertPayload1(message: "Are you sure you want to Cancel Appointment?",  buttons: [OK, Cancel])
        
        Utils.showAlert1(payload: alertPayload, parentViewController: presenting);
        
       
    }
    
    @IBAction func confirmPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        bookAppointViewModal.saveAppointment()
    }
}
extension bookAppointmentVC: bookAppointmentVCProtocol {
    func showAlert(img: UIImage,message: String) {
        let alertPayload = AlertPayload(img:img,message: message) {
            self.presenting.dismiss(animated: true, completion: nil)
        }
        Utils.showAlert(payload: alertPayload, parentViewController: presenting)
    }
    
}
