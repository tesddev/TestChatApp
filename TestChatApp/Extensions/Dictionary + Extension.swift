//
//  Dictionary + Extension.swift
//  TestChatApp
//
//  Created by Tes on 21/05/2023.
//

import Foundation

extension Dictionary {
    func jsonFormat() -> String {
        var theString = ""
        if let theJSONData = try?  JSONSerialization.data(
            withJSONObject: self,
            options: .prettyPrinted
        ),
           let theJSONText = String(data: theJSONData,
                                    encoding: String.Encoding.ascii) {
            theString = theJSONText
        }
        return theString
    }
    
    func printJsonFormatWith(_ title: String) -> String {
        let str = self.jsonFormat()
        return "TITLE:- \(title): \n\(str)"
    }
}
