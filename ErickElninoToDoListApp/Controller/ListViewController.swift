//
//  ViewController.swift
//  ErickElninoToDoListApp
//
//  Created by El nino Cholo on 2020/06/29.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UITableViewController,UITextFieldDelegate {
    
    @IBOutlet weak var searchbaritem: UISearchBar!
    
    
         var myList:Results<item>?
         let realm = try! Realm()
    var categoryproptotype:Category?
    {
        didSet
        {
            loadelement()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // searchbaritem.delegate = self
        
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myList?[indexPath.row].title ?? "There was no list"
        if myList?[indexPath.row].checked == true
        {
            cell.accessoryType = .checkmark
        }else
        {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let myitem = myList?[indexPath.row]
        {
            do
            {
                try realm.write
                {
                    myitem.checked = !myitem.checked
                    
                }
            }catch
            {
                print("There was an error while saving",error)
            }
        }
        
        
        
        
           tableView.reloadData()
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            if let myitem = myList?[indexPath.row]
            {
                do
                {
                    try realm.write
                    {
                        realm.delete(myitem)
                        
                    }
                }catch
                {
                    print("There was an error while saving",error)
                }
            }
            
            
            
        }

        tableView.reloadData()
    }
    
    @IBAction func Additems(_ sender: UIBarButtonItem)
    {
        var textField: UITextField = UITextField()
        let alert  =  UIAlertController(title: "You can item to List", message: "You can add any item ", preferredStyle: UIAlertController.Style.alert)
          let action  =  UIAlertAction(title: "Add", style: UIAlertAction.Style.default) { (erickaction) in
              print(textField.text!)
            if let currentCategory = self.categoryproptotype
            {
                do
                {
                    try self.realm.write
                {
                    let myitem = item()
                    myitem.title = textField.text!
                    currentCategory.myLists.append(myitem)
                    
                }
                }catch
                {
                    print("There was an error",error)
                }
            }
            self.tableView.reloadData()
         }
            alert.addTextField { (erickField) in
            textField = erickField
        }
        alert.addAction(action)
       self.present(alert, animated: true, completion: nil)
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete
//        {
//            context.delete(myList[indexPath.row])
//            savedata()
//            loadelement()
//        }
//    }
//
//
   
    func loadelement()
    {
        myList = categoryproptotype?.myLists.sorted(byKeyPath: "title", ascending: true)
       
        tableView.reloadData()

    }




}
//extension ListViewController : UISearchBarDelegate
//{
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
//    {
//        let request:NSFetchRequest<List> = List.fetchRequest()
//        let predicate  = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//        let sortdescripto = NSSortDescriptor(key: "title", ascending: true)
//        request.sortDescriptors = [sortdescripto]
//        loadelement(request: request ,predicate:predicate)
//
//    }
//
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        if searchbaritem.text!.count == 0
//        {
//            DispatchQueue.main.async
//            {
//                self.searchbaritem.resignFirstResponder()
//                self.loadelement()
//            }
//
//        }
//
//    }
//
//}

