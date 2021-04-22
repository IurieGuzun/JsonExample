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
        if let localData = self.readLocalFile(forName: "PictCoord") {
            print(localData)
            self.parsePicture(jsonData: localData)
        }
    }

    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

    private func parsePicture(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Picture.self,
                                                       from: jsonData)
            
            print("name ", decodedData.name)
            print("x= ", decodedData.coordinates.x)
            print("Y= ", decodedData.coordinates.y)
            print("i= ", decodedData.coordinates.i)

            print("===================================")
        } catch {
            print("decode error")
        }
    }
//    private func parse(jsonData: Data) {
//        do {
//            let decodedData = try JSONDecoder().decode(DemoData.self,
//                                                       from: jsonData)
//
//            print("Title: ", decodedData.title)
//            print("Description: ", decodedData.description)
//            print("===================================")
//        } catch {
//            print("decode error")
//        }
//    }
    
}
    
    
 
