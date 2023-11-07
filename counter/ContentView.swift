//
//  ContentView.swift
//  counter
//
//  Created by Montserrat Gomez on 2023-11-06.
//

import SwiftUI

enum counterStates {
	case noMultiple
	case multiple
}

struct ContentView: View {
	
	@State private var countOne: Int = 1
	@State private var countTwo: Int = 1
	@State private var state: counterStates = .noMultiple
	@State private var backgroundColor = LinearGradient(colors: [Color(hue: 0.659, saturation: 0.24, brightness: 0.987), Color.white], startPoint: .top, endPoint: .bottom)
	
	var body: some View {
		NavigationStack{
			VStack(alignment: .center, spacing:0) {
				Spacer()
				
				HStack(spacing: 30){
					Buttons(countOne: $countOne, countTwo: $countTwo, state: $state, backgroundColor: $backgroundColor)
					Buttons(countOne: $countTwo, countTwo: $countOne, state: $state, backgroundColor: $backgroundColor)
				}
				
				Spacer()
				
				switch state{
					
				case .noMultiple:
					Text("They are not multiples")
					
				case .multiple:
					Text("They are multiples")
					
				}
			}
			.navigationTitle("Multiples")
			.padding()
			.frame(width: 400, alignment: .center)
			.background(backgroundColor)
			.toolbar(content: {
				ToolbarItem(){
					Button("Reset"){
						countOne = 1
						countTwo = 1
					}
					.padding(20)
					.buttonStyle(.borderless)
					.font(.headline)
					.foregroundColor(.white)
					.bold()
				}
			})
		}
		
	}
	
}

#Preview {
	ContentView()
}

struct Buttons: View {
	
	@Binding var countOne: Int
	@Binding var countTwo: Int
	@Binding var state: counterStates
	@Binding var backgroundColor: LinearGradient
	
	var body: some View {
		VStack(spacing:0){
			
			Button{
				countOne = countOne + 1
				multiple(numberOne: countOne, numberTwo: countTwo)
			}
		label: {
			Image(systemName: "arrowtriangle.up.fill")
		}
		.padding(10)
		.buttonStyle(.borderless)
		.frame(width: 90)
		.background(Color(hue: 0.723, saturation: 0.044, brightness: 1.0, opacity: 0.614))
			
			Text("\(countOne)")
				.font(.title2)
				.frame(width: 90, height: 70)
				.background(Color(hue: 0.723, saturation: 0.044, brightness: 1.0, opacity: 0.614))
		}
		.border(Color.white, width: 1)
	}
	
	func multiple(numberOne: Int, numberTwo: Int){
		
		if(numberOne % numberTwo == 0 || numberTwo % numberOne == 0){
			backgroundColor = LinearGradient(colors: [Color.red, Color.white], startPoint: .top, endPoint: .bottom)
			state = .multiple
		} else{
			backgroundColor = LinearGradient(colors: [Color(hue: 0.659, saturation: 0.24, brightness: 0.987), Color.white], startPoint: .top, endPoint: .bottom)
			state = .noMultiple
		}
		
	}
}


