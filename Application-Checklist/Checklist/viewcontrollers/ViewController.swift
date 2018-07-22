//
//  ViewController.swift
//  Checklist
//
//  Created by Anthony on 10/05/2018.
//  Copyright © 2018 Anthony. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let identifiant = "checklistCell"
    var liste:Liste?
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var checklistTableView: UITableView!
    
    @IBAction func ajouterItemAction(_ sender: UIBarButtonItem) {
        alertDialog()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checklistTableView.dataSource = self
        checklistTableView.delegate = self
        liste = Liste(items: [])
        telechargerEtMaj()
    }
    
    func afficherListe() -> [Item] {
        var items:[Item] = []
        for i in 1...10{
            let item = Item(texte: "item : \(i)")
            items.append(item)
        }
        return items
    }

    // Methodes UITableViewDatasource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste!.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifiant, for: indexPath)
        
        let item = liste?.items[indexPath.row]
        
        item?.changerStyle(item: item!, cell: cell)
        
        return cell
        
    }
    
    
    // Methodes UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        let item = liste!.items[indexPath.row]
        item.changerStatut()
        liste?.sauvegarderItems(items: liste!.items, defaults: defaults)
        telechargerEtMaj()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            liste!.supprimerItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
            liste?.sauvegarderItems(items: liste!.items, defaults: defaults)
            telechargerEtMaj()
        } else {
            
        }
    }
    
}

extension ViewController {
    
    func alertDialog() {
        let alert = UIAlertController(title: "Ajouter Item", message: "", preferredStyle: .alert)
        
        let annulerAction = UIAlertAction(title: "Annuler", style: .cancel) { (action) in
            print("action annuler")
        }
        
        let ajouterAction = UIAlertAction(title: "Ajouter", style: .default) { (action) in
            let itemText = alert.textFields![0].text
            self.liste!.creerItem(item: itemText!, defaults: self.defaults)
            self.telechargerEtMaj()

        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "item"
        }
        
        alert.addAction(annulerAction)
        alert.addAction(ajouterAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func ajouterItemListe(texte:String){
        let item = Item(texte: texte)
        liste!.ajouterItem(item: item)
        checklistTableView.reloadData()
    }
    

    
    func telechargerEtMaj() {
        self.liste!.items = self.liste!.telechargerItems(defaults:defaults)
        self.checklistTableView.reloadData()
    }
}

