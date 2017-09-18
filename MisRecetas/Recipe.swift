//
//  Recipe.swift
//  MisRecetas
//
//  Created by Cesar Avila on 24/08/17.
//  Copyright © 2017 Cesar Avila. All rights reserved.
//

import Foundation
import UIKit

class Recipe : NSObject{
    
    // ATRIBUTOS DE LA CLASE RECETA
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
    //var isFavourite : Bool = false
    
    // LA VARIABLE DE ARRIBA SE SUTITUIRA POR
    var rating : String = "rating" // LE PONEMOS ESTE NOMBRE POR QUE ASI SE LLAMA LA IMAGEN DE LA CARITA AZUL Y SI SE DA EL CASO DE QUE AUN NO SE VALORA UNA RECETA POR DEFECTO NOS APARECERA LA IMAGEN DE VALORAR LA RECETA, TRUQUITO DE PROGRAMADOR
    
    // CONSTRUSCTOR DONDE SE INICIA SOLO EL NOMBRE DE LA RECETA
    init(name:String, image : UIImage, time: Int, ingredients : [String], steps:[String]){
    self.name = name
    self.image = image
    self.time = time
    self.ingredients = ingredients
    self.steps = steps
    }
    

}
