//
//  ViewController.swift
//  MyJson
//
//  Created by Sanjeev Suman on 07/12/17.
//  Copyright © 2017 Sanjeev Suman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        writeData(to: "abc.txt", text: "New")
        readData(from: "abc.txt")
        deleteFile("abc.txt")
        readData(from: "abc.txt")
//        readData(from: "~/check.json")
        let dict = Utils.readFromJSONFile(name: "Check")
        print(dict)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

