//
//  VCPosts.swift
//  restapi
//
//  Created by Tardes on 10/5/21.
//

import UIKit

class VCPosts: UIViewController {
    
    var listadoPost = [Post]()
    

   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
       

        // Do any additional setup after loading the view.
    
        restApiProvider.shared.getPosts { (mispost) in
            //si la respuesta es correcta
            
            self.listadoPost = mispost
            
            self.tableView.reloadData()
       
        
        } failure: { (error) in
            //si tenemos un error
        
        }

       

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension VCPosts: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listadoPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var celda = tableView.dequeueReusableCell(withIdentifier: "micelda")
        
        if celda == nil {
            
            celda = UITableViewCell(style: .default, reuseIdentifier: "micelda")
            
        }
        
    
        
        celda?.textLabel?.text = listadoPost[indexPath.row].title
        
        return celda!
    }
    
    
}
