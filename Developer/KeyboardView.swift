//
//  KeyboardView.swift
//  Developer
//
//  Created by HG on 2021/01/11.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var inputViewModel: InputViewModel
    
    var body: some View {
        if let controller = inputViewModel.inputViewController {
            Text("Developer Keyboard")
            Button("Hello!") {
                controller.textDocumentProxy.insertText("Hello!")
            }
            HStack {
                if inputViewModel.needsInputModeSwitchKey {
                    ZStack {
                        Text("Next Keyboard")
                        InputModeControl(action: #selector(controller.handleInputModeList(from:with:)))
                    }
                    .fixedSize()
                }
                Spacer()
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}
