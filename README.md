# Custom popup alert view
A custom popup alert view in the SwiftUi which can be easily customized according to the app requirements

## How to Use
If you don't want to show left button then leave `leftActionText` empty

```Swift
    ZStack{
        VStack {
            Button {
                showErrorAlert.toggle()
            } label: {
                Text("Show Error Alert")
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
    }
```
## Confirmation

```Swift
    CustomAlertViewPopup(presentAlert: $showErrorAlert, alertType: .error(title: "Confirm!", message: "Are you sure you want to delete this?",leftActionText: "Cancel", rightActionText: "Sure!"), isShowVerticalButtons: false){
        withAnimation{
            showConfirmationAlert.toggle()
        }
    } rightButtonAction: {
        withAnimation{
            showConfirmationAlert.toggle()
        }
    }
```
