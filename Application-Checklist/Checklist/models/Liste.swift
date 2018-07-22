//
//  Liste.swift
//  Checklist
//
//  Created by Anthony on 11/05/2018.
//  Copyright © 2018 Anthony. All rights reserved.
//

import Foundation

class Liste{
    var items:[Item]
    
    init(items:[Item]){
        self.items = items
    }
    
    func ajouterItem(item:Item){
        self.items.append(item)
    }
    
    func supprimerItem(index:Int){
        self.items.remove(at: index)
    }
}
