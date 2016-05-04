//
//  Utils.swift
//  SwiftBank
//
//  Created by Abdullah Joseph on 3/29/16.
//

import Foundation

class Utils {
    //Make it a singleton with this
//    static let instance = Utils()
 
    static func readInput(prompt:String = "> ") -> String {
        print(prompt, terminator:"")
        
        repeat {
            guard
                let response_str = readLine(stripNewline: true)
                where !response_str.isEmpty
                else {
                    continue
            }
            
            return response_str
        } while true
    }
    
    static func clearScreen() {
        print("")
        print("")
        print("")
        print("")
    }
    
    static func pause() {
        readLine()
    }
}