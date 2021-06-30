//
//  ToastView.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//


import UIKit

class ToastView: UIView {
    
    //MARK: Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var msgLabel: UILabel!
    
    //MARK: Properties
    var viewHeight: CGFloat {
        let textString = (msgLabel.text ?? "") as NSString
        let textAttributes: [NSAttributedString.Key: Any] = [.font: msgLabel.font!]
        let estimatedTextHeight = textString.boundingRect(with: CGSize(width: 320, height: 2000), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil).height
        let height = estimatedTextHeight + 30
        return height
        
    }
    //MARK: Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
         commonInit()
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ToastView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
}
