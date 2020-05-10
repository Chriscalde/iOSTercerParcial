//
//  DatosViewController.swift
//  Tercer Parcial
//
//  Created by Christian Calderón on 10/05/20.
//  Copyright © 2020 Christian Calderón. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class DatosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dImg: UIImageView!
    
    @IBOutlet weak var dName: UILabel!
    @IBOutlet weak var dFName: UILabel!
    @IBOutlet weak var dMName: UILabel!
    @IBOutlet weak var dAdd: UILabel!
    @IBOutlet weak var dLat: UILabel!
    @IBOutlet weak var dLon: UILabel!
    @IBOutlet weak var dBlood: UILabel!
    @IBOutlet weak var dBImg: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        AF.request("http://www.mocky.io/v2/5eb87c752d00003e2b357d06")
        .validate()
            .responseDecodable(of: DatosElement.self) { (response) in
            guard let datosElements = response.value else {
                print(response)
                return
            }
            DispatchQueue.main.async {
                self.dName.text = datosElements.name
                self.dFName.text = datosElements.fName
                self.dMName.text = datosElements.mName
                self.dAdd.text = datosElements.address
                self.dLat.text = datosElements.lat
                self.dLon.text = datosElements.lon
                self.dBlood.text = datosElements.blood
                let urlImage = URL(string: datosElements.image!)
                self.dImg.kf.setImage(with: urlImage)
                switch datosElements.blood{
                case let str where str!.contains("AB"):
                    self.dBImg.backgroundColor = UIColor.black
                    break
                case let str where str!.contains("A"):
                    self.dBImg.backgroundColor = UIColor.blue
                    break
                case let str where str!.contains("B"):
                    self.dBImg.backgroundColor = UIColor.green
                    break
                case let str where str!.contains("O"):
                    self.dBImg.backgroundColor = UIColor.red
                    break
                case .none:
                    self.dBImg.backgroundColor = UIColor.gray
                case .some(_):
                    self.dBImg.backgroundColor = UIColor.gray
                }
    }
    
}

}
}
