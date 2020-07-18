//
//  ViewController+CoreData.swift
//  MyGames
//
//  Created by Ivan Costa on 28/05/20.
//

import UIKit
import CoreData

extension UIViewController {
   
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
