//
//  HomeView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var authVM : AuthViewModel
    
    var body: some View {
        TabView {
            // Home Tab
            mainContent
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // My Profile Tab
            
                ProfileView(authVM: _authVM)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("My Profile")
                    }
                
            
            // My Ticket Tab
            Text("My Ticket")
                .tabItem {
                    Image(systemName: "ticket.fill")
                    Text("My Ticket")
                }
            
            // Explore Tab
            Text("Explore")
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Explore")
                }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    // Main Content for the Home Tab
    private var mainContent: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top Section with Background
                ZStack(alignment: .top) {
                    // Background Image with Gradient
                    HomeViewHeaderBackground()
                    
                    VStack(alignment: .center, spacing: 20) {
                        // Top Bar
                        HeaderView()
                            .padding(.top, 60)
                        
                        // Tagline
                        Text("Take a trip, Create memories..")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .italic()
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        
                        // Services Cards
                        HStack(spacing: 20) {
                            ForEach(["Flight", "Hotel", "Packages"], id: \.self) { service in
                                NavigationLink(destination: FlightSearchView()) {
                                    VStack(spacing: 8) {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.white)
                                            .frame(width: 60, height: 60)
                                            .overlay(
                                                Image(service.lowercased())
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 30, height: 30)
                                            )
                                        
                                        Text(service)
                                            .fontWeight(.medium)
                                            .foregroundColor(.white)
                                    }
                                }
                                
                            }
                        }
                        .padding(.vertical, 20)
                    }
                    .padding(.horizontal, 20)
                }
                
                // Scrollable Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Special Offers Section
                        homeSection(title: "Special Offers") {
                            Image("slide_1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(16)
                        }
                        
                        homeSection(title: "Recommended Best Hotels") {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(1...2, id: \.self) { _ in
                                        HotelCard()
                                    }
                                }
                            }
                        }
                        
                        homeSection(title: "Destinations Deals") {
                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    DestinationDealCard(imageName: "hotel_1", cityName: "Dubai")
                                    DestinationDealCard(imageName: "hotel_2", cityName: "Kuwait")
                                    DestinationDealCard(imageName: "hotel_1", cityName: "Dubai")
                                    DestinationDealCard(imageName: "hotel_2", cityName: "Kuwait")
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        homeSection(title: "") {
                            ScrollView(.horizontal) {
                                HStack(spacing: 16) {
                                    FeatureCard(
                                        icon: "checkmark.shield",
                                        title: "Best price Guarantee",
                                        description: "Lorem ipsum dolor sit amet consectetur. Vitae imperdiet id amet lacus risus"
                                    )
                                    
                                    FeatureCard(
                                        icon: "clock",
                                        title: "Easy Booking",
                                        description: "Lorem ipsum dolor sit amet consectetur. Vitae imperdiet id amet lacus risus"
                                    )
                                }
                            }
                        }
                        
                        homeSection(title: "Tour Packages") {
                            ScrollView(.horizontal) {
                                HStack(spacing: 16) {
                                    TourPackageCard(imageName: "hotel_1", destination: "Europe")
                                    TourPackageCard(imageName: "hotel_2", destination: "Thailand")
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(20)
                }
            }
            .toolbar(.hidden, for: .automatic)
            .edgesIgnoringSafeArea(.all)
        }
        
    }
    
    private func homeSection(title: String, content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            content()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}
