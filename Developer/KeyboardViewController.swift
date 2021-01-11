//
//  KeyboardViewController.swift
//  Developer
//
//  Created by HG on 2021/01/11.
//

import UIKit
import SwiftUIX

class KeyboardViewController: UIInputViewController {
    var model: InputViewModel?
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = InputViewModel(
            hasDictationKey: self.hasDictationKey,
            hasFullAccess: self.hasFullAccess,
            needsInputModeSwitchKey: self.needsInputModeSwitchKey
        )
        guard let model = model else {
            fatalError("Unable to initialize InputViewModel()")
        }
        model.inputViewController = self
        
        let hostingContentView = UIHostingView(rootView: KeyboardView().environmentObject(model))
        hostingContentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(hostingContentView)

        hostingContentView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        hostingContentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        hostingContentView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        hostingContentView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
    func updateModel() {
        // UITextDocumentProxy
        let proxy = self.textDocumentProxy
        model?.documentContextBeforeInput = proxy.documentContextBeforeInput
        model?.documentContextAfterInput = proxy.documentContextAfterInput
        model?.selectedText = proxy.selectedText
        model?.documentInputMode = proxy.documentInputMode
        
        // UIInputViewController
        model?.primaryLanguage = self.primaryLanguage
        model?.hasDictationKey = self.hasDictationKey
        model?.hasFullAccess = self.hasFullAccess
        model?.needsInputModeSwitchKey = self.needsInputModeSwitchKey
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateModel()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

}
