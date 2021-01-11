//
//  InputViewModel.swift
//  Developer
//
//  Created by HG on 2021/01/11.
//

import UIKit

class InputViewModel: ObservableObject {
    // Published UITextDocumentProxy properties
    @Published var documentContextBeforeInput: String?
    @Published var documentContextAfterInput: String?
    @Published var selectedText: String?
    @Published var documentInputMode: UITextInputMode?
    
    // Published UIInputViewController properties
    @Published var primaryLanguage: String?
    @Published var hasDictationKey: Bool
    @Published var hasFullAccess: Bool
    @Published var needsInputModeSwitchKey: Bool
    
    // UIInputViewController
    var inputViewController: UIInputViewController?
    
    init(
        hasDictationKey: Bool,
        hasFullAccess: Bool,
        needsInputModeSwitchKey: Bool
    ) {
        self.hasDictationKey = hasDictationKey
        self.hasFullAccess = hasFullAccess
        self.needsInputModeSwitchKey = needsInputModeSwitchKey
    }
}
