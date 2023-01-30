//
//  ChartSwiftUIView.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import SwiftUI
import Charts

struct ChartSwiftUIView: View {
    @EnvironmentObject private var priceChange: ChartData
    @State private var currentActiveItem: ChartViewModel?
    
    var body: some View {
       
            Text("Price for a Month")
                .foregroundColor(.white)
                .font(.title3).fontWeight(.bold)
                .padding(.bottom, 20)
            
            if let price = priceChange.priceChange {
                Chart(price) { day in
                    LineMark(x: .value("Day", day.date), y: .value("Price", day.price)).foregroundStyle(Color.white.gradient.opacity(0.7)).foregroundStyle(.white)
                    PointMark(x: .value("Day", day.date), y: .value("Price", day.price)).foregroundStyle(Color.white.gradient)
                    
                }
                .chartXAxis {
                    AxisMarks(preset: .aligned, values: price.map { $0.date}) { date in
                        AxisGridLine().foregroundStyle(.gray)
                        AxisValueLabel(format: .dateTime.month().day())
                            .foregroundStyle(.white)
                        
                    }
                    
                    
                }
                .chartYAxis {
                    AxisMarks(preset: .aligned) { price in
                        AxisGridLine().foregroundStyle(.gray)
                        AxisValueLabel().foregroundStyle(.white)
                    }
                }
                
                .padding(.all, 25)
                .frame(width: ItemViewInset.itemWidth, height: 200)
                .background(LinearGradient(colors:[ Color("darkPurpleColor"), Color("purpleColor")], startPoint: .topTrailing, endPoint: .bottomLeading).opacity(0.6))
                .cornerRadius(8)
            }
        }
    }


struct ChartSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChartSwiftUIView()
      
    }
}

class ChartData: ObservableObject {
    @Published var priceChange: [ChartViewModel]?
}
