//
//  Item.swift
//  Checklist
//
//  Created by Anthony on 11/05/2018.
//  Copyright © 2018 Anthony. All rights reserved.
//

import Foundation

class Item{
    var texte:String
    var statutFait:Bool
    
    init(texte:String){
        self.texte = texte
        self.statutFait = false
    }
    
    func changerStatut() {
        self.statutFait = self.statutFait ? false : true 
    }
}
