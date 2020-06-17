//
//  ContentView.swift
//  Bullseye
//
//  Created by Jacob Delmotte on 6/10/20.
//  Copyright © 2020 Jacob Delmotte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in:1...100)
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseyes as close as you can to:")
                Text("\(self.target)")
            }
            Spacer()
            // Slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            // Button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) {  () -> Alert in
                var roundedValue: Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue).\n" +
                    "You scored \(self.pointsForCurrentRound()) points this round."
                ), dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            // Score row
            HStack {
                HStack {
                    Button(action: {}) {
                        Text("Start over")
                    }
                    Spacer()
                        Text("Score:")
                        Text("999999")
                    Spacer()
                        Text("Round:")
                        Text("999")
                    Spacer()
                        Button(action: {}) {
                          Text("Info")
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
    
    func pointsForCurrentRound() -> Int {
        return 999
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
