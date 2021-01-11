//
//  InputModeControl.swift
//  Developer
//
//  Created by HG on 2021/01/11.
//

import SwiftUI

struct InputModeControl: UIViewRepresentable {
    typealias UIViewType = UIControl
        
    var action: Selector
    
    func makeUIView(context: Context) -> UIViewType {
        let control = UIControl(frame: .zero)
        control.addTarget(context.coordinator, action: action, for: .allTouchEvents)
        return control
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
