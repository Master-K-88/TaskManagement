//
//  Home.swift
//  TaskMgmtApp
//
//  Created by Oko-osi Korede on 31/07/2023.
//

import SwiftUI

struct Home: View {
    /// Task management properties
    @State private var currentDate: Date = .init()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex: Int = 1
    @State private var createWeek: Bool = false
    /// Animation Namespace
    @Namespace private var animation
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
        }
        .vSpacing(.top)
        .onAppear {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                
                if let firsDate = currentWeek.first?.date {
                    weekSlider.append(firsDate.createPreviousWeek())
                }
                
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
            }
        }
    }
    
    /// Header View
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundStyle(.gray)
                
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            
            /// Week Slider
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) { index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .padding(.horizontal, 15)
                        .tag(index)
                }
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing) {
            Button(action: { }) {
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle.init())
            }
        }
        .padding(15)
        .background(.white)
    }
    
    /// Week View
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View  {
        HStack(spacing: 0) {
            ForEach(week) {day in
                VStack(spacing: 8) {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .gray)
                        .frame(width: 35, height: 35)
                        .background {
                            if isSameDate(day.date, currentDate) {
                                Circle()
                                    .fill(Color.blue.opacity(0.9))
//                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                            }
                            
                            /// Indicator to show, which is Today's Date
                            if day.date.isToday {
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                            }
                        }
                        .background(.white.shadow(.drop(radius: 1)), in: Circle.init())
                }
                .hSpacing(.center)
                .contentShape(Rectangle())
                .onTapGesture {
                    /// Updating Current Date
                    withAnimation(.easeIn(duration: 0.5)) {
                        currentDate = day.date
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
