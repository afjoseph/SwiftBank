//
//  Utils.swift
//  SwiftBank
//
//  Created by Mindvalley on 3/29/16.
//  Copyright © 2016 Mindvalley. All rights reserved.
//

import Foundation

class Utils {
    static let instance = Utils()
 
    func readInput(prompt:String = "> ") -> String {
        print(prompt, terminator:"")
        
        while true {
            guard
                let response_str = readLine(stripNewline: true)
                where !response_str.isEmpty
                else {
                    continue
            }
            
            return response_str
        }
    }
    
    func clearScreen() {
        print("")
        print("")
        print("")
        print("")
    }
    
    func pause() {
        readLine()
    }
}