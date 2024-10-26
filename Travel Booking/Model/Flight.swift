//
//  Flight.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct Flight: Identifiable {
    let id = UUID()
    let airline: String
    let flightNumber: String
    let departure: String
    let departureTime: String
    let departureTerminal: String
    let arrival: String
    let arrivalTime: String
    let arrivalTerminal: String
    let duration: String
    
    //    airline: "Etihad",
//    airlineLogo: "etihad.logo",
//    departureTime: "19:25",
//    arrivalTime: "20:10",
//    departureTerminal: "Termainal 1",
//    flightNumber: "12321",
//    departureCode: "DXB",
//    arrivalCode: "KWI",
//    duration: "17hrs 15mins",
//    stops: 1,
//    price: "KWD:250"
}
