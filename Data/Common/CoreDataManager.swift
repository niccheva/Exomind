//
//  CoreDataManager.swift
//  Data
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import CoreData

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()

    private let container: NSPersistentContainer

    lazy var context: NSManagedObjectContext = container.viewContext

    private init() {
        let modelURL = Bundle(for: type(of: self)).url(forResource: "Data", withExtension: "momd")!
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else { fatalError("Can't load Data.xcdatamodeld") }
        container = NSPersistentContainer(name: "Data", managedObjectModel: managedObjectModel)

        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Can't load persistent stores: \(error)")
            }
        }
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
