//
//  Item+formatage.swift
//  Checklist
//
//  Created by Anthony on 11/05/2018.
//  Copyright © 2018 Anthony. All rights reserved.
//

import Foundation
import UIKit

extension Item {
    
    public func changerStyle(item:Item, cell:UITableViewCell){
        item.statutFait ? surligner(texte: item.texte, cell) : nonSurligner(texte: item.texte, cell)
        cell.accessoryType = item.statutFait ? .checkmark : .none
    }
    
    private func surligner(texte:String,_ cell:UITableViewCell) {
        var stringFormatted:NSAttributedString?
        
        let attributs = [
            NSAttributedStringKey.foregroundColor: UIColor.gray, NSAttributedStringKey.strikethroughStyle: NSNumber(value:NSUnderlineStyle.styleSingle.rawValue)
        ]
        stringFormatted = NSAttributedString(string: texte, attributes: attributs)
        
        cell.textLabel?.attributedText = stringFormatted

    }
    
    private func nonSurligner(texte:String,_ cell:UITableViewCell) {
        var stringFormatted:NSAttributedString?
        
        let attributs = [
            NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.strikethroughStyle: NSNumber(value:0)
        ]
        stringFormatted = NSAttributedString(string: texte, attributes: attributs)
        
        cell.textLabel?.attributedText = stringFormatted
    }
}
