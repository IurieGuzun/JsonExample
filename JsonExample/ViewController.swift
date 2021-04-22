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
            print(error.localizedDescription)
        }
        
        return nil
    }

    private func parsePicture(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([Picture].self,
                                                       from: jsonData)
            print("count ", decodedData.count)
            print("name ", decodedData[0].name)
            print("Coord = ", decodedData[0].coordinates)
            print("x= ", decodedData[0].coordinates[0].x)
//            print("x= ", decodedData.coordinates[0].x)
        } catch {
            print("decode error")
        }
    }
}
