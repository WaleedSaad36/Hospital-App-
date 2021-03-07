//
//  DrProfileViewController.swift
//  IDE Hospital
//
//  Created by Ibrahim El-geddawy on 10/18/20.
//

import UIKit

protocol DrProfileViewControllerProtocol: UIViewController {
    func showLoader(type: LoaderType)
    func hideLoader(type: LoaderType)
    func showError(with message: String)
    func showVoucher()
    func showConfirm(with message: String)
    func showSuccess(with message: String)
    func reloadAppointmentsCollectionView()
    func reloadReviewTableView()
    func setupDrProfile(profile: Doctor)
    func setupAppoinmentDate(appointment: AppointmentDate)
    func goToReviewVC(id: Int)
    func openMap(lat: Float, lng: Float)
    func showSignin(timeStamp: String, doctorID: Int)
    func showResult(state: ResultState)
}

class DrProfileVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var drProfileView: DrProfileView!
    var docName: String?
    var timeStamp:Int?
    
    // MARK: - Properties
    var viewModel: DrProfileviewModelProtocol!
    var viewModelVouchar:VoucharViewModelProtocol!
    static let ID = "\(DrProfileVC.self)"

    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        drProfileView.setupUI()
        setupNavBar()
        self.viewModel.getDrAppointmentsData()
        delegates()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getDrProfileData()
        viewModel.getReview()
    }
    
    // MARK:- Public Methods
    class func create(id: Int) -> DrProfileVC {
        let drProfileVC: DrProfileVC = UIViewController.create(storyboardName: Storyboards.drProfile, identifier: self.ID)
        drProfileVC.viewModel = DrProfileViewModel(view: drProfileVC, id: id)
        return drProfileVC
    }
    
    // MARK:- Actions
    @IBAction func favoritePressedBtn(_ sender: UIButton) {
        viewModel.didTapFavourite()
    }
    @IBAction func tapReviewPressedBtn(_ sender: UIButton) {
        viewModel.didTapReview()
    }
    @IBAction func nextDatePressedBtn(_ sender: UIButton) {
        viewModel.didTapNext()
    }
    @IBAction func previousDatePressedBtn(_ sender: UIButton) {
        viewModel.didTapPrevious()
    }
    
    @IBAction func openMapBtnPressed(_ sender: UIButton) {
        viewModel.didTapViewOnMap()
    }
    @IBAction func bookPressedBtn(_ sender: UIButton) {
        viewModel.didTapBook()
    }
    @IBAction func doctorPorfilePressedBtn(_ sender: UIButton) {
        self.drProfileView.setupDoctorProfileButton()
    }
    @IBAction func reviewsPressedBtn(_ sender: UIButton) {
        self.drProfileView.setupReviewsButton()
    }
}

// MARK:- UICollectionViewDataSource, UICollectionViewDelegate
extension DrProfileVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.appoinmentTimesCount()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let time = viewModel.getAppointmentTimes(at: indexPath.row)
        guard let timeCell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.ID, for: indexPath) as? TimeCollectionViewCell else {
            return UICollectionViewCell()
        }
        timeCell.configure(time: time)
        return timeCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didTapAppointmentTime(at: indexPath.row)
        self.drProfileView.setupBook()
    }
}

// MARK:- UITableViewDelegate, UITableViewDataSource
extension DrProfileVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reviewsCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let review = viewModel.getReviews(at: indexPath.row)
        guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.ID, for: indexPath) as? ReviewTableViewCell else {return UITableViewCell()}
        reviewCell.configure(review: review)
        return reviewCell
    }
}

//MARK:- Conform Protocol
extension DrProfileVC: DrProfileViewControllerProtocol{
    func showResult(state: ResultState) {
        switch state {
        case .found:
            self.drProfileView.showResult()
        default:
            self.drProfileView.showNoResult()
        }
    }
    func openMap(lat: Float, lng: Float) {
        AppUtility.openGoogleMap(lat: lat, lng: lng)
    }
    func showLoader(type: LoaderType) {
        switch type {
        case .profile:
            self.drProfileView.showLoading()
            break
        case .appointments:
            self.drProfileView.appointmentsCollectionView.showLoading()
            break
        
        default:
            self.drProfileView.reviewTableView.showLoading()
            break
        }
    }
    func hideLoader(type: LoaderType) {
        switch type {
        case .profile:
            self.drProfileView.hideLoading()
            break
        case .appointments:
            self.drProfileView.appointmentsCollectionView.hideLoading()
            break
        
        default:
            self.drProfileView.reviewTableView.hideLoading()
            break
        }
    }
    
    func showError(with message: String) {
        self.showCustomAlert(type: .failButton, message: message, title: "Ok", delgate: nil)
    }
    func showVoucher() {
        let voucharVC: VoucharPopVC = VoucharPopVC.create(doctorId: viewModel.getIdDoctor, timeStemp: viewModel.getTimeStemp)
        voucharVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        voucharVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        voucharVC.delegate = self
        voucharVC.delegatePopUps = self
        self.present(voucharVC, animated: true, completion: nil)
    }
    func showConfirm(with message: String) {
        self.showCustomAlert(type: .confirmButton(timeStamp: viewModel.getTimeStemp, docName: viewModel.getNameDoc() ), message: message, title: "", delgate: self)
        self.dismiss(animated: true){
            self.viewModel.booknow()
        }
    }
    func showSuccess(with message: String) {
        self.showCustomAlert(type: .successButton, message: message, title: "Ok", delgate: nil){
            self.dismiss(animated: true){
                self.viewModel.getDrAppointmentsData()
            }
        }
    }
    func goToReviewVC(id: Int) {
        let reviewVC = ReviewVC.create(doctorId: id)
        self.navigationController?.pushViewController(reviewVC, animated: true)
    }
    func setupAppoinmentDate(appointment: AppointmentDate) {
        self.drProfileView.setupAppointmentLabel(appointment: appointment)
    }
    func reloadAppointmentsCollectionView() {
        self.drProfileView.appointmentsCollectionView.reloadData()
        self.drProfileView.setupUnbooked()
        self.drProfileView.appointmentsCollectionView.setContentOffset(.zero, animated: true)
    }
    func reloadReviewTableView() {
        self.drProfileView.reviewTableView.reloadData()
    }
    func setupDrProfile(profile: Doctor) {
        drProfileView.setup(drProfile: profile)
    }
    func showSignin(timeStamp: String, doctorID: Int) {
        let authPopup = SignUpAndLoginPopUpController.create(doctorId: doctorID, appointmentTimeStamp: String(timeStamp))
        authPopup.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        authPopup.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        authPopup.delegate = self as? SignUpAndLoginPopUpDelegate
        self.present(authPopup, animated: true, completion: nil)
    }
}

// MARK:- Private Methods
extension DrProfileVC{
    private func delegates(){
        self.drProfileView.appointmentsCollectionView.delegate = self
        self.drProfileView.appointmentsCollectionView.dataSource = self
        self.drProfileView.reviewTableView.delegate = self
        self.drProfileView.reviewTableView.dataSource = self
    }
    private func setupNavBar(){
        setupNavController()
        setViewControllerTitle(to: "Search Result")
        setupBackButton()
        addSettingsButton()
        setBackgroungImage()
    }
}

extension DrProfileVC: VoucharDelegate{
    func voucharData(code: String, name: String) {
        showCustomAlert(type: .confirmButton(timeStamp: viewModel.getTimeStemp, docName: viewModel.getDoctorName), message: "", title: "Confirm", delgate: self)
    };
    func cancelTapped() {
        let cancel = presentingViewController
        self.dismiss(animated: true, completion: nil)
    }
    func confirmTapped() {
        print("confirm tapped successfully")
    }
}

extension DrProfileVC: TestVCProtocol, DoctorProfilePopUps{
    func continuePresent() {
        _ = AlertViewController.create(type: .confirmButton(timeStamp: viewModel.getTimeStemp, docName: viewModel.getNameDoc()))
    }
    
    func setDataFromDelegate(voucher: String?, patientName: String) {
        viewModelVouchar.doctorBooking(vouchar: voucher ?? "", name: patientName)
    }
}
extension DrProfileVC: SignUpAndLoginPopUpDelegate{
    func getDoctorAppointments() {
//        drProfileView.bookButtonDeselectionState()
//        viewModel.getDoctorAppointmentsWithId()
    }
}

