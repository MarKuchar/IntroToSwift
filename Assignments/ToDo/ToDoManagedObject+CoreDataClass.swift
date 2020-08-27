//
//  ToDoManagedObject+CoreDataClass.swift
//  ToDo
//
//  Created by Martin Kuchar on 2020-08-25.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ToDoManagedObject)
public class ToDoManagedObject: NSManagedObject {

    class func findOrCreateTodo(matching todoInfo: Todo, in context: NSManagedObjectContext) throws -> ToDoManagedObject {
      
        let request: NSFetchRequest<ToDoManagedObject> = ToDoManagedObject.fetchRequest()
      request.predicate = NSPredicate(format: "title = %@", todoInfo.title)
      // NSSortDescriptor possible
      do {
        let matches = try context.fetch(request)
        if matches.count > 0 {
          // assert 'sanity': if condition false ... then print message and interrupt program
          assert(matches.count == 1, "findOrCreateArticle -- database inconsistency")
          let matchedTodo = matches[0]
          return matchedTodo
        }
      } catch {
        throw error
      }
      // no match
      let todo = ToDoManagedObject(context: context)
        todo.title = todoInfo.title
        todo.isCompleted = todoInfo.isCompleted
        todo.priority = todoInfo.priority.rawValue
      return todo
    }
}
