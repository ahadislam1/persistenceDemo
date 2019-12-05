//
//  FileManagerHelper.swift
//  doucmentsDirecitory
//
//  Created by Ahad Islam on 12/5/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

class FileManagerHelper {
    // call it whatever you want
    // address and url of sorts.
    // first static function creats a basic part and directory.
    // not a singular place.
    // each apple creates its own sandbox.
    // sandbox area for this spefcific app.
    
    private let fileManagerHelper = FileManagerHelper()
    private init() {}
    static public func documentDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    static public func filePathToDocumentsDirectory(filename: String) -> URL {
        return documentDirectory().appendingPathComponent(filename)
    }
}
