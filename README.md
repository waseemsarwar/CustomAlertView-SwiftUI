# Custom popup alert view
A custom popup alert view in the SwiftUi which can be easily customized according to the app requirements

## How to Use
![Simulator Screenshot - iPhone 15 Plus - 2024-04-30 at 17 08 41](https://github.com/waseemsarwar/CustomAlertView-SwiftUI/assets/1830438/fc3de4a6-dc9c-4ffc-84cd-7959adb14d11)
![Simulator Screenshot - iPhone 15 Plus - 2024-04-30 at 17 10 50](https://github.com/waseemsarwar/CustomAlertView-SwiftUI/assets/1830438/92b95e42-c095-4b72-84d7-727b1bff7d59)
![Simulator Screenshot - iPhone 15 Plus - 2024-04-30 at 17 30 51](https://github.com/waseemsarwar/CustomAlertView-SwiftUI/assets/1830438/184cf2b9-0ade-411e-bced-016c003361bc)

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
