//
//  ContentView.swift
//  CustomAlertView
//
//  Created by Waseem on 30/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var showErrorAlert:Bool = false
    @State var showConfirmationAlert:Bool = false
    @State var showLogTextAlert:Bool = false
    
    var body: some View {
        ZStack{
            VStack {
                
                Button {
                    showErrorAlert.toggle()
                } label: {
                    Text("Show Error Alert")
                }
                .buttonStyle(OvalButtonStyle(backgroundColor: .blue, textColor: .white))
                
                Button {
                    showConfirmationAlert.toggle()
                } label: {
                    Text("Show Confirmation Alert")
                }
                .buttonStyle(OvalButtonStyle(backgroundColor: .red, textColor: .white))
                
                Button {
                    showLogTextAlert.toggle()
                } label: {
                    Text("Show Long Text Alert")
                }
                .buttonStyle(OvalButtonStyle(backgroundColor: .blue, textColor: .white))
                
            }
            
            if showErrorAlert{
                CustomAlertViewPopup(presentAlert: $showErrorAlert, alertType: .error(title: "Oops!", message: "You cannot make this bbooking in the app. Please contact the team directly for assistance.",leftActionText: ""), isShowVerticalButtons: false){
                    withAnimation{
                        showErrorAlert.toggle()
                    }
                } rightButtonAction: {
                    withAnimation{
                        showErrorAlert.toggle()
                    }
                }
            }
            
            if showConfirmationAlert{
                CustomAlertViewPopup(presentAlert: $showErrorAlert, alertType: .error(title: "Confirm!", message: "Are you sure you want to delete this?",leftActionText: "Cancel", rightActionText: "Sure!"), isShowVerticalButtons: false){
                    withAnimation{
                        showConfirmationAlert.toggle()
                    }
                } rightButtonAction: {
                    withAnimation{
                        showConfirmationAlert.toggle()
                    }
                }
            }
            
            if showLogTextAlert{
                CustomAlertViewPopup(presentAlert: $showErrorAlert, alertType: .success(title: "Hang On!", message: "Are you absolutely sure you want to proceed with this action? This action is irreversible and will permanently delete all associated data. Once deleted, it cannot be recovered. Please consider the consequences carefully before confirming. Are you absolutely sure you want to proceed with this action? This action is irreversible and will permanently delete all associated data. Once deleted, it cannot be recovered. Please consider the consequences carefully before confirming. Are you absolutely sure you want to proceed with this action? This action is irreversible and will permanently delete all associated data. Once deleted, it cannot be recovered. Please consider the consequences carefully before confirming. Are you absolutely sure you want to proceed with this action? This action is irreversible and will permanently delete all associated data. Once deleted, it cannot be recovered. Please consider the consequences carefully before confirming.",leftActionText: "Cancel", rightActionText: "Sure!"), isShowVerticalButtons: false){
                    withAnimation{
                        showLogTextAlert.toggle()
                    }
                } rightButtonAction: {
                    withAnimation{
                        showLogTextAlert.toggle()
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
