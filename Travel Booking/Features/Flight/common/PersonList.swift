//
//  PersonList.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct PersonList: View {
    let persons: [Person] = [
        Person(name: "Dinakar", type: "Adult"),
        Person(name: "Satya", type: "Adult"),
        Person(name: "Kumar", type: "Adult"),
        Person(name: "Harish", type: "Adult"),
    ]

    var body: some View {
        Table(persons) {
            TableColumn("Name", value: \.name)
            TableColumn("Type", value: \.type)
        }
    }

    struct Person: Identifiable {
        let id = UUID()
        let name: String
        let type: String
    }
}
