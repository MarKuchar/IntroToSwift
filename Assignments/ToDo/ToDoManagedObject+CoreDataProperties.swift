//
//  ToDoManagedObject+CoreDataProperties.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-08-25.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDoManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoManagedObject> {
        return NSFetchRequest<ToDoManagedObject>(entityName: "ToDoManagedObject")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var priority: String?
    @NSManaged public var title: String?

}
