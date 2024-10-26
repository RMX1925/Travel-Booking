//
//  AirportSelectionView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

struct AirportSelectionView: View {
    var heading : String = "From"
    @State private var searchText = ""
    @Binding var selectedAirport: Airport?
    
    // Sample data - can be moved to a separate data service
    let airports = [
        Airport(code: "Dubai", name: "DXB", city: "United Arab Emirates"),
        Airport(code: "Kuwait", name: "KWI", city: "Kuwait International Airport"),
        Airport(code: "Cairo", name: "CAI", city: "Egypt Cairo International Airport"),
        Airport(code: "Goa", name: "GOI", city: "Goa Dabolim International Airport"),
        Airport(code: "Bangkok", name: "BKK", city: "Suvarnabhumi Airport"),
        Airport(code: "Chennai", name: "MAA", city: "Chennai International Airport"),
        Airport(code: "New York", name: "JFK", city: "John F. Kennedy International Airport"),
        Airport(code: "Singapore", name: "SIN", city: "Singapore Changi Airport"),
        Airport(code: "London", name: "LON", city: "United Arab Emirates"),
        Airport(code: "Delhi", name: "DEL", city: "Indira Gandhi International Airport")
    ]
    
    var filteredAirports: [Airport] {
        if searchText.isEmpty {
            return airports
        }
        return airports.filter { airport in
            airport.city.lowercased().contains(searchText.lowercased()) ||
            airport.code.lowercased().contains(searchText.lowercased()) ||
            airport.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {   
            FlightPageView(heading: heading) {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                        TextField("Enter city/Airport Name", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                            
                            
                    }
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(30)
                    .padding()
                    
                    // Airport List
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(filteredAirports) { airport in
                                AirportRow(airport: airport)
                                    .onTapGesture {
                                        selectedAirport = airport
                                    }
                            }
                        }
                    }
                }
                .background(.white)
                
            }
            .toolbar(.hidden, for: .automatic)
        }
    }
    
    struct AirportRow: View {
        let airport: Airport
        
        var body: some View {
            HStack {
                Image(systemName: "airplane")
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(-45))
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(airport.city)
                            .font(.system(size: 17, weight: .regular))
                        Spacer()
                        Text(airport.code)
                            .font(.system(size: 17, weight: .medium))
                    }
                    
                    Text(airport.name)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .contentShape(Rectangle())
        }
    }
}

#Preview {
    AirportSelectionView(selectedAirport: .constant(Airport(code: "334", name: "Delhi", city: "DLI")))
}
