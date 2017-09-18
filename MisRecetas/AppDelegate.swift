//
//  AppDelegate.swift
//  MisRecetas
//
//  Created by Cesar Avila on 23/08/17.
//  Copyright © 2017 Cesar Avila. All rights reserved.
// Esta Linea es del primer commit a git desde xCode

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // VAMOS A CUSTOMIZAR LA BARRA DE NAVEGACION
        // VAMOS A CAMBIARLE EL COLOR A LA BARRA DE NAVEGACIÓN CON EL barTintColor
        
        UINavigationBar.appearance().barTintColor = UIColor(colorLiteralRed: 240.0/255.0, green: 113.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        
        // APARICENCIA DE LA TINTCOLOR QUE SIRVE PARA CAMBIAR EL COLOR DE LOS TEXTOS DE LA BARRA DE NAVEGACION ESTO SE HACE CON EL tintColor
        UINavigationBar.appearance().tintColor = UIColor.white
        
        // AHORA VAMOS A CONFIGURAR LA FUENTE DE LOS TEXTOS DE LA BARRA DE NAVEGACION Y HAREMOS LO SIGUIENTE CON EL METODO LLAMADO UIFont.
        
        // COMO PODRIA SER QUE LA FUENTE QUE PONGAMOS NO ESTA INSTALADA, DEBEMOS HACER UN CASTING SEGURO
        /* PARA CAMBIAR LA APARIENCIA DEL TITULO TENEMOS QUE USAR EL titleTextAttributes QUE ES UN DICCIONARIO QUE NOS PERMITE DECLARAR VARIOS CAMPOS COMO POR EJEMPLO:
        
            NSForegroundColorAttributeName: SIRVE PARA DECLARAR EL COLOR DE FONDO DE LA FUENTE EN ESTE CASO DEL TITULO
            NSFontAttributeName: SIRVE PARA DECLARAR LA FUENTE DE LOS TEXTOS DE LA BARRA DE NAVEGACION
         */
        
        if let barFont = UIFont(name: "Avenir-Light", size: 25.0){
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white,
                                                                NSFontAttributeName : barFont /*ESTE BARFONT FUE EL QUE SE DECLARA ARRIBA CON EL NOMBRE DE LA FUENTE*/]
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

