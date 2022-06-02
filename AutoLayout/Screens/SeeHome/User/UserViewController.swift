//
//  UserViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 28/05/2022.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var districTF: UITextField!
    @IBOutlet weak var xaTF: UITextField!
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var mauTF: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var userScrollView: UIScrollView!
    
    let dateLabel = UILabel()
    
    var newFeed: PatientNewFeedModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyBoard()
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        }

    }
    
    @objc func fetchPatientNewFeed() {
//        self.showLoaderView()
        APIUtilities.requestHomePatientFeed(APIURL: "/hdhuy179/7883b8f11ea4b25cf6d3822c67049606/raw/Training_Intern_BasicApp_UserInfo"){ [weak self] patientNewFeed, error in
                        
            guard let self = self else { return}
//            self.dismissLoaderView()

            guard let patientNewFeed = patientNewFeed, error == nil else {
                return
            }

            self.newFeed = patientNewFeed

        }
    }

    func setUp(user: userAPI?) {
        let name = user?.name
        
        configUser(name: name)
    }
    
    private func configUser(name: String?) {
        nameTextField.text = name ?? ""
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
    }
    
    @objc func cancelAction() {
        self.view.endEditing(true)
    }

    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func dateOnPress(_ sender: Any) {
        setDatePicker()
    }
}
