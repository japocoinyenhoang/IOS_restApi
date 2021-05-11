//
//  ViewController.swift
//  restApi
//
//  Created by Tardes on 6/5/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    var miid = 30
    
    @IBOutlet weak var txtUsuario: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var textId: UILabel!
    
    
    @IBOutlet weak var editTextID: UITextField!
    @IBOutlet weak var miImage: UIImageView!
    @IBOutlet weak var btnDescargar: UIButton!
    
    @IBOutlet weak var textErrores: UITextView!
    
    @IBOutlet weak var ActivityIndicator:
        UIActivityIndicatorView!
    
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
        
        editTextID.delegate = self
    }

   
    @IBAction func getUsuarioAction(_ sender: Any) {
        ActivityIndicator.startAnimating()
        
        restApiProvider.shared.getUsuario(id: self.miid) { (usuario)  in
            // si la peticióm del usuario con id es correcto
            self.ActivityIndicator.stopAnimating()
            self.txtUsuario.text = usuario.nombre
            self.txtEmail.text = usuario.email
            
        } failure: { (error) -> () in
            // Si la peticion no es correcta
            self.ActivityIndicator.stopAnimating()
            self.textErrores.text = error.debugDescription
        }

    }
    
    @IBAction func postAction(_ sender: Any) {
        ActivityIndicator.startAnimating()
        
        let newUsuario = NuevoUsuario(name: "Yen", email: "esteesmimail@gmail.com", gender: "female", status: "Active")
        
        restApiProvider.shared.postUsuario(usuario: newUsuario) { (usuario)  in
            // si la peticióm del usuario con id es correcto
            self.ActivityIndicator.stopAnimating()
            self.txtUsuario.text = usuario.nombre
            self.txtEmail.text = usuario.email
            self.textId.text = usuario.id?.description
            
        } failure: { (error) -> () in
            // Si la peticion no es correcta
            self.ActivityIndicator.stopAnimating()
            self.textErrores.text = error.debugDescription
        }
    }
    
    @IBAction func putAction(_ sender: Any) {
        //modificar usuarios
        
        ActivityIndicator.startAnimating()
        
        //recoger campos de textfield del usuario
        
        let newUsuario = NuevoUsuario(name: "Yen2", email: "esteesmimail@gmail.com2", gender: "Female", status: "Active")
        
    
        restApiProvider.shared.putupdateUsuario(id: self.miid, usuario: newUsuario) {  (usuario) in
                //si la petición es correcta
                self.ActivityIndicator.stopAnimating()
                self.txtUsuario.text = usuario.nombre
                self.txtEmail.text = usuario.email
                self.textId.text = usuario.id?.description
                
            } failure: { (error) in
                //sila petición no es correcta
                self.ActivityIndicator.stopAnimating()
                self.textErrores.text = error.debugDescription
            }

    }
    
    @IBAction func deleteAction(_ sender: Any) {
        //borrar usuarios
        ActivityIndicator.startAnimating()
        
        restApiProvider.shared.deleteUsuario(id: self.miid) {
            self.ActivityIndicator.stopAnimating()
            
            self.textErrores.text = "Se ha borrado el usuario con ID \(self.miid)"
            self.txtUsuario.text = ""
            self.txtEmail.text = ""
            self.textId.text = ""
            
        } failure: { (error) in
            self.ActivityIndicator.stopAnimating()
            self.textErrores.text = error.debugDescription
        }

    }
    
    @IBAction func descargarACtion(_ sender: Any) {
        btnDescargar.isHidden = true
        miImage.kf.setImage(with: URL(string: "https://sites.google.com/site/uniondefilologos/_/rsrc/1493319797353/what-the-hell-does-ok-stand-for/ok3.jpg"))
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        miid = Int(editTextID.text!) ?? 0
        print(miid)
    }
    
    
}



   


