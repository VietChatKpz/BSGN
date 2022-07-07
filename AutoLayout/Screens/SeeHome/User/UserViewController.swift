//
//  UserViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 28/05/2022.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var nameView: UserCustomView!
    @IBOutlet weak var firstName: UserCustomView!
    @IBOutlet weak var phoneView: UserCustomView!
    @IBOutlet weak var emailView: UserCustomView!
    @IBOutlet weak var streetView: UserCustomView!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var districTF: UITextField!
    @IBOutlet weak var xaTF: UITextField!
    @IBOutlet weak var mauTF: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var userScrollView: UIScrollView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var namView: UIView!
    @IBOutlet weak var nuView: UIView!
    @IBOutlet weak var namImg: UIImageView!
    @IBOutlet weak var namLabel: UILabel!
    @IBOutlet weak var nuLabel: UILabel!
    @IBOutlet weak var nuImg: UIImageView!
    
    let dateLabel = UILabel()
    
    var user: UserAPI?
    var location: LocationAPI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyBoard()
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        }
        //setDatePicker()
        fetchPatientNewFeed()
        nameView.nameLabel.text = "Tên *"
        firstName.nameLabel.text = "Họ *"
        phoneView.nameLabel.text = "Số điện thoại"
        emailView.nameLabel.text = "Email"
        streetView.nameLabel.text = "Địa chỉ nơi ở"
        nameView.textField.placeholder = "Nhập tên của bạn"
        firstName.textField.placeholder  = "Nhập họ của bạn"
        phoneView.textField.placeholder  = "Nhập số điện thoại của bạn"
        emailView.textField.placeholder = "Nhập email của bạn"
        streetView.textField.placeholder = "Nhập nơi thường trú của bạn"

        cityTF.isUserInteractionEnabled = false
        districTF.isUserInteractionEnabled = false
        xaTF.isUserInteractionEnabled = false
        mauTF.isUserInteractionEnabled = false
        dateTF.isUserInteractionEnabled = false
        namView.isUserInteractionEnabled = false
        nuView.isUserInteractionEnabled = false
    }
    
    
    
    @objc func fetchPatientNewFeed() {
        APIUtilities.requestUser { [weak self] patientUser, error in
            
            guard let self = self else {return}
            guard let patientUser = patientUser, error == nil else {
                return
            }
            
            self.user = patientUser
            self.locationFeed()
            DispatchQueue.main.async {
                self.nameView.textField.text = patientUser.name ?? ""
                self.firstName.textField.text = patientUser.last_name ?? ""
                self.dateTF.text = patientUser.birth_date ?? ""
                self.phoneView.textField.text = patientUser.phone ?? ""
                self.emailView.textField.text = patientUser.contact_email ?? ""
                if patientUser.sex == 1 {
                    self.segmentedControl.selectedSegmentIndex = 1
                    self.nuImg.tintColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
                    self.nuLabel.textColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
                    self.namLabel.textColor = UIColor(red: 0.28, green: 0.29, blue: 0.34, alpha: 1.00)
                    self.namImg.tintColor = UIColor(red: 0.28, green: 0.29, blue: 0.34, alpha: 1.00)
                }else {
                    self.namImg.tintColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
                    self.namLabel.textColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
                    self.nuLabel.textColor = UIColor(red: 0.28, green: 0.29, blue: 0.34, alpha: 1.00)
                    self.nuImg.tintColor = UIColor(red: 0.28, green: 0.29, blue: 0.34, alpha: 1.00)
                    self.segmentedControl.selectedSegmentIndex = 0
                }
                self.mauTF.text = patientUser.blood_name ?? ""
                self.streetView.textField.text = patientUser.full_address ?? ""
            }
        }
    }
    
    @objc func locationFeed(){
        APIUtilities.requestLocation(textProvi: user?.province_code, textDis: user?.district_code, war: user?.ward_code) { [weak self] patientLocation, error in
            
            guard let self = self else {return}
            guard let patientLocation = patientLocation, error == nil else {
                return
            }
            self.location = patientLocation
            
            self.cityTF.text = patientLocation.province_name ?? ""
            self.districTF.text = patientLocation.district_name ?? ""
            self.xaTF.text = patientLocation.ward_name ?? ""
        }
    }
    
    func setDatePicker() {
        // set kiểu ngày tháng cho datePicker
        datePicker.datePickerMode = .date
        // gán datePicker cho textField
        dateTF.inputView = datePicker
        // Set ngày mặc định khi hiển thị
        datePicker.setDate(Date(), animated: true)
        
        //  khởi tạo toolBar, toolBar.sizeToFit là các thành phần nằm trong nó tự dãn theo đúng kích thước width
        let toolBar = UIToolbar()
        dateTF.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        
        dateLabel.text = "Chọn ngày sinh"
        
        // khai báo các thành phần trong toolBar (button,label)
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneDateAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let label = UIBarButtonItem(customView: dateLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        // set các thành phần vào toolBar
        toolBar.setItems([cancelButton, spaceButton, label, spaceButton, doneButton], animated: false)
        
        // add hành động datepicker
        datePicker.addTarget(self, action: #selector(valueChangeDatePicker), for: UIControl.Event.valueChanged)
    }
    
    @objc func valueChangeDatePicker() {
        dateLabel.text = ConvertHelper.stringFromDate(date: datePicker.date, format: "dd/MM/yyyy")
        dateLabel.sizeToFit()
    }
    
    @objc func doneDateAction() {
        dateTF.text = ConvertHelper.stringFromDate(date: datePicker.date, format: "dd/MM/yyyy")
        self.view.endEditing(true)
    }
    
    @objc func cancelAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func segmentButton(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0
        {
            namImg.tintColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
            namLabel.textColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
            nuLabel.textColor = UIColor(red: 0.28, green: 0.29, blue: 0.34, alpha: 1.00)
            nuImg.tintColor = UIColor(red: 0.28, green: 0.29, blue: 0.34, alpha: 1.00)
            
        }else {
            nuImg.tintColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
            nuLabel.textColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
            namLabel.textColor = UIColor(red: 0.28, green: 0.29, blue: 0.34, alpha: 1.00)
            namImg.tintColor = UIColor(red: 0.28, green: 0.29, blue: 0.34, alpha: 1.00)
            
        }
    }
    
    @IBAction func onPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func dateOnPress(_ sender: Any) {
        //        setDatePicker()
    }
}

//MARK: Dùng Tag
/*
 Gọi view.superView.subView
 Dùng for duyệt tag
 if let lb = subview as! UILabel...
 */
