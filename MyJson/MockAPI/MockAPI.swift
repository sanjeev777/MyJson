//
//  MockAPI.swift
//  MyJson
//
//  Created by Sanjeev Suman on 07/12/17.
//  Copyright © 2017 Sanjeev Suman. All rights reserved.
//

import Foundation

class Utils {
    class func readFromJSONFile(name: String) -> [String:Any?]? {
        guard let path = Bundle.main.url(forResource: name, withExtension: "json") else {
            return nil
        }
        guard let data = try? Data(contentsOf: path, options: Data.ReadingOptions.mappedIfSafe) else {
            return nil
        }
        guard let dict = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any?] else {
            return nil
        }
        return dict
    }
}

func writeData(to file: String, text: String) {
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    guard let path = dir?.appendingPathComponent(file) else { return }
    do {
       try text.write(to: path, atomically: false, encoding: .utf8)
    } catch {
        print("unable to write")
    }
}

func readData(from file: String) {
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    guard let path = dir?.appendingPathComponent(file) else { return }
    do {
        let text = try String(contentsOf: path, encoding: .utf8)
        print(text)
    } catch {
        print("unable to read")
    }
}

func deleteFile(_ file: String) {
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    guard let path = dir?.appendingPathComponent(file) else { return }
    do {
        try FileManager.default.removeItem(at: path)
        print("file deleted")
    } catch {
        print("unable to delete")
    }
}
