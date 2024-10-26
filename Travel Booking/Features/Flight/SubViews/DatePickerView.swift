//
//  DatePickerView.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//
import SwiftUI

import SwiftUI

struct DateSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedDate: Date?
    @State private var returnDate: Date?
    @State private var displayedMonth: Date = Date()
    
    private let calendar = Calendar.current
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
            
            FlightPageView(heading: "Select Date") {
                VStack(spacing: 0) {
                    // Date Selection Cards
                    HStack(spacing: 15) {
                        DateCard(
                            title: "Departure Date",
                            date: selectedDate,
                            formatter: dateFormatter
                        )
                        
                        Button(action: {
                            // Add return date logic
                        }) {
                            DateCard(
                                title: "+ Add Return Date",
                                date: returnDate,
                                formatter: dateFormatter,
                                isReturnDate: true
                            )
                        }
                    }
                    .padding()
                    
                    // Calendar View
                    VStack(spacing: 20) {
                        ForEach([0, 1, 2, 3, 4, 5], id: \.self) { monthOffset in
                            let currentMonth = calendar.date(byAdding: .month, value: monthOffset, to: displayedMonth)!
                            CalendarMonthView(
                                month: currentMonth,
                                selectedDate: $selectedDate,
                                calendar: calendar
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .background(Color(UIColor.systemGray6))
            }
            .edgesIgnoringSafeArea(.bottom)
            .toolbar(.hidden)
        }
    }
}



struct CalendarMonthView: View {
    let month: Date
    @Binding var selectedDate: Date?
    let calendar: Calendar
    
    private let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    private var monthTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: month)
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text(monthTitle)
                .font(.headline)
            
            // Day headers
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // Calendar grid
            let daysInMonth = calendar.range(of: .day, in: .month, for: month)!
            let firstWeekday = calendar.component(.weekday, from: month)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(0..<42) { index in
                    if index < firstWeekday - 1 || index >= daysInMonth.count + (firstWeekday - 1) {
                        Text("00")
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity)
                    } else {
                        let day = index - (firstWeekday - 1) + 1
                        let date = calendar.date(byAdding: .day, value: day - 1, to: month)!
                        
                        DayCell(
                            day: day,
                            isSelected: calendar.isDate(date, inSameDayAs: selectedDate ?? Date()),
                            isAvailable: true
                        )
                        .onTapGesture {
                            selectedDate = date
                        }
                    }
                }
            }
        }
    }
}

struct DayCell: View {
    let day: Int
    let isSelected: Bool
    let isAvailable: Bool
    
    var body: some View {
        Text("\(day)")
            .font(.system(size: 16, weight: isSelected ? .semibold : .regular))
            .foregroundColor(isSelected ? .white : (isAvailable ? .black : .gray))
            .frame(width: 35, height: 35)
            .background(
                Circle()
                    .fill(isSelected ? Color.blue : Color.clear)
            )
    }
}

#Preview {
    DateSelectorView()
}
