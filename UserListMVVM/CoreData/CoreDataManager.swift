//
//  CoreDataManager.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 7.03.2025.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    func saveContext()
    var context: NSManagedObjectContext {get}
    var persistentContainer: NSPersistentContainer { get }
    func fetchEntities<T: NSManagedObject>(ofType type: T.Type) -> [T]
    func delete(_ object: NSManagedObject)
}

final class CoreDataManager: CoreDataManagerProtocol {
    
    let persistentContainer: NSPersistentContainer
    
     init() {
        persistentContainer = NSPersistentContainer(name: "UserListDB")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    
    func saveContext() {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchEntities<T: NSManagedObject>(ofType type: T.Type) -> [T] {
        let request = T.fetchRequest()
        do {
            return try context.fetch(request) as? [T] ?? []
        } catch {
            print("❌ Fetch Error: \(error.localizedDescription)")
            return []
        }
    }
    

    
    
    func delete(_ object: NSManagedObject) {
        context.delete(object)
        saveContext()
    }
    
 

    
}
