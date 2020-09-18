//
//  ViewController.swift
//  Guia03-2
//
//  Created by UserMac on 8/17/20.
//  Copyright © 2020 Ricardo Sibrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let  avateres = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5"]
    
    @IBOutlet weak var tipoSegmented: UISegmentedControl!
    @IBOutlet weak var edadSlider: UISlider!
    @IBOutlet weak var registetButton: UIButton!
    @IBOutlet weak var noti: UISwitch!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var vsLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatarImageView.image=UIImage(named: getRandomAvatarName())
        
    }
    @IBAction func sliderChange(_ sender: UISlider) {
        vsLabel.text = String(Int(sender.value))
    }
    @IBAction func avatarButton(_ sender: Any) {
        self.avatarImageView.image=UIImage(named: getRandomAvatarName())
    }
    @IBAction func registerAccount(_ sender: Any) {
        let tipoIndex = self.tipoSegmented.selectedSegmentIndex
        let tipo : String = self.tipoSegmented.titleForSegment(at: tipoIndex)!
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {[weak self] in
            let dialogMessage="Gracias \(self?.nameTextField.text ?? ""), tipo de cuenta: \(tipo), edad: \(self?.vsLabel.text ?? ""), se ha enviado un correo de confirmacion a \(self?.emailTextField.text ?? "")"
            let alertController=UIAlertController(title:"Registro Exitoso" , message: dialogMessage , preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title:"ok",style:.default))
            self?.present(alertController,animated: true, completion: nil)
        }
        
    }
    @IBAction func notifications(_ sender: Any) {
        registetButton.isEnabled=noti.isOn
    }
    private func getRandomAvatarName() -> String{
        let randomArrayIndex = Int(arc4random_uniform(UInt32( avateres.count)))
        return self.avateres[randomArrayIndex]
    }
}

