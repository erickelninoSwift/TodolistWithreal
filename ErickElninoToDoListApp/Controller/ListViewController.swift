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
    
    
    var myList:[item] = [item]()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categoryproptotype:Category?
    {
        didSet
        {
           // loadelement()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // searchbaritem.delegate = self
        
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myList[indexPath.row].title
        if myList[indexPath.row].checked == true
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
         if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
         {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }else
         {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
         }
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            myList[indexPath.row].checked = true
            
        }else
        {
            myList[indexPath.row].checked = false
            
        }
        
        
       // savedata()
        
    }
    
    @IBAction func Additems(_ sender: UIBarButtonItem)
    {
        var textField:UITextField = UITextField()
        let alert  =  UIAlertController(title: "You can item to List", message: "You can add any item ", preferredStyle: UIAlertController.Style.alert)
//        let action  =  UIAlertAction(title: "Add", style: UIAlertAction.Style.default) { (erickaction) in
//            print(textField.text!)
//            let item = List(context: self.context)
//            item.title = textField.text!
//            item.done = false
//            item.listParent = self.categoryproptotype!
//            self.myList.append(item)
//            self.savedata()
        //}
////        alert.addTextField { (erickField) in
////            textField = erickField
//        }
        //alert.addAction(action)
       // self.present(alert, animated: true, completion: nil)
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
//    func savedata()
//    {
//        do
//        {
//            try context.save()
//
//        }catch
//        {
//            print("There was an error while trying to save the data",error)
//
//        }
//        tableView.reloadData()
//    }
//
//    func loadelement(request:NSFetchRequest<List> = List.fetchRequest(),predicate: NSPredicate? = nil)
//    {
//        let CategoryPredicate = NSPredicate(format: "listParent.name MATCHES %@",categoryproptotype!.name!)
//
//        if let predicateunwrapped = predicate
//        {
//            let compundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [CategoryPredicate,predicateunwrapped])
//            request.predicate = compundPredicate
//
//        }else
//        {
//            request.predicate = CategoryPredicate
//
//        }
//
//
//        do
//        {
//            myList = try context.fetch(request)
//
//        }catch
//        {
//            print("There was an Error while trying to get your data",error)
//        }
//        tableView.reloadData()
//
//    }
//
//


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

