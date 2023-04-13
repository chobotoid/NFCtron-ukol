//
//  TimeCountdownView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 13.04.2023.
//

import SwiftUI

struct TimeCountdownView: View {
        
    let dateString: String
    let dateFormatter = DateFormatter()
    
    @State private var timeRemaining: TimeInterval = 0
    
    init(dateString: String) {
        self.dateString = dateString
    }
    
    var body: some View {
        VStack {
            if(dateString != ""){
                if timeRemaining > 0 {
                    Text("\(timeString(timeRemaining))")
                        .font(.caption)
                } else {
                    Text("\(daysSinceDateString(dateString)) days ago")
                        .font(.caption)
                }                
            }
            else{
                Text("")
                    .font(.caption)
            }
        }
        .onAppear {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            if let date = dateFormatter.date(from: dateString) {
                timeRemaining = date.timeIntervalSinceNow
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    timeRemaining -= 1
                    if timeRemaining <= 0 {
                        timer.invalidate()
                    }
                }
            }
        }
    }
    
    func timeString(_ time: TimeInterval) -> String {
        let days = Int(time) / 86400
        let hours = Int(time) / 3600 % 24
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
    }
    
    func daysSinceDateString(_ dateString: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: date, to: Date())
            return components.day ?? 0
        }
        return 0
    }
}

struct TimeCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        TimeCountdownView(dateString: "2015-12-19T04:57:00.000Z")
    }
}
