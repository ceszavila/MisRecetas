//
//  ViewController.swift
//  MisRecetas
//
//  Created by Cesar Avila on 23/08/17.
//  Copyright © 2017 Cesar Avila. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet var uitable: UITableView!
    
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PARA CAMBIARLE EL TEXTO DEL BOTÓN ATRAS O PERSONALIZARLO DEL VIEWCONTROLLER DONDE SE VEN LAS RECETAS Y LOS PASOS DE LA RECETA USAMOS LA SIGUIENTE LINEA DE CÓDIGO
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        // OCULTAR LA BARRA DE ESTADO UNA VEZ QUE HACEMOS UN SWIPE O UN SCROLL QUE SE HAGA CHIQUITA COMO EN SAFARI
        // Y AÑADIMOS UNA LINEA DE CODITOGO EN EL DESTIANTIONVIEWCONTROLLER.SWIFT QUE HACE QUE APAREZCA LA VISTA DE LA BARRA DE ESTADO CADA VEZ QUE VA A APARECER CON LA FUNCION ViewWillAppear
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ESTA FUNCION ES PARA QUITAR LA BARRA DE ESTADO AL MOMENTO DE ABRIR LA APP DE RECETAS
    
    override var prefersStatusBarHidden: Bool {
        return true
    }  
    
    // DELEGATES DE TABLAS
    
    // IMPLEMENTAREMOS UNOS METODOS PARA QUE EL VIEW CONTROLLER SEA EL DELEGADO DE DECIR CUANTAS FILAS TIENE QUE TENER LA TABLA Y QUE TIENE QUE CONTENER CADA UNA DE ELLAS
    
    // MARK : UITableViewDataSource
    
    
    // FUNCION PARA DECIR CUANTAS SECCIONES VA A TENER NUESTRA TABLA EN NUESTRO CASO, NUESTRA TABLA TENDRA UNA SOLA SECCION ASI QUE POR ESO LE PONENOS EL RETURN 1, SI FUERAN MAS SECCIONES SE CAMBIA ESE RETURN
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // FUNCION QUE INDICA DADA UNA SECCION CUANTAS FILAS TIENE QUE CONTENER
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    // FUNCION QUE HACE QUE APAREZCAN EN LA PANTALLA TODAS Y CADA UNA DE LAS CELDAS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // LO DE ABAJO NOS INDICA EN QUE FILA ME ENCUENTRO Y EN CONSEUENCIA BUSCAR EN EL ARRAY CUAL DE LAS RECETAS DEBE SER LA QUE BUSQUE
        
        let recipe = recipes[indexPath.row] // ESTA FUNCION NOS DICE EN QUE FILA DE LA TABLA ME ENCUENTRO, Y EN CONSECUENCIA BUSCAR EN EL ARRAY CUAL RECETA ES EN LA QUE ESTOY
        
        // PARA CONFIGURAR LA CELDA EN EL STORYBOARD EN EL ATRIBUTES INSPECTOR PONERLE UN IDENTIFICADOR A LA TABLA
        let cellID = "RecipeCell"
        
        
        // RECUPERAR LA CELDA QUE ESTA EN EL INDEXPATH QUE ESTAMOS CONFIGURARNDO, PARA CONFIGURAR NUESTRA CELDA DEL RECIPECELL.SWIFT DONDE CREAMOS LA IMAGEN Y LOS LABELS DEBEMOS HACER UN PEQUEÑO CAST PARA INDICARLE EN DONDE ESTAN NUESTA CELDA PERSONALIZADA CON EL AS!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        cell.thumbnailimageView.image = recipe.image
        cell.namelabel.text = recipe.name
        cell.timelabel.text = "\(recipe.time!) min"
        cell.ingredientslabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        
        
        // DEL METODO DE HASTA ABAJO DONDE DEFINIMOS SI ES FAVORITA O NO, PARA VERLO EN PANTALLA EN LA TABLA EN EL CELL PUSIMOS UN ACCESORY DE TIPO CHECKMARK Y AQUI LE ESTAMOS DICIENDO QUE SOLAMENTE CUANDO SE MARQUE COMO FAVORITA LA RECETA NOS APAREZCA EN LA CELDA EL ACCESORYTYPE
       /* if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none // SI NO ES FAVORITA QUE EL ACCESORYTYPE SEA NONE
        }*/
        
        //cell.thumbnailimageView.layer.cornerRadius = 48.0 // ESTA FUNCIÓN HACE UNA CAPA CIRCULAR DE 42.0 DE RADIO EN LA IMAGEN
        //cell.thumbnailimageView.clipsToBounds = true  // ESTA FUNCIÓN ELIMINA LO QUE QUEDA FUERA DE LA CAPA CIRCULAR
        
        return cell
    }
    
    /* Este es un delegate que nos permite editar celdas, deslizar para borrar
     Dada una tableView ejecutaremos una edición en un idexpath completo
     */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        /*Hay que comprobar primero en editingstyle que tiene el .delete el punto .insert y el none*/
        // Aqui lo esta borrando el modelo de datos no la vista
        if editingStyle == .delete{
            self.recipes.remove(at: indexPath.row) // Aqui lo esta borrando el modelo de datos no la vista
            self.tableView.deleteRows(at: [indexPath], with: .fade) // Funcion que borra la fila del indexpath que esta seleccionado
        }
        
    }
    
    
    // ESTE MÉTODO QUE NOS DEJA AÑADIR ACCIONES AL DESLIZAR UNA FILA DE LA TABLA 
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // AGREGANDO LA OPCION DE COMPARTIR A LA FILA
        let shareAction = UITableViewRowAction(style: .normal, title: "Share") { (action, indexPath) in
            
            // USAREMOS UN ACTIVITYVIEWCONTROLLER PARA PODER COMPARTIR
            
            let shareDefaultText = "Estoy compartiendo la receta de : \(self.recipes[indexPath.row].name!) en la App del curso de iOS 10 con Juan Gabriel"
            
            // Añadir o mostrarlo al usuario
            
            /* The UIActivityViewController class is a standard view controller that you can use to offer various services from your application. The system provides several standard services, such as copying items to the pasteboard, posting content to social media sites, sending items via email or SMS, and more.
             */
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image], applicationActivities: nil)
            
            // presentar el activity controller en pantalla
            
            self.present(activityController, animated: true , completion: nil)
        }
        
            // cambiando o eligiendo el color del botón de compartir
            shareAction.backgroundColor = UIColor(colorLiteralRed: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        // AGREGANDO LA OPCIÓN DE BORRAR A LA FILA
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row) // Aqui lo esta borrando el modelo de datos no la vista
            self.tableView.deleteRows(at: [indexPath], with: .fade) // Funcion que borra la fila del indexpath que esta seleccionado
            
        }
           // cambiando o eligiendo el color del botón de borrar
        deleteAction.backgroundColor = UIColor(colorLiteralRed: 202.0/255.0, green: 202.0/255, blue: 202.0/255.0, alpha: 1.0)
        
        
        
       /* // CREANDO OTRO BOTÓN NADA MAS DE PRACTIA
        // AGREGANOD LA OPCIÓN DE IR EN LA FILA
        let goAction = UITableViewRowAction(style: .normal, title: "Go") { (action, indexPath) in
            // USAREMOS EÑ ACTIVITYVIEWCONTROLLER PARA IR AL MAPA
            let gotoAction = "Go to \(self.recipes[indexPath.row].name!)"
            
            let gotoController = UIActivityViewController(activityItems: [gotoAction], applicationActivities: nil)
            
            // PRESENTANDO EL ACTIVITY CONTROLLER A LA PANTALLA
            
            self.present(gotoController, animated: true, completion: nil)
        }*/
        
        return [shareAction,deleteAction]
        
    }
    
    
    // MARK: UITABLEVIEWDELEGATE
    
    // METODO QUE NOS DICE QUE FILA A SIDO SELECCIONADA, RECORDEMOS QUE INDEXPATH TIENE DOS PARAMETROS INDEXPATH.SECTION E INDEXPATH.ROW
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        /*
        // indicar en el titulo de la alerta el nombre del plato asi que nos quedaremos con el nombre de la recta
        let recipe = self.recipes[indexPath.row]
        
        // Creando un botón de alerta tipo actionsheet
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .actionSheet)
        // creando el boton al actionsheet recordemos que las alertas no tienen botones asi que los tenemos que crear
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        // Para cambiar el texto del favouriteAction para cuando la queramos poner en favorita diga favorita y cuando no sea favorita diga que no es favorita debemos hacer un if else
        
        // Cuando el texto del alert diga favorito lo pondremos en el style:.default y cuando diga no favorito lo pondremos en style:.destuctive
        
        
        var favouriteActionTitle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite {
            favouriteActionTitle = "No Favorito"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            /* clousures, todo lo que eta action desde el {(action) ... nos indica que es lo que pasara despues de presionar el botón "favorito"
             ¿Que debemos de hacer?
             Debemos recuperar la receta que esta en el indexpath en cuestion e indicar que es mi favorita
             */
            let recipe = self.recipes[indexPath.row]
            
            // Si es favorita la ponemos como no favorita y si no es favorita la ponemos como favorita
            recipe.isFavourite = !recipe.isFavourite
            
            // DESPUES DE HABER CAMBIADO EL ESTADO DE LA RECETA TENGO QUE INDICARLE A TODA LA TABLA QUE SE REFRESQUE TODA LA TABLEVIEW
            self.tableView.reloadData()
 
            
        }
        // Una vez que tenemos la accion creada falta añadirla al controlador
        alertController.addAction(favouriteAction)
        
        // ahora tenemos que agregar el botón a la alerta
        
        alertController.addAction(cancelAction)
        
        // Una vez creado el controlador solo falta presentarlo 
        
        self.present(alertController, animated: true, completion: nil)
     */   
    }
    
    // PROGRAMAR PARA QUE EL SEGUE PASE SABIENDO QUE CELDA ESTA PULSADA, EL SEGUE PASA A LA OTRA VISTA
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // ASSEGURARNOS DE QUE SI SEA EL SEGUE QUE QUEREMOS CON EL IDENTIFICADOR QUE LE PUSIMOS AL SEGUE
        if segue.identifier == "showRecipeDetail"{
            // AHORA HAY QUE DECIRLE QUE CELDA HA SIDO SELECCIONADA Y RECUPERAR EL IDNEXPATH SELECCIONADO
            // EN CASO DE QUE EL INDEXPATH SELECCIONADO EN CONCRETO, VA A SER UNA VARIABLE ASIGNADA DE TIPO INDEXPATH, SI NO SE SELECCIONA NADA ESTA VARIABLE SERA NULA Y NO SE EJECUTARA ESTE SEGMENTO DE CODIGO
            if let indexPath = self.tableView.indexPathForSelectedRow {
                // SELECCIONAREMOS LA RECETA
                let selectedRecipe = self.recipes[indexPath.row]
                // DECIR QUIEN ES EL VIEW CONTROLLER DE DESITNO Y ESTO LO SABE EL SEGUE CON EL DESTINATION ASI QUE TENEMOS QUE HACER UN CASTING Y SAIGNAR LA VARIABLE RECIPE QUE SE CREO EN EL DESTINATIONVIEWCONTROLLER TIENE QUE SER NI MAS NI MENOS QUE LA RECETA SELECCIONADA DEL INDEXPATH QUE HABIA LLEGADO
                let destinationViewController = segue.destination as! DestinationViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
}
