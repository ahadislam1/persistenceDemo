//
//  DataManager.swift
//  doucmentsDirecitory
//
//  Created by Ahad Islam on 12/5/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

final class DataManager<T: Codable> where T: Equatable {
    private var filename = "Documents.plist"
    
    public func getItems() -> [T] {
        var items = [T]()
        let path = FileManagerHelper.filePathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    items = try PropertyListDecoder().decode([T].self, from: data)
                } catch {
                    print("property list error \(error)")
                }
            }
        } else {
            print("Data does not exist.")
        }
        return items
    }
    
    public func addItem(item: T) {
        let path = FileManagerHelper.filePathToDocumentsDirectory(filename: filename)
        var items = getItems()
        if !items.contains(item) {
            items.append(item)
        } else {
            print("exists")
            return
        }
        
        do {
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("error encoding: \(error)")
        }
    }
    
    public func deleteItem(atIndex index: Int, item: T) {
        let path = FileManagerHelper.filePathToDocumentsDirectory(filename: filename)
        var items = getItems()
        
        let index = items.firstIndex { $0 == item}
        if let index = index {
            items.remove(at: index)
        }
        do {
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("error encoding: \(error)")
        }
    }
}

//know class will never be inherited from
