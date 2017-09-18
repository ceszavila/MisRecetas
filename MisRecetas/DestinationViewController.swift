//
//  DestinationViewController.swift
//  MisRecetas
//
//  Created by Cesar Avila on 31/08/17.
//  Copyright © 2017 Cesar Avila. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {

    @IBOutlet var recipeImageView: UIImageView!

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var ratingButton: UIButton!
    
    var recipe : Recipe!
    
    // DONDE CONFIGURAMOS LA VISTA CADA VEZ QUE ARRANCA
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CON ESTA LINEA DE CÓDIGO LE ESTAMOS PONIENDO A LA BARRA DE NAVEGACIÓN DONDE SALE LA FLECHA DE ATRAS COMO TITULO EL NOMBRE DE LA RECETA QUE SELECCIONAMOS
        self.title = recipe.name
        
   // Do any additional setup after loading the view.
        
    // HACER QUE LA RECIPEIMAGEVIEW TENGA ASIGANDA POR DEFECTO LA IMAGEN DE LA RECETA
        
    self.recipeImageView.image = self.recipe.image
        
    // CAMBIANDO EL COLOR DE LA TABLA
    self.tableView.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
    // ELIMINAR LAS SEPARACIONES ENTRE LAS CELDAS A UNA VISTA SIN TAMAÑO O ELIMINAR TODO LO QUE SE MUESTRA DEBAJO DE LA ULTIMA CELDA
    self.tableView.tableFooterView = UIView(frame: CGRect .zero) // todo lo que viene despues de la ultima celda no tendra tamaño
    // cambiar el separador por otro de otro color
    self.tableView.separatorColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
    // AÑADIR DOS FRASES CONCRETAS PARA HACER LA CELDAS AUTOAJUSTABLE, CON ESTAS DOS LINEAS DE CODIGO LE DECIMOS AL TABLEVIEW QUE CALCULE EL TAMAÑO EXCATO DE CADA CELDAS DE SU CONTENIDO Y LO RENDERIZE DINAMICAMENTE
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        // añadir para inicializar la imagen 
        let image = UIImage(named: self.recipe.rating)
        self.ratingButton.setImage(image, for: .normal)
     
    }
    // TENEMOS QUE AÑADIR ESTA LINEA PARA QUE APAREZCA LA BARRA DE ESTADO CADA VEZ QUE SE LLAMA CUANDO VA A APARECER
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true) // LLAMAR PRIMERO AL SUPER
        navigationController?.hidesBarsOnSwipe = false // HACEMOS EL CASO CONTRARIO PARA QUE NO NO OCULTE LA BARRA POR QUE SI NO, NO PODEMOS VOLVER ATRAS
        navigationController?.setNavigationBarHidden(false, animated: true) // AQUI SE LE DICE A SWIFT SI ESTABA OCULTA LA BARRA APARECELA 
    }
    
    // AÑADIR EL METODO PrefersStatusBarHidden:Bool{} para ocultar la barra de estado
    override var prefersStatusBarHidden:Bool{
        return true
    }
    

    
    // Creando unwind para el boton de cerrar
    @IBAction func close(segue: UIStoryboardSegue){
        
        /* EL CODIGO DE ABAJO ESTA HECHO PARA EL SEGUE FORAZADO QUE HICIMOS DENTRO DEL IBACTION RATINGPRESSED DE LOS BOTONES DE VALORIZAR RECETA*/
        
        /* COMO LLEGA UN SEGUE POR PARAMETRO DEL VIEWCONTROLLER PRINCIPAL. SI LO QUE LLEGA AL METODO CLOSE ES NI MAS NI MENOS QUE EL REVIEWVIEWCONTROLLER DEBEMOS RECUPERAR LA IMAGEN DEL RATINGVIEWCONTROLLER QUE SE PRESIONO*/
        
        if let reviewVC = segue.source as? ReviewViewController{
            
            // PARA LA PATE DE MARCAR FAVORITO O NO , ANTES DE JUGAR OCN EL TEXTO DEL BOTON SE LO DEBEMOS ASIGNAR A LA PROPOA RECETA
            if let rating = reviewVC.ratingSelected{
                 self.recipe.rating = rating // rating es el string que declaramos en la clase recipe en vez de la de isFavourite y el rating es el parametro de la funcion
                /* AHORA VAMOS A SUSTITUIR LA IMAGEN DE RATING(CARITA AZUL) POR LA IMAGEN DE LA CARITA QUE HA SIDO SELECCIONADA.
                 
                    PARA ESO PUSIMOS EN LA FUNCION RATINGPRESED DEL REVIEWVIEWCONTROLLER QUE EL STRIGN RATINGSELECTED SEA EL MISMO NOMBRE DE LA IMAGEN SEGUN SEA EL CASO PARA ASI PODER JALAR LA IMAGEN Y SUSTITUILA EN LA DE LA CARITA AZUL CON LA FUNCION SETIMAGE COMO SE VE AQUI ABAJO
                */
                let image = UIImage(named: self.recipe.rating)
                self.ratingButton.setImage(image, for: .normal)
            }
        
        }
        
    }
  
        
}



extension DestinationViewController : UITableViewDataSource {
     func numberOfSections(in tableView: UITableView) -> Int {
        // DEFINO NUMERO DE SECCIONES QUE QUIERO
        /* SON 3 POR QUE:
            UNA ES PARA EL NOMBRE, TIEMPO Y SI ES FAVORITA
            OTRA ES PARA LOS INGREDIENTES
            Y OTRA ES PARA LOS PASOS*/
        return 3
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // AQUI SE DEFINE EL NUMERO DE CELDAS O FILAS QUE QUIERO TENER PARA QUE SE VEAN EN LA APLICACION
        
        switch section {
        case 0: // CASO PARA LA SECCION DE NOMBRE TIEMPO Y FAVORITO
            return 2
        case 1:
            return self.recipe.ingredients.count // CASO PARA LA SECCION DE INGREDIENES
        case 2:
            return self.recipe.steps.count // CASO PARA LA SECCION DE PASOS
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ESTO ES PARA LA TABLA DEL SEGUNDO VIEWCONTROLLER (EL QUE TIENE LA IMAGEN Y LAS TABLAS), ESTAMOS CNFIGURANDO LA TABLA
        // LO SIGUIENTE ESTARIA BIEN QUE LA TABLA MOSTRARA EL NOMBRE DE LA RECETA, EL TIEMPO D CONCION Y SI ES MI FAvORITA O NO
        
        // celda en abstracto
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailTableViewCell
        
        cell.backgroundColor = UIColor.clear // QUITANDO EL COLOR DE LAS CELDAS PERSONALIZADAS PARA QUE EL COLOR QUE DEFINIMOS ARRRIBA SEA EL QUE SE VEA 
        
        
        // AHORA TENEMOS QUE HACER UN SWITCH PARA INDICAR QUE PARTES DEL CODIGO SON PARA QUE SECCION
        switch indexPath.section {
        case 0: // CASO DE SECCION 1
            // UN SWITCH DE INDEXPATH.ROW POR QUE COMO HE INDICADO QUE QUIERO 3 CELDAS ME PUEDEN LLEGAR LA 1,2 Ó 3
            switch indexPath.row {
            case 0:
                // EN LA PRIMERA CELDA DE LA TABLA SE MUESTRA EL NOMBRE
                cell.keylabel.text = "Nombre:"
                cell.valueLabel.text = self.recipe.name!
            case 1:
                // SEGUNDA CELDA MOSTRARA EL TIEMPO
                cell.keylabel.text = "Tiempo:"
                cell.valueLabel.text = "\(self.recipe.time!) minutos"
           /* case 2:
                // EN LA TERCERA SE MOSTRARA SI ES FAVORITA O NO
                cell.keylabel.text = "Favorita:"
                if self.recipe.isFavourite{
                    cell.valueLabel.text = "Sí"
                }else{
                    cell.valueLabel.text = "No"
                }*/
            default:
                break
            }
        case 1:
            if indexPath.row == 0{
                cell.keylabel.text = "Ingredietes" // SOLO EL INDEXPATH EN LA POSICIÓN NUMERO 0 MOSTRARA LA PALABRA INGREDIENTES O LA PALABRA PASOS
            } else{
                cell.keylabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row] // PONIENDO LOS INGREDIENTES
        case 2:
            if indexPath.row == 0{
                cell.keylabel.text = "Pasos"
            } else{
                cell.keylabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
    return cell
    }
    
    // FUNCION PARA PONER TITULOS A CADA SECCION
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        return title
    }
}

extension DestinationViewController : UITableViewDelegate{
}
