//
//  ContentView.swift
//  Bullseye
//
//  Created by Jacob Delmotte on 6/10/20.
//  Copyright © 2020 Jacob Delmotte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in:1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseyes as close as you can to:")
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                Text("\(target)")
            }
            Spacer()
            // Slider row
            HStack{
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
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
                return Alert(title: Text(alertTitle()), message: Text("The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRound()) points this round."
                ), dismissButton: .default(Text("Awesome!")) {
                    self.score = self.score + self.pointsForCurrentRound()
                    self.target = Int.random(in:1...100)
                    self.round = self.round + 1
                    })
            }
            Spacer()
            // Score row
            HStack {
                HStack {
                    Button(action: {
                        self.startNewGame()
                    }) {
                        Text("Start over")
                    }
                    Spacer()
                        Text("Score:")
                        Text("\(score)")
                    Spacer()
                        Text("Round:")
                        Text("\(round)")
                    Spacer()
                        Button(action: {}) {
                          Text("Info")
                    }
                }
                .padding(.bottom, 20)
            }
            .background(Image("Background"), alignment: .bottom)
        
        
        }
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
        }
        
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
        
    }
    
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
            }
        return title
                
            }
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
