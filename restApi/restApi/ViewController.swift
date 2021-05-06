//
//  ViewController.swift
//  restApi
//
//  Created by Tardes on 6/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    
    @IBOutlet weak var textId: UILabel!
    
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // LLAMO A MI PROVIDER
        //restApiProvider.shared.self
        txtUsuario.text = ""
        txtEmail.text = ""
        
        //ocultar y parar la animacion
        ActivityIndicator.hidesWhenStopped = true
        ActivityIndicator.stopAnimating()
    }

   
    @IBAction func getUsuarioAction(_ sender: Any) {
        ActivityIndicator.startAnimating()
        
        restApiProvider.shared.getUsuario(id: 55) { (usuario)  in
            // si la peticióm del usuario con id es correcto
            self.ActivityIndicator.stopAnimating()

            self.txtUsuario.text = usuario.nombre
            self.txtEmail.text = usuario.email
            
        } failure: { (error) -> () in
            // Si la peticion no es correcta
            self.ActivityIndicator.stopAnimating()
        }

    }
    
    @IBAction func postAction(_ sender: Any) {
        ActivityIndicator.startAnimating()
        
        let newUsuario = NuevoUsuario(name: "Yen", email: "esteesmimail@gmail.com", gender: "female", status: "Active")
        
        restApiProvider.shared.postUsuario(usuario: NuevoUsuario) { (usuario)  in
            // si la peticióm del usuario con id es correcto
            self.ActivityIndicator.stopAnimating()

            self.txtUsuario.text = usuario.nombre
            self.txtEmail.text = usuario.email
            self.textId.text = usuario.id?.description
            
        } failure: { (error) -> () in
            // Si la peticion no es correcta
            self.ActivityIndicator.stopAnimating()
        }
    }
}

   


