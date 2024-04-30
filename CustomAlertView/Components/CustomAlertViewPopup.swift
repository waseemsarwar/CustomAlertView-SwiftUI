//
//  CustomAlertViewPopup.swift
//  CustomAlertView
//
//  Created by Waseem on 30/04/2024.
//

import Combine
import SwiftUI

/// Alert type
enum CustomAlertViewPopupAlertType {
    
    case success(title: String, message: String = "", leftActionText:String = "", rightActionText:String = "OK")
    case error(title: String, message: String = "", leftActionText:String = "", rightActionText:String = "OK")
    
    func title() -> String {
        switch self {
        case .success(title: let title, _, _, _):
            return title
        case .error(title: let title, _, _, _):
            return title
        }
    }

    func message() -> String {
        switch self {
        case .success(_, message: let message, _, _):
            return message
        case .error(_, message: let message, _, _):
            return message
        }
    }
    
    var leftActionText: String {
        switch self {
        case .success(_, _, let title, _):
            return title
        case .error(_, _, let title, _):
            return title
        }
    }
    
    var rightActionText: String {
        switch self {
        case .success(_, _, _, let title):
            return title
        case .error(_, _, _, let title):
            return title
        }
    }
    
}

struct CustomAlertViewPopup: View {
    
    @Binding var presentAlert: Bool
    @State var alertType: CustomAlertViewPopupAlertType = .success(title: "Hang On!")
    @State private var textHeight: CGFloat = .zero
    
    var isShowVerticalButtons = false
    let verticalButtonsHeight: CGFloat = 80
    var leftButtonAction: (() -> ())?
    var rightButtonAction: (() -> ())?

    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                // faded background
                Color.black.opacity(0.75)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    if alertType.title() != "" {
                        // alert title
                        Text(alertType.title())
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(height: 25)
                            .padding(.top, 16)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16)
                    }
                    
                    // alert message
                    ScrollView {
                        Text(alertType.message())
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                            .minimumScaleFactor(0.5)
                            .background(GeometryReader { proxy in
                                Color.clear
                                    .onAppear {
                                        self.textHeight = proxy.size.height
                                    }
                            })
                    }
                    .frame(height: min(min(self.textHeight, geometry.size.height), 280))
                    
                    
                    Divider()
                        .frame(height: 0.5)
                        .background(Color.black)
                    
                    if !isShowVerticalButtons {
                        HStack(spacing: 0) {
                            // left button
                            if !alertType.leftActionText.isEmpty {
                                Button(action: {
                                    leftButtonAction?()
                                }) {
                                    Text(alertType.leftActionText)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
                                .frame(maxWidth: .infinity)
                                .contentShape(Rectangle())
                                .background(Color.white)
                                
                            }
                            
                            // right button (default)
                            Button(action: {
                                rightButtonAction?()
                            }) {
                                Text(alertType.rightActionText)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .contentShape(Rectangle())
                            .background(Color.white)
                            
                        }
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle()) // Make the entire area of the HStack tappable
                        .background(Color.white)
                    } else {
                        VStack(spacing: 0) {
                            // left button
                            Button(action: {
                                leftButtonAction?()
                            }) {
                                Text(alertType.leftActionText)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .contentShape(Rectangle())
                            .background(Color.white)
                            
                            
                            
                            Divider()
                            
                            // right button
                            Button(action: {
                                rightButtonAction?()
                            }) {
                                Text(alertType.rightActionText)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .contentShape(Rectangle())
                            .background(Color.white)
                            
                        }
                        .frame(height: verticalButtonsHeight)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                    }
                }
                .frame(width: 270)
                .background(Color.white)
                .cornerRadius(4)
                
            }
            .frame(height: geometry.size.height)
            .zIndex(2)
        }

    }
}
