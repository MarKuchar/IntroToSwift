//
//  CoreDataManager.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-08-25.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataManager {
  // singleton
  static let shared = CoreDataManager()
  
  private init() {}
  
  let persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "ToDo")
    container.loadPersistentStores { (storeDescription, error) in
      if let err = error {
        fatalError("Loading of persistent store failed: \(err)")
      }
    }
    return container
  }()
  
  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch let saveErr {
        let err = saveErr as NSError
        fatalError("Unresolved error \(err), \(err.userInfo)")
      }
    }
  }
}

