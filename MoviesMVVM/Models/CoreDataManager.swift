//
//  CoreDataManager.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import Foundation
import CoreData

// MARK: Core Data Manager Singleton 
class CoreDataManager {
    //MARK: Properties
    static let shared = CoreDataManager()
    var movies:[MovieModel] = []
    private init(){}
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MoviesMVVM")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext()  {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch  {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: Core Data is empty method
    func coreDataIsEmpty() ->Bool{
        var isEmpty:Bool{
            do {
                let request:NSFetchRequest<MovieModel> = MovieModel.fetchRequest()
                let count = try persistentContainer.viewContext.count(for: request)
                return count == 0 ? true : false
                
            } catch  {
                print("error: \(error)")
                return true
            }
        }
        return isEmpty
    }
    
    // MARK: Core Data CRUD methods
    func create(movieArray:[Movie])  {
        for movieItem in movieArray {
            let movie = MovieModel(context: persistentContainer.viewContext)
            movie.title = movieItem.title
            movie.image = movieItem.image
            movie.releaseYear =  Int64(movieItem.releaseYear)
            movie.genre = movieItem.genre
            movie.rating = movieItem.rating
        }
        do {
            try persistentContainer.viewContext.save()
            print("successful")
        } catch  {
            print("failed \(error)")
        }
    }
    
    func read()  {
        let request:NSFetchRequest<MovieModel> = MovieModel.fetchRequest()
        do {
            movies = try persistentContainer.viewContext.fetch(request)
            print("successful")
        } catch  {
            print("failed \(error)")
        }
    }
    
}
