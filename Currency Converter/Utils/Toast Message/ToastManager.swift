//
//  ToastManager.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import Foundation
import UIKit

enum ToastMessageKind {
    case info , error, success
}

class ToastManager {
    //MARK: Properties
    static let shared = ToastManager()
    private let window = (SceneDelegate.shared?.window)
    private var topAnchor: NSLayoutConstraint!
    private var messageHeaders: [ToastView?] = []
    
    //MARK: Methods
    private init() {}
    
    
    func showMessage(messageKind: ToastMessageKind, message: String, completion: (() -> Void)? = nil) {
        let messageHeader: ToastView? = ToastView()
        messageHeaders.forEach({
            hideBanner(messageHeaders: $0)
        })
        messageHeaders.append(messageHeader)
        setupView(messageHeader: messageHeader ?? ToastView(), messageKind: messageKind, message: message) 
        createBannerWithInitialPosition(messageHeader: messageHeader)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.hideBanner(messageHeaders: messageHeader)
            completion?()
        }
    }
    
    private func setupView(messageHeader: ToastView, messageKind: ToastMessageKind, message: String){
        switch messageKind {
        case .success:
            DispatchQueue.main.async {
                messageHeader.msgLabel.textColor = .black
                messageHeader.msgLabel.text = message
            }
        case .error:
            DispatchQueue.main.async { [weak self] in
                messageHeader.msgLabel.textColor = .white
                messageHeader.msgLabel.attributedText = self?.attributedText(title: message)
            }
        case .info:
            DispatchQueue.main.async {
                messageHeader.msgLabel.textColor = .yellow
                messageHeader.msgLabel.text = message
            }
        }
    }
    
   private func attributedText(title:String) -> NSMutableAttributedString {
    let boldFont = UIFont.boldSystemFont(ofSize: 14)
    let reqularFont = UIFont.systemFont(ofSize: 16)
        let nsString = NSString(string: title)
        let attributedString = NSMutableAttributedString(string: nsString as String, attributes: [NSAttributedString.Key.font:reqularFont, NSAttributedString.Key.foregroundColor: UIColor.black])
        let bodyAttribute = [NSAttributedString.Key.font: boldFont, NSAttributedString.Key.foregroundColor: UIColor.red]
        let nsRange = nsString.range(of: "Opps!")
        attributedString.addAttributes(bodyAttribute, range: nsRange)
        return attributedString
    }
    
    private func createBannerWithInitialPosition(messageHeader: ToastView?) {
        DispatchQueue.main.async { [weak self] in
            guard let messageHeader = messageHeader else { return }
            guard let window = self?.window else {return}
            messageHeader.layer.masksToBounds = true
            window.addSubview(messageHeader)
            let guide = window.safeAreaLayoutGuide
            messageHeader.translatesAutoresizingMaskIntoConstraints = false
            self?.topAnchor = messageHeader.topAnchor.constraint(equalTo: guide.topAnchor, constant: -100)
            self?.topAnchor.isActive = true 
            messageHeader.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            messageHeader.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            messageHeader.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            messageHeader.heightAnchor.constraint(equalToConstant: messageHeader.viewHeight).isActive = true
            window.layoutIfNeeded()
            self?.animateBannerPresentation()
        }
        
    }
    
    private func animateBannerPresentation() {
        topAnchor.constant = 0 
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [], animations: { [weak self] in self?.window!.layoutIfNeeded() }, completion: nil)
    }
    
    private func hideBanner(messageHeaders: ToastView?) {
        UIView.animate(withDuration: 0.5, animations: {
            messageHeaders?.alpha = 0
        }) { _ in
            messageHeaders?.removeFromSuperview()
        }
    }
}
