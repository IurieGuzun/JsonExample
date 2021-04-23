//
//  ViewController.swift
//  JsonExample
//
//  Created by Iurie Guzun on 2021-04-22.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let localData = readLocalFile(forName: "PictCoord") {
            print(localData)
            parsePicture(jsonData: localData)
            print("picCount = ", picCount)
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            selectDifferentPic()
            
        }
    }
}
