//
//  ViewController.swift
//  IMC
//
//  Created by Guilherme Santos on 11/04/19.
//  Copyright © 2019 Guilherme Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txWeight: UITextField!
    @IBOutlet weak var txHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(txWeight.text!), let height = Double(txHeight.text!){
            imc = weight / pow(height, 2)
            showResult()
        }
    }
    
    func showResult(){
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobre peso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        lbResult.text = "\(imc.arredonda(casasDecimais: 2)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
}
extension Double {
        /// Arredonda um Double conforme quantidade de casas decimais
        func arredonda(casasDecimais: Int) -> Double {
            var formatacao:String {
                let formatacao = NumberFormatter()
                formatacao.minimumFractionDigits = casasDecimais
                return formatacao.string(from: NSNumber(value: self))!

        }
        return Double(formatacao)!

    }
}
