//
//  TravelerClassSheet.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//


import SwiftUI

struct TravelerClassSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var adults = 1
    @State private var children = 0
    @State private var infants = 0
    @State private var selectedClass: CabinClass = .economy
    
    enum CabinClass: String, CaseIterable {
        case economy = "Economy"
        case premiumEconomy = "Premium Economy"
        case business = "Business"
        case first = "First"
    }
    
    var body: some View {
        VStack(spacing: 24) {
            // Header
            Text("Select Traveller & class")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Traveler Selection Section
            VStack(spacing: 16) {
                PassengerCounter(
                    title: "Adults",
                    subtitle: "12 years & above",
                    count: $adults
                )
                
                PassengerCounter(
                    title: "Children",
                    subtitle: "2-12 yrs",
                    count: $children
                )
                
                PassengerCounter(
                    title: "Infants",
                    subtitle: "under 2 yrs",
                    count: $infants
                )
            }
            
            // Cabin Class Selection
            VStack(alignment: .leading, spacing: 12) {
                Text("Choose Cabin Class")
                    .foregroundColor(.gray)
                
                FlowLayout(spacing: 8) {
                    ForEach(CabinClass.allCases, id: \.self) { cabinClass in
                        CabinClassButton(
                            title: cabinClass.rawValue,
                            isSelected: selectedClass == cabinClass,
                            action: { selectedClass = cabinClass }
                        )
                    }
                }
            }
            
            Spacer()
            
            // Done Button
            Button(action: { dismiss() }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
    }
}

struct PassengerCounter: View {
    let title: String
    let subtitle: String
    @Binding var count: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            HStack(spacing: 16) {
                Button(action: { if count > 0 { count -= 1 } }) {
                    Image(systemName: "minus")
                        .padding(8)
                        .background(Color.blue.opacity(0.2))
                        .foregroundColor(.blue)
                        .clipShape(Circle())
                }
                
                Text("\(count)")
                    .font(.headline)
                    .frame(minWidth: 30)
                
                Button(action: { count += 1 }) {
                    Image(systemName: "plus")
                        .padding(8)
                        .background(Color.blue.opacity(0.2))
                        .foregroundColor(.blue)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
    }
}

struct CabinClassButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue : Color(UIColor.systemGray6))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for row in result.rows {
            for item in row {
                item.view.place(at: CGPoint(x: item.x + bounds.minX, y: item.y + bounds.minY),
                              proposal: ProposedViewSize(item.size))
            }
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var rows: [[Item]] = []
        
        struct Item {
            let view: LayoutSubview
            var size: CGSize
            var x: CGFloat
            var y: CGFloat
        }
        
        init(in maxWidth: CGFloat, subviews: LayoutSubviews, spacing: CGFloat) {
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var row: [Item] = []
            var maxHeight: CGFloat = 0
            
            for view in subviews {
                let viewSize = view.sizeThatFits(.unspecified)
                if currentX + viewSize.width > maxWidth && !row.isEmpty {
                    size.width = max(size.width, currentX - spacing)
                    currentX = 0
                    currentY += maxHeight + spacing
                    rows.append(row)
                    row = []
                    maxHeight = 0
                }
                
                row.append(Item(view: view, size: viewSize, x: currentX, y: currentY))
                currentX += viewSize.width + spacing
                maxHeight = max(maxHeight, viewSize.height)
            }
            
            if !row.isEmpty {
                rows.append(row)
                size.width = max(size.width, currentX - spacing)
                currentY += maxHeight
            }
            
            size.height = currentY
        }
    }
}

#Preview {
    TravelerClassSheet()
}
