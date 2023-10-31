//
//  ContentView.swift
//  Memorize
//
//  Created by Tim Li on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var theme: String = "Sport"
    let cardsByTheme = [
        "Sport": [
            "figure.archery",
            "figure.basketball",
            "figure.skiing.downhill",
            "figure.soccer",
            "figure.tennis",
            "figure.outdoor.cycle",
            "figure.open.water.swim"
        ],
        "Transport": [
            "bus",
            "tram",
            "airplane",
            "car",
            "ferry",
            "scooter"
        ],
        "Weather": [
            "sun.rain.fill",
            "sun.snow",
            "cloud",
            "cloud.drizzle",
            "cloud.fog",
            "cloud.sun.fill"
        ]
        
    ]
    
    var body: some View {
        VStack {
            title
            Spacer()
            cards
            Spacer()
            controller
            
        }
        .padding()
    }
    
    var title: some View {
        IconView(icon: "brain.head.profile", label: "Memorize", isVertical: false)
        .font(.largeTitle)
        .foregroundColor(.indigo)
        .padding()
    }
    
    var cards: some View {
        var emojis = cardsByTheme[theme] ?? []
        emojis = emojis + emojis
        emojis.shuffle()
        return ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(emojis.indices, id: \.self) { index in
                    CardView(icon: emojis[index])
                }
            }
        }
    }
    
    var controller: some View {
        
        HStack {
            controllerTab(icon: "figure.run", label: "Sport")
            Spacer()
            controllerTab(icon: "car", label: "Transport")
            Spacer()
            controllerTab(icon: "sun.max", label: "Weather")
        }
        .font(.title2)
        .foregroundColor(.indigo)
        .padding()
    }
    
    func controllerTab(icon: String, label: String) -> some View {
        IconView(icon: icon, label: label)
            .onTapGesture {
                theme = label
            }
    }
}
    


struct CardView: View {
    let icon: String
    @State var isFaceDown = true
    
    var body: some View {
        let box = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        ZStack {
            box.stroke(.orange, lineWidth: 2)
            IconView(icon: icon).font(.largeTitle)
            if (isFaceDown) {
                box.fill(.orange)
                    
            }
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .onTapGesture {
            isFaceDown = !isFaceDown
        }
    }
}

struct IconView: View {
    
    let icon: String
    var label: String?
    var isVertical = true
    
    var body: some View {
        Group {
            if (isVertical) {
                VStack {
                    bodyContent
                }
            } else {
                HStack {
                    bodyContent
                }
            }
        }
    }
    
    
    var bodyContent: some View {
        Group {
            Image(systemName: icon)
            
            if (label != nil) {
                Text(label!)
            }
        }
    }
}
    
#Preview {
    ContentView()
}
