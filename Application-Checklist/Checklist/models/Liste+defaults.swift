//
//  Liste+defaults.swift
//  Checklist
//
//  Created by Anthony on 11/05/2018.
//  Copyright © 2018 Anthony. All rights reserved.
//

import Foundation

extension Liste {
    
    func creerItem(item:String, defaults:UserDefaults) {
        
        var itemsSauvegardes:[Dictionary<String,Any>] = []
        let nouvoItem = ["texte": item, "status": 0] as [String : Any]
        
        //on vérifie les items existants dans defaults
        if let items = defaults.object(forKey:"items") as? [Dictionary<String,Any>] {
            itemsSauvegardes = items
        }
        
        //le nouvel item ajouté
        itemsSauvegardes.append(nouvoItem)
        
        defaults.set(itemsSauvegardes, forKey: "items")
    }
    
    func sauvegarderItems(items:[Item], defaults:UserDefaults) {
        var itemsSauvegardes:[Dictionary<String,Any>] = []
        
        for item in items {
            let i = ["texte": item.texte, "status": setStatus(item: item)] as [String : Any]
            itemsSauvegardes.append(i)
        }
        defaults.set(itemsSauvegardes, forKey: "items")
    }
    
    func telechargerItems(defaults:UserDefaults) -> [Item] {
        var items:[Item] = []
        
        if let itemsArray = defaults.object(forKey: "items") as? [Dictionary<String, Any>] {
            for item in itemsArray {
                let i = Item(texte: item["texte"] as! String)
                i.statutFait = getStatus(itemValue: item["status"] as! Int)
                items.append(i)
            }
        }
        
        return items
    }
    
    func setStatus(item:Item) -> Int {
        let statutValue = item.statutFait ? 1 : 0
        return statutValue
    }
    
    func getStatus(itemValue:Int) -> Bool {
        let status = itemValue == 1 ? true : false
        return status
    }
    
}

