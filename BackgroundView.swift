//
//  BackgroundView.swift
//  Starbucks
//
//  Created by Nafeez Ahmed on 08/10/23.
//

import SwiftUI

struct BackgroundView: View {
    @State private var firstAnimation: Bool = false
    @State private var secondAnimation: Bool = false
    @State private var color : Bool = false
    @State private var logoAnimation: Bool = false
    @State private var logoAngle: Bool = false
    @State private var firstColor: Bool = false
    @State private var secondColor: Bool = false
    var body: some View {
        ZStack {
            LinearGradient(colors: [firstColor ?  Color("Green") :.white,.white,.white, secondColor ? Color("Green") : .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:0) {
                Circle()
                    .foregroundColor(Color.green.opacity(0.8))
                    .offset(y: firstAnimation ? 80 : -60)
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                            withAnimation(.spring, {
                                firstAnimation.toggle()
                            })
                        })
                    })
                    Circle()
                        .foregroundColor(color ? Color("Green") : .black)
                        
                        .offset(y: secondAnimation ? -300 : 35)
                        .onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                                withAnimation(.spring, {
                                    secondAnimation.toggle()
                                })
                            })
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                                withAnimation(.spring, {
                                    color.toggle()
                                })
                            })
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                                withAnimation(.spring, {
                                    firstColor.toggle()
                                })
                            })
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
                                withAnimation(.spring, {
                                    secondColor.toggle()
                                })
                            })
                            DispatchQueue.main.asyncAfter(deadline: .now() + 7, execute: {
                                withAnimation(.spring, {
                                    logoAnimation.toggle()
                                })
                            })
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8, execute: {
                                withAnimation(.spring, {
                                    logoAngle.toggle()
                                })
                            })

                        })
            }
            VStack(spacing:0) {
                Image("starbucks-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width:180,height: 70)
                    .offset(x :logoAnimation ? 0 : 400 , y : -120)
                    .rotationEffect(Angle(degrees:logoAngle ? 0 : 30))
                Text("STARBUCKS")
                    .font(.custom("Santana-Black", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .offset(y : -50)
            }
        }
    }
}

#Preview {
    BackgroundView()
}
