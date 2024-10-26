//
//  Airport.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct Airport: Identifiable, Hashable {
    let id = UUID()
    let code: String
    let name: String
    let city: String
}
