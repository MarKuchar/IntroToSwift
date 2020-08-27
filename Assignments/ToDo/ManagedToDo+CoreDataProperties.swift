//
//  ManagedToDo+CoreDataProperties.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-08-27.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedToDo> {
        return NSFetchRequest<ManagedToDo>(entityName: "ManagedToDo")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var priority: Int32
    @NSManaged public var title: String?

}
