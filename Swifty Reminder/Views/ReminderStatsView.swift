//
//  SwiftUIView.swift
//  Swifty Reminder
//
//  Created by Aman Bind on 01/10/23.
//

import SwiftUI

struct ReminderStatsView: View {
    
    let icon: String
    let title: String
    let count: Int?
    let iconColor: Color
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Image(systemName: icon)
                        .foregroundColor(iconColor)
                        .font(.title)
                    Text(title)
                        .opacity(0.8)
                }
                Spacer()
                if let count = count {
                    Text("\(count)")
                        .font(.largeTitle)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
            
            
        }
    }
}

#Preview {
    ReminderStatsView(icon: "calendar", title: "Title", count: 5, iconColor: .blue)
}
