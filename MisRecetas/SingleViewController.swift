//
//  SingleViewController.swift
//  MisRecetas
//
//  Created by Cesar Avila on 27/08/17.
//  Copyright © 2017 Cesar Avila. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var recipe = Recipe(name: "Tortilla de papatas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time : 20,
                            ingredients: ["patatas","huevos","cebollas"],
                            steps: ["Pelar las patatas y la cebolla","Cortar las patatas y la cebolla y sofreir","Batir los huevos y echarlos durante 1 minuto con el resto"]
        )
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza Margarita",
                        image: #imageLiteral(resourceName: "pizza"),
                        time: 60,
                        ingredients: ["Harina","Levadura","Aceite","Sal","Salsa de tomate","Queso"],
                        steps: ["Hacemos la masa con la harina, levadura aceite y sal",
                                "Dejamos reposar la masa 30 minutos",
                                "Extendemos encima de una bandeja y añadimos el resto",
                                "Hornear durante 20 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso",
                        image: #imageLiteral(resourceName: "hamburguesa"),
                        time: 10,
                        ingredients: ["Pan de hamburguesa", "Tomate","Queso","Lechuga","Care de hamburguesa"],
                        steps: ["Poner la carne al fuego al gusto",
                                "Montar la hamburguesa con sus ingredientes entre los panes"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada César",
                        image: #imageLiteral(resourceName: "ensalada"),
                        time : 15,
                        ingredients: ["Lechuga","Tomates","Cebolla","Pimiento","Salsa César","Pollo"],
                        steps: ["Limpiar todas las verduras y trozearlas",
                                "Cocer el pollo al gusto",
                                "Juntas todos los ingredientes en una ensaladera y servir con salsa César por encima"])
        recipes.append(recipe)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// Agregando un Delegado

extension SingleViewController: UITableViewDataSource{
    // DELEGATES DE TABLAS
    
    // IMPLEMENTAREMOS UNOS METODOS PARA QUE EL VIEW CONTROLLER SEA EL DELEGADO DE DECIR CUANTAS FILAS TIENE QUE TENER LA TABLA Y QUE TIENE QUE CONTENER CADA UNA DE ELLAS
    
    // MARK : UITableViewDataSource
    
    
    // FUNCION PARA DECIR CUANTAS SECCIONES VA A TENER NUESTRA TABLA EN NUESTRO CASO, NUESTRA TABLA TENDRA UNA SOLA SECCION ASI QUE POR ESO LE PONENOS EL RETURN 1, SI FUERAN MAS SECCIONES SE CAMBIA ESE RETURN
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // FUNCION QUE INDICA DADA UNA SECCION CUANTAS FILAS TIENE QUE CONTENER
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    
    // FUNCION QUE HACE QUE APAREZCAN EN LA PANTALLA TODAS Y CADA UNA DE LAS CELDAS
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // LO DE ABAJO NOS INDICA EN QUE FILA ME ENCUENTRO Y EN CONSEUENCIA BUSCAR EN EL ARRAY CUAL DE LAS RECETAS DEBE SER LA QUE BUSQUE
        
        let recipe = recipes[indexPath.row] // ESTA FUNCION NOS DICE EN QUE FILA DE LA TABLA ME ENCUENTRO, Y EN CONSECUENCIA BUSCAR EN EL ARRAY CUAL RECETA ES EN LA QUE ESTOY
        
        // PARA CONFIGURAR LA CELDA EN EL STORYBOARD EN EL ATRIBUTES INSPECTOR PONERLE UN IDENTIFICADOR A LA TABLA
        let cellID = "RecipeCell"
        
        
        // RECUPERAR LA CELDA QUE ESTA EN EL INDEXPATH QUE ESTAMOS CONFIGURARNDO, PARA CONFIGURAR NUESTRA CELDA DEL RECIPECELL.SWIFT DONDE CREAMOS LA IMAGEN Y LOS LABELS DEBEMOS HACER UN PEQUEÑO CAST PARA INDICARLE EN DONDE ESTAN NUESTA CELDA PERSONALIZADA CON EL AS!
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        cell.thumbnailimageView.image = recipe.image
        cell.namelabel.text = recipe.name
        cell.timelabel.text = "\(recipe.time!) min"
        cell.ingredientslabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        //cell.thumbnailimageView.layer.cornerRadius = 48.0 // ESTA FUNCIÓN HACE UNA CAPA CIRCULAR DE 42.0 DE RADIO EN LA IMAGEN
        //cell.thumbnailimageView.clipsToBounds = true  // ESTA FUNCIÓN ELIMINA LO QUE QUEDA FUERA DE LA CAPA CIRCULAR
        
        return cell
    }
    

}
