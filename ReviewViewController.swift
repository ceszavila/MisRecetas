//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by Cesar Avila on 12/09/17.
//  Copyright © 2017 Cesar Avila. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!
    
    // VAMOS A RESCALAR ESE STACKVIEW
    var ratingSelected : String?
    
    // CREANDO IBOULETS PARA CADA BOTON PARA EN VEZ DE ANIMAR EL STACK ANIMEMOS LOS BOTONES DE FORMA INDIVIDUAL
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // VAMOS A CREAR EL EFECTO BLUR EN LA IMAGEN CON UIBLUREFFECT Y EL EFECTO DIFUMINADO SE DEBE ASIGNAR A UNA CLASE DE TIPO IUVISUALEFFECTVIEW
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        // DECIR QUE EL DIFUMINADO SEA DEL MISMO TAMAÑO QUE LA PANTALLA
        blurEffectView.frame = view.bounds
        // DESPUES AL BLUREFFECTVIEW SE LE AGREGA UNA SUBVISTA, se añade una vista encima de la imagen 
        backgroundImageView.addSubview(blurEffectView)
        
        /* EL CÓDIGO QUE ESTA ACONTINUACIÓN SIRVE PARA ANIMAR LOS BOTONES Y QUE PAREZCAN DE LA NADA Y COMO QUE APAREZCAN BROTANDO*/
        /* PARA ESCALAR EL STACKVIEW PRIMERO LO DEBEMOS HACER 0, ENTENDAMOS QUE 0 ES EL TAMAÑO MINIMO, 1 ES TAMAÑO NORMAL, 2 ES TAMAÑO AL DOBLE QUE EL NORMAL*/
        // ESTO CAMBIA EL TAMAÑO DEL STACKVIEW
        
        // ejemplo cuando solo tenemos una sola animación
                //ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        // cuando tenemos dos hacemos lo de la liena 52
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        // MANDAR EL STACKVIEW ABAJO DEL TODO ES DECIR ABAJO DE LA PANTALLA x: va positiva a la derecha y Y: va positiva hacia abajo
        let translation = CGAffineTransform(translationX: 0.0, y: 500)
        
        /*
         
         MARK: CUANDO QUEREMOS UNIR MAS DE UNA ANIMACIÓN A UN OBJETO LO QUE TENEMOS QUE HACER ES CONCATENARLAS
         
         PARA LOGRAR ESO DEBEMOS DECLARAR COMO CONSTANTES A LAS TRANSFORMACIONES ESO SE HACE EN LA LINEA 37 Y 40
         
         */
        
        // AHORA PODEMOS CONCATENARLAS CON LA FUNCION unCGAAFFINTRANSFORM.concatenating(el otro CGAFFINETRASNFORM con el que queremos concatenar)
       // ratingStackView.transform = scale.concatenating(translation)
        
        /* PARA ANIMAR DE FORMA SCALE EL BOTON COMENTAMOS LA ANIMACION DE RAINGSTACKVIEW DE LA LINEA 59 POR QUE HAREMOS LO MISMO PERO AHORA CON LOS BOTONES*/
        
        self.firstButton.transform = scale.concatenating(translation)
        self.secondButton.transform = scale.concatenating(translation)
        self.thirdButton.transform = scale.concatenating(translation)
        }
    
    
    // SOBREESCRIIVIRA EL METODO VIEWDIDAPPEAR PARA HACER UNA TRANSFORMACIÓN AFFINFE
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
      /*  UIView.animate(withDuration: 0.5,delay: 0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
      */
        
        // ANIMACIÖN CON USINGSPRINGDUMPING: ESTA ANIMACIÓN SRIVE PARA QUE APAREZCAN LOS BOTONES Y LAS IMAGINES COMO SI ESTUVIERAN DE REBOTE
            //usingSpringWithDamping: Aqui se muestra el coeficiente de rebote de la animación cunato mas grande es el numero menos rebote tiene
        
            //initialSpringVelocity: Aqui se pone la velocidad inicial del rebote
        
       /* UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
             self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
         */
        //ANIMACIÓN PARA CAMBIAR LA POSICIÓN DE UNA VISTA CON UNA TRASLACIÓN
        
        /*
            PARA ANIMAR LOS BOTONES HE COMENTADO LA ANIMACION DE LA LINEA 77 QUE ERA LA DE LA STACK POR QUE AHORA SE HARA LO MISMO PERO ENVEZ DE QUE SEA CON EL OUTLET DE STACKVIEW SERA CON CADA BOTON
         */
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion:{(success) in // ANIMANDO EL SEGUNDO BOTÓN DENTRO DEL COMPLETION DEL PRIMER BOTON
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion:{(success) in // ANIMANDO EL TERCER BOTÓN DENTRO DEL COMPLETION DEL SEGUNDO BOTON
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                    self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion:nil) // ESTE COMPLETION QUEDA NULO POR QUE YA NO ANIMARA O EJECUTARÁ NADA MAS
            })
        })
        
    }
        
        
        
        
        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    
    /*EN ESTE @IBACTION TENEMOS LOS 3 BOTONES ASOCIADOS,
    CON LAS TECLAS CTR Y JALANDO CON CUALQUIERA DE LAS
    TRES CREAMOS LA ACCION, LOS OTROS DOS SOLO LOS
    AGREGAMOS AL MISMO ACTION JALANDOLOS
     
     PARA DIFERENCIARLOS EN EL SHOW ATTRIBUTES INSPECTOR EN EL PARAMETRO TAG LE PUSIMOS UN TAG DISTINTO A CADA UNO
     */
    @IBAction func ratingPressed(_ sender: Any) {
        // HACEMOS UN SWITCH PARA SABER QUE BOTÓN FUE PULSADO
        // ARRIBA CREAMOS UN STRIGN LLAMADO RATINGSELECTED
        
        switch (sender as AnyObject).tag {
        case 1:
            ratingSelected = "dislike" // ESTOS NOMBRES SON LOS NOMBRES QUE TIENEN LAS IMAGENES SE OCUPAN PARA EN LA FUNCIÓN CLOSE JALAR EN NOMBRE DE LA IMAGEN Y SUSTITUIRLA PARA EL QUE ESTA AHI
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        // FORZAR UN SEGUE PARA PASARLE COMO IDENTIFICADOR UN UNWINDTODETAILVIEW Y EN EL SENDER EL SENDER QUE ES UN BOTÓN CON ESTO FORZAMOS A QUE EL SEGUE REGRESE HACIA LA PANTALLA ANTERIOR Y DEBEMOS MODIFICAR EL CODIGO DE LA FUNCION CLOSE QUE HICIMOS EN EL DESTINATIONVIEWCONTROLLER PARA EL UNWIND DEL BOTON DE CERRAR
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
        
    }
    
    
    
    
    
    
    
    
    
    

}
