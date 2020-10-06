//
//  File.swift
//  
//
//  Created by Heshan Yodagama on 10/6/20.
//

import Foundation

@available(iOS 13, *)
extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element) -> Int? {
        for index in self.indices {
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
