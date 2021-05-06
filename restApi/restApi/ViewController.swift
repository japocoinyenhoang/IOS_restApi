//
//  ViewController.swift
//  restApi
//
//  Created by Tardes on 6/5/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // LLAMO A MI PROVIDER
        //restApiProvider.shared.self
    }

   
    @IBAction func getUsuarioAction(_ sender: Any) {
        restApiProvider.shared.getUsuario(id:18)
    }
}
   


