//
//  PersonController.swift
//  Week6Assessment
//
//  Created by Blake kvarfordt on 9/6/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

class PersonController: Codable {
    
    static let shared = PersonController()
    
    var people: [Person] = []
    
    func addPerson(name: String) {
        let newPerson = Person(name: name)
        people.append(newPerson)
        saveToPersistence()
    }
    
    func removePerson(person: Person) {
        guard let index = people.firstIndex(of: person) else { return }
        people.remove(at: index)
        saveToPersistence()
    }
    
    func getFileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileCreated = urls[0].appendingPathComponent("person.json")
        return fileCreated
    }
    
    func saveToPersistence() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(people)
            try data.write(to: getFileURL())
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func loadFromPersistence() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: getFileURL())
            let person = try decoder.decode([Person].self, from: data)
            people = person
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
}
