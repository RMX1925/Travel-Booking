import SwiftUI


struct FilterView: View {
    @State private var priceRange: ClosedRange<Double> = 150...250
    @State private var duration: ClosedRange<Double> = 1...20
    @State private var transitTime: ClosedRange<Double> = 0...21
    @State private var selectedStops: Set<String> = []
    @State private var selectedRefundableType: Set<String> = []
    @State private var selectedLuggage: Set<String> = []
    @State private var isLuggageExpanded = false
    @State private var isDurationExpanded = false
    @State private var selectedDepartureTimes: Set<String> = []
    @State private var selectedArrivalTimes: Set<String> = []
    
    var body: some View {
        NavigationView {
            
            FlightPageView(heading: "Filter"){
                VStack(alignment: .leading, spacing: 20) {
                    priceSection
                    stopsSection
                    refundableTypeSection
                    luggageSection
                    durationSection
                    transitTimeSection
                    departureTimeSection
                    arrivalTimeSection
                    
                    Group {
                        DisclosureGroup("Airlines") {
                            Text("Airlines options here")
                        }
                        DisclosureGroup("Connecting Flights") {
                            Text("Connecting Flights options here")
                        }
                        DisclosureGroup("Connecting Airports") {
                            Text("Connecting Airports options here")
                        }
                    }
                }
             
                .padding()
                .background(.white)
            }
            
            .toolbar(.hidden, for: .automatic)
        }
    }
    
    var priceSection: some View {
        VStack(alignment: .leading) {
            Text("Price")
            Text("KWD \(Int(priceRange.lowerBound)) - KWD \(Int(priceRange.upperBound))")
            RangeSlider(range: $priceRange, in: 0...500)
        }
    }
    
    var stopsSection: some View {
        VStack(alignment: .leading) {
            Text("No.of Stops")
            ForEach(["0 Stop", "1 Stop", "2 Stop"], id: \.self) { stop in
                CheckboxRow(title: stop, isSelected: selectedStops.contains(stop)) {
                    if selectedStops.contains(stop) {
                        selectedStops.remove(stop)
                    } else {
                        selectedStops.insert(stop)
                    }
                }
            }
        }
    }
    
    var refundableTypeSection: some View {
        VStack(alignment: .leading) {
            Text("Refundable Type")
            ForEach(["Refundable", "Non- Refundable"], id: \.self) { type in
                CheckboxRow(title: type, isSelected: selectedRefundableType.contains(type)) {
                    if selectedRefundableType.contains(type) {
                        selectedRefundableType.remove(type)
                    } else {
                        selectedRefundableType.insert(type)
                    }
                }
            }
        }
    }
    
    var luggageSection: some View {
        DisclosureGroup("Luggage", isExpanded: $isLuggageExpanded) {
            ForEach(["0 Kilograms", "0 Piece", "2 Piece", "20 Kilograms", "25 Kilograms", "30 Kilograms"], id: \.self) { luggage in
                CheckboxRow(title: luggage, isSelected: selectedLuggage.contains(luggage)) {
                    if selectedLuggage.contains(luggage) {
                        selectedLuggage.remove(luggage)
                    } else {
                        selectedLuggage.insert(luggage)
                    }
                }
            }
        }
    }
    
    var durationSection: some View {
        DisclosureGroup("Duration", isExpanded: $isDurationExpanded) {
            VStack(alignment: .leading) {
                Text("\(Int(duration.lowerBound)) Hours- \(Int(duration.upperBound)) Hours")
                RangeSlider(range: $duration, in: 1...24)
            }
        }
    }
    
    var transitTimeSection: some View {
        VStack(alignment: .leading) {
            Text("Transit Time")
            Text("\(Int(transitTime.lowerBound)) Hours- \(Int(transitTime.upperBound)) Hours")
            RangeSlider(range: $transitTime, in: 0...24)
        }
    }
    
    var departureTimeSection: some View {
        VStack(alignment: .leading) {
            Text("Departure Time")
            HStack {
                ForEach(["12AM\nTo 6AM", "6AM\nTo 12PM", "12PM\nTo 6PM", "6PM\nTo 12AM"], id: \.self) { time in
                    Button(action: {
                        if selectedDepartureTimes.contains(time) {
                            selectedDepartureTimes.remove(time)
                        } else {
                            selectedDepartureTimes.insert(time)
                        }
                    }) {
                        Text(time)
                            .multilineTextAlignment(.center)
                            .padding(8)
                            .background(selectedDepartureTimes.contains(time) ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedDepartureTimes.contains(time) ? .white : .black)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
    
    var arrivalTimeSection: some View {
        VStack(alignment: .leading) {
            Text("Arrival Time")
            HStack {
                ForEach(["12AM\nTo 6AM", "6AM\nTo 12PM", "12PM\nTo 6PM", "6PM\nTo 12AM"], id: \.self) { time in
                    Button(action: {
                        if selectedArrivalTimes.contains(time) {
                            selectedArrivalTimes.remove(time)
                        } else {
                            selectedArrivalTimes.insert(time)
                        }
                    }) {
                        Text(time)
                            .multilineTextAlignment(.center)
                            .padding(8)
                            .background(selectedArrivalTimes.contains(time) ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedArrivalTimes.contains(time) ? .white : .black)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct CheckboxRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .foregroundColor(isSelected ? .blue : .gray)
            }
        }
    }
}

struct RangeSlider: View {
    @Binding var range: ClosedRange<Double>
    let bounds: ClosedRange<Double>
    
    init(range: Binding<ClosedRange<Double>>, in bounds: ClosedRange<Double>) {
        self._range = range
        self.bounds = bounds
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 4)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: CGFloat((range.upperBound - bounds.lowerBound) / (bounds.upperBound - bounds.lowerBound)) * geometry.size.width, height: 4)
                    .offset(x: CGFloat((range.lowerBound - bounds.lowerBound) / (bounds.upperBound - bounds.lowerBound)) * geometry.size.width)
                HStack(spacing: 0) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 24, height: 24)
                        .shadow(radius: 4)
                        .offset(x: CGFloat((range.lowerBound - bounds.lowerBound) / (bounds.upperBound - bounds.lowerBound)) * geometry.size.width)
                        .gesture(DragGesture().onChanged { value in
                            let newValue = bounds.lowerBound + Double(value.location.x / geometry.size.width) * (bounds.upperBound - bounds.lowerBound)
                            range = min(newValue, range.upperBound - 1)...range.upperBound
                        })
                    Circle()
                        .fill(Color.white)
                        .frame(width: 24, height: 24)
                        .shadow(radius: 4)
                        .offset(x: CGFloat((range.upperBound - bounds.lowerBound) / (bounds.upperBound - bounds.lowerBound)) * geometry.size.width - 24)
                        .gesture(DragGesture().onChanged { value in
                            let newValue = bounds.lowerBound + Double(value.location.x / geometry.size.width) * (bounds.upperBound - bounds.lowerBound)
                            range = range.lowerBound...max(newValue, range.lowerBound + 1)
                        })
                }
            }
        }
        .frame(height: 24)
    }
}


#Preview {
    FilterView()
}
