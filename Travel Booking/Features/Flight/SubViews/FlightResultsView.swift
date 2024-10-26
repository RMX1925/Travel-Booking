//
//  FlightResultsView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct FlightResultsView: View {
    let flights: [Flight]
    
    @State var priceBreakdownExpanded: Bool = false
    @State var fareRulesExpanded: Bool = false
    @State var baggageInfoExpanded: Bool = false
    
    @State private var selection : Int?
    
    var body: some View {
        NavigationView {
            FlightPageView(heading: "Flight Details") {
                
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(spacing: 20) {
                            // Route title
                            Text("Dubai - Kuwait")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            
                            // Flight card
                            FlightCard()
                            
                            // Additional info sections
                            InfoSection(title: "Fare Breakdown", isExpanded: $priceBreakdownExpanded) {
                                VStack(spacing: 6) {
                                    priceBreakdown(title: "Base Fare", price: "89.000")
                                    priceBreakdown(title: "Tax", price: "71.350")
                                    priceBreakdown(title: "Total", price: "160.350")
                                    priceBreakdown(title: "No. of Passengers", price: "x1")
                                    priceBreakdown(title: "Sub Total", price: "160.350")
                                    priceBreakdown(title: "Total Trip Costs", price: "KWD 160.350")
                                }
                                .padding(.horizontal)
                            }
                            
                            InfoSection(title: "Fare Rules", isExpanded: $fareRulesExpanded) {
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing")
                                    .multilineTextAlignment(.leading)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                    .padding(.horizontal)
                            }
                            
                            InfoSection(title: "Baggage Info", isExpanded: $baggageInfoExpanded) {
                                VStack(alignment: .leading, spacing: 10) {
                                    baggageInfoRow(origin: "DXB", destination: "KWI", cabin: "Cabin Baggage 7kg", checkedIn: "Checked-in Baggage - 20kg")
                                    baggageInfoRow(origin: "DOH", destination: "DXB", cabin: "Cabin Baggage 7kg", checkedIn: "Checked-in Baggage - 20kg")
                                }
                                .padding(.horizontal)
                            }
                            
                            Spacer()
                        }
                        .padding(.top)
                    }
                    
                    // Bottom bar with price and book button
                    HStack {
                        Text("KWD: 250")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        NavigationLink(destination: BookingDetailsView(), tag: 1, selection: $selection) {
                            Button(action: {
                                self.selection = 1
                            }) {
                                Text("Book Now")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 140, height: 44)
                                    .background(Color.orange)
                                    .cornerRadius(22)
                            }
                        }
                        
                    }
                    .padding()
                    .background(Color.white)
                }
                .background(Color.white.ignoresSafeArea())
            }
            .toolbar(.hidden, for: .automatic)
        }
    }
    
    func priceBreakdown(title: String, price: String) -> some View {
        HStack {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
            
            Spacer()
            
            Text(price)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 6)
    }
    
    func baggageInfoRow(origin: String, destination: String, cabin: String, checkedIn: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("(\(origin)) - (\(destination))")
                .font(.subheadline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading) // Align to leading side
            
            HStack(alignment: .top, spacing: 4) {
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
                Text(cabin)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading) // Align to leading side
            
            HStack(alignment: .top, spacing: 4) {
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
                Text(checkedIn)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading) // Align to leading side
        }
        .padding(.horizontal) // Add padding if needed
    }
}



#Preview {
    FlightResultsView(flights: [])
}
