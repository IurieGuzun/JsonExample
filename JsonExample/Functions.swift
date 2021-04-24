//
//  Functions.swift
//  JsonExample
//
//  Created by Iurie Guzun on 2021-04-23.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation

func readLocalFile(forName name: String) -> Data? {
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

 func parsePicture(jsonData: Data) {
    do {
        let decodedData = try JSONDecoder().decode([Picture].self,
                                                   from: jsonData)
        picCount = decodedData.count
        print("picCount ", picCount)
        print("name ", decodedData[0].name)
        print("Coord = ", decodedData[0].coordinates)
        print("x= ", decodedData[0].coordinates[0].x)
    } catch {
        print("decode error")
    }
}
func ranInt (_ start: Int, _ end: Int ) -> Int {
    return Int.random(in: start...end)
}

func selectDifferentPic () -> Int {
    if tempPictArray.isEmpty || tempPictArray.count < picCount {
        curPicIndex = ranInt(0, picCount-1)
       
        while tempPictArray.contains(curPicIndex) {
            print("Not good curPicIndex = ", curPicIndex)
            curPicIndex = ranInt(0, picCount-1)
     }
        print("curPicIndex = ", curPicIndex)
         tempPictArray.append(curPicIndex)
        
    } else {
        print("All pictures were selected. Start Again ", tempPictArray.count)
        tempPictArray = []
        curPicIndex = ranInt(0, picCount-1)
        tempPictArray.append(curPicIndex)
    }
    return curPicIndex
}
