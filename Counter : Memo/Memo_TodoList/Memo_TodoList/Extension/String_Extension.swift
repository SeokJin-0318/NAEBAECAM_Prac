//
//  String_Extension.swift
//  Memo_TodoList
//
//  Created by 석진 on 12/23/23.
//

import Foundation
import UIKit
extension String 
{
    func strikeThrough() -> NSAttributedString 
    {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
