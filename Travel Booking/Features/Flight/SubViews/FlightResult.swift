//
//  FlightResult.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//


import SwiftUI

struct FlightListView: View {
    // Sample data using your Flight model
    @State private var filterSelection : Int?
    @Environment(\.dismiss) var dismiss
    
    let flights: [Flight] = [
        Flight(
            airline: "Etihad",
            flightNumber: "EY507",
            departure: "DXB",
            departureTime: "19:25",
            departureTerminal: "T3",
            arrival: "KWI",
            arrivalTime: "20:10",
            arrivalTerminal: "T4",
            duration: "17hrs 15mins"
        ),
        Flight(
            airline: "Kuwait Airways",
            flightNumber: "KU674",
            departure: "DXB",
            departureTime: "19:25",
            departureTerminal: "T1",
            arrival: "KWI",
            arrivalTime: "20:10",
            arrivalTerminal: "T4",
            duration: "17hrs 15mins"
        ),
        Flight(
            airline: "Qatar Airways",
            flightNumber: "QR545",
            departure: "DXB",
            departureTime: "19:25",
            departureTerminal: "T2",
            arrival: "KWI",
            arrivalTime: "20:10",
            arrivalTerminal: "T4",
            duration: "17hrs 15mins"
        )
    ]
    
    var body: some View {
        NavigationView {
            FlightPageView(heading: "") {
                VStack(spacing: 0) {
                    // Header
                    VStack {
                        Text("Dubai to Kuwait")
                            .font(.headline)
                        Text("20 Dec 2025 • 1 Adult • Economy Class")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemBlue).opacity(0.1))
                    
                    // Date Selection
                    HStack {
                        DateButton(date: "20 Dec 2025")
                        DateButton(date: "22 Dec 2025")
                    }
                    .padding(.horizontal)
                    
                    // Flight Results
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(flights) { flight in
                                NavigationLink(destination: FlightResultsView(flights: flights)) {
                                    FlightSegment(flight: flight)
                                }
                                .foregroundStyle(.black)
                                
                                    
                            }
                        }
                        .padding()
                    }
                    
                    // Bottom Bar
                    HStack {
                        NavigationLink(destination: FilterView(), tag: 1, selection: $filterSelection) {
                            Button(action: {
                                self.filterSelection = 1
                            }) {
                                HStack {
                                    Image(systemName: "line.3.horizontal.decrease")
                                    Text("Filter")
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        
                        
                        Divider()
                            .frame(height: 30)
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "arrow.up.arrow.down")
                                Text("Sort")
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .shadow(radius: 2)
                }
                .background(.white)
            }
            
            .toolbar(.hidden, for: .automatic)
        }
    }
}

struct DateButton: View {
    let date: String
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "chevron.left")
                Text(date)
                Image(systemName: "chevron.right")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}

struct BackButton: View {
    var body: some View {
        Button(action: {}) {
            Image(systemName: "chevron.left")
                .padding(8)
                .background(Circle().fill(Color.white))
        }
    }
}

struct EditButton: View {
    var body: some View {
        Button(action: {}) {
            Image(systemName: "square.and.pencil")
                .padding(8)
                .background(Circle().fill(Color.white))
        }
    }
}


#Preview {
    FlightListView()
}
