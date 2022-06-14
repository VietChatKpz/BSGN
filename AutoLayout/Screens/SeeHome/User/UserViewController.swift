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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var namView: UIView!
    @IBOutlet weak var nuView: UIView!
    
    let dateLabel = UILabel()
    
    var user: userAPI?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyBoard()
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        }
        setDatePicker()
        fetchPatientNewFeed()
        
        
    }
    
    @objc func fetchPatientNewFeed() {
        APIUtilities.requestUser { [weak self] patientNewFeed, error in
            
            guard let self = self else {return}
            guard let patientNewFeed = patientNewFeed, error == nil else {
                return
            }
            self.user = patientNewFeed
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        nameTextField.text = user?.name ?? ""
        fullNameTextField.text = user?.last_name ?? ""
        dateTF.text = user?.birth_date ?? ""
        phoneTF.text = user?.phone ?? ""
        emailTF.text = user?.contact_email ?? ""
        if user?.sex == 1 {
            print(user?.sex)
            segmentedControl.selectedSegmentIndex = 0
        }else {
            segmentedControl.selectedSegmentIndex = 1
        }
    }
    
//    func setUp(name: String?) {
//        nameTextField.text = name
//    }
//
//    func setUp1(user: userAPI){
//        let name = user.name
//
//        setUp(name: name)
//    }
        
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
            print("1")
            namView.backgroundColor = .brown
            nuView.backgroundColor = .clear
//            namView.isHidden = false
//            nuView.isHidden = true
        }else {
            nuView.backgroundColor = .clear
            namView.backgroundColor = .brown
            print("2")
//            namView.isHidden = true
//            nuView.isHidden = false
        }
    }
        
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func dateOnPress(_ sender: Any) {
        //        setDatePicker()
    }
}
