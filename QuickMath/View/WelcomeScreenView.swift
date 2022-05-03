//
//  WelcomeScreenView.swift
//  QuickMath
//
//  Created by MacOS on 03/05/2022.
//

import SwiftUI

struct WelcomeScreenView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
    
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 50){
                        Text("Welcome!")
                            .font(.system(size: 50)).bold()
                            .padding(.top)
                        
                        VStack(alignment: .leading){
                            Text("How it works?")
                                .font(.title)
                                .padding(.bottom, 10)
                            Text(" - Solve equasion")
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text("Depending on yur score you will be provided with equasion on diffrent difficulty level")
                                .padding(.leading, 20)
                        }
                        VStack(alignment: .leading){
                            Text(" - Be on time")
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text("For addition, subtraction and multiplication time limit is 10s , for the division, raising to the power and random it's 15s")
                                .padding(.leading, 20)
                        }
                        VStack(alignment: .leading){
                            Text(" - Pick equasion")
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text("You can change equasion in the settings")
                                .padding(.leading, 20)
                        }
                        VStack(alignment: .leading){
                            Text(" - Beat  your scores")
                                .font(.title2)
                                .foregroundColor(.blue)
                            Text("App saves your best scores to help you track your progress")
                                .padding(.leading, 20)
                        }
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("GOT IT!")
                                .font(.system(size: 20)).bold()
                                .frame(height: 50)
                                
                                .frame(maxWidth: .infinity)
                                .background(.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding()
                    .background(.black)
                .foregroundColor(.white)
                }
                .background(.black)
                .navigationBarHidden(true)
            }
    }
        
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}

