import SwiftUI

enum CabinClass: String, CaseIterable {
    case economy = "Economy"
    case premiumEconomy = "Premium Economy"
    case business = "Business"
    case first = "First"
}

struct FlightSearchView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isOneWay = true
    @State private var departureDate = Date()
    @State private var showAdvancedOptions = false
    @State private var directFlightOnly = false
    @State var airportFrom : Airport?
    @State var airportTo : Airport?
    
    @State private var adults = 1
    @State private var children = 0
    @State private var infants = 0
    @State private var selectedClass: CabinClass = .economy
    @State private var showingTravelerSheet = false
    @State private var selection : Int?
    
    
    private var formattedTraveInfo: String {
        var formattedText = ""
        if(adults > 0) {
            formattedText += " \(adults) Adults ·"
        }
        if (children > 0) {
            formattedText += " \(children) Children ·"
        }
        if (infants > 0) {
            formattedText += " \(infants) Infants ·"
        }
        formattedText += " \(selectedClass.rawValue) Class"
        
        return formattedText
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy"
        return formatter
    }()
    
    private let monthYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                // Background gradient
                HomeViewHeaderBackground()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Custom Navigation Bar
                    HStack {
                        CircleButton(icon: "chevron.left", action: {})
                        Spacer()
                        Text("Flight search")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.trailing, 40)
                        Spacer()
                    }
                    .padding()
                    
                    // Main Content
                    ScrollView {
                        VStack(alignment: .leading , spacing: 20) {
                            // Trip Type Selection
                            HStack(spacing: 10) {
                                TripTypeButton(title: "One way", isSelected: isOneWay) {
                                    isOneWay = true
                                }
                                TripTypeButton(title: "Round trip", isSelected: !isOneWay) {
                                    isOneWay = false
                                }
                            }
                            .padding(.horizontal)
                            
                            // Flight Selection Cards
                            VStack(spacing: 0) {
                                NavigationLink(destination: AirportSelectionView(heading: "From", selectedAirport: $airportFrom)) {
                                    LocationCard(
                                        type: "From",
                                        city: "Dubai",
                                        code: "DXB"
                                    )
                                }
                                .foregroundStyle(.black)
                                
                                
                                // Switch Button
                                ZStack {
                                    
                                    NavigationLink {
                                        AirportSelectionView(heading: "To",selectedAirport: $airportTo)
                                    } label: {
                                        LocationCard(
                                            type: "To",
                                            city: "Kuwait",
                                            code: "KWI",
                                            isReversed: true
                                        )
                                        .offset(y: 16)
                                    }
                                    .foregroundStyle(.black)

                                    Circle()
                                        .fill(Color(hex: "87CEEB"))
                                        .frame(width: 40, height: 40)
                                        .overlay(
                                            Image(systemName: "arrow.up.arrow.down")
                                                .foregroundColor(.white)
                                        )
                                        .offset(y: -25)
                                }
                                .padding(.bottom, 18)
                                
                                
                            }
                            
                            // Date Selection
                            HStack(spacing: 15) {
                                DateCard(
                                    title: "Departure Date",
                                    date: Date(), formatter: dateFormatter
                                )
                                
                                if !isOneWay {
                                    Button(action: {}) {
                                        Text("+ Add Return Date")
                                            .font(.subheadline)
                                            .foregroundColor(.blue)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(Color.white)
                                            .cornerRadius(12)
                                            .shadow(color: .black.opacity(0.05), radius: 2)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            
                            // Travelers and Class
                            Button(action: {
                                showingTravelerSheet.toggle()
                            }) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Travellers and Class")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text(formattedTraveInfo)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(color: .black.opacity(0.05), radius: 2)
                                
                            }
                            .sheet(isPresented: $showingTravelerSheet) {
                                TravelerClassSheet()
                                    .presentationDragIndicator(.visible)
                            }
                            .padding(.horizontal)
                            
                            // Search Button
                            NavigationLink(destination: FlightListView(), tag: 1, selection: $selection) {
                                Button(action: {
                                    self.selection = 1
                                }) {
                                    Text("Search Flights")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color(.appPrimary))
                                        .cornerRadius(25)
                                }
                                .padding(.horizontal)
                            }
                            
                            
                            // Advanced Options
                            VStack(spacing: 10) {
                                HStack {
                                    Button(action: { directFlightOnly.toggle() }) {
                                        HStack {
                                            Image(systemName: directFlightOnly ? "checkmark.square.fill" : "square")
                                                .foregroundColor(.blue)
                                            Text("Direct Flight Only")
                                                .font(.subheadline)
                                        }
                                    }
                                    Spacer()
                                    
                                    Button(action: { showAdvancedOptions.toggle() }) {
                                        HStack {
                                            Text("Advanced search options")
                                                .font(.subheadline)
                                            Image(systemName: "chevron.down")
                                        }
                                    }
                                }
                                .foregroundColor(.gray)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical)
                    }
                    .background(Color(hex: "F8F9FA"))
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    
                }
            }
            .toolbar(.hidden, for: .tabBar)
        }
        
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// Prview
#Preview {
    FlightSearchView()
}
