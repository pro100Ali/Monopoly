//
//  IntroViewController.swift
//  Monopoly
//
//  Created by Али  on 21.02.2023.
//



import UIKit
import SnapKit

class IntroViewController: UIViewController, UITextFieldDelegate {
    var count = 1
    static var san = 0
    var arrayOfNames = [String]()
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == countPlayer {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
            
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    var playerTextField2: UITextField = {
        var player = UITextField()
        player.placeholder = "How many players from 1 to 8"
        player.textAlignment = .center;
        player.backgroundColor = .red
        return player
    }()
    
    @objc func listOfTheTextFields(count: Int) {
        guard let  val = Int(countPlayer.text ?? "2") else { return }
        IntroViewController.san = val
        for i in 1...val {
            let playerTextField = UITextField(frame: CGRect(x: 20, y: 100 + (i-1)*50, width: 200, height: 30))
            playerTextField.placeholder = "Player \(i) name"
            
            print(arrayOfNames)
            view.addSubview(playerTextField)
            view.addSubview(buttonForStart)
            
            if i == val {
                buttonForStart.snp.makeConstraints { make in
                    make.top.equalTo(playerTextField.snp.bottom).offset(40)
                    make.width.equalTo(70)
                    make.leading.equalTo(playerTextField).offset(20)
                }
            }
        }
        buttonForSubmitting.isHidden = true
        countPlayer.isHidden = true
        
    }
    
    @objc func start() {
        let newViewController = ViewControllerTable()
        self.navigationController?.pushViewController(newViewController, animated: true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(buttonForSubmitting)
        view.addSubview(countPlayer)
        setupConstraints()
        countPlayer.delegate = self
        
       
    }
    
    private var countPlayer: UITextField =  {
        let text = UITextField()
        text.placeholder = "How many players from 1 to 8"
        text.textAlignment = .center;

        return text
    }()
    
    var buttonForSubmitting: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitle("Roll it", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(listOfTheTextFields), for: .touchUpInside)
        return button
    }()
    
    var buttonForStart: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(start), for: .touchUpInside)
        return button
    }()
    
    

    func setupConstraints() {
        countPlayer.snp.makeConstraints { make in
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.9)
            make.center.equalToSuperview()
        }
        buttonForSubmitting.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.top.equalTo(countPlayer.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        playerTextField2.snp.makeConstraints { make in
            make.width.equalTo(20)
        }
       
    }
}
