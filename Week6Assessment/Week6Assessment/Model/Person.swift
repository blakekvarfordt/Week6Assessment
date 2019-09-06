//
//  Person.swift
//  Week6Assessment
//
//  Created by Blake kvarfordt on 9/6/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

class Person: Codable {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}
