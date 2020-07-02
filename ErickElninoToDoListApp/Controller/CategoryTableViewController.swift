//
//  CategoryTableViewController.swift
//  ErickElninoToDoListApp
//
//  Created by El nino Cholo on 2020/06/29.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import UIKit
import RealmSwift


class CategoryTableViewController: UITableViewController,UITextFieldDelegate {

    let realm = try! Realm()
    
    var mycategory: Results<Category>?
    
//    let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    
    override func viewDidLoad() {
        super.viewDidLoad()
            loadAllItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mycategory?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell", for: indexPath)
        cell.textLabel?.text = mycategory?[indexPath.row].name ?? "No categories was added yet"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "segue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"
        {
            let secondVC = segue.destination as! ListViewController
            if let myindexpath = sender as? Int
            {
                secondVC.categoryproptotype = mycategory?[myindexpath]
            }
        }
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem)
    {
        var textField:UITextField = UITextField()
        let alert = UIAlertController(title: "My Category", message: "Please Enter name of the new category ", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add", style: UIAlertAction.Style.default) { (erickcategory) in
            print(textField.text!)
            let erick = Category()
            erick.name = textField.text!
    
            self.save(mycategory: erick)
            
            
            
        }
        alert.addTextField { (ericktextcategory) in
            textField = ericktextcategory
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func save(mycategory:Category)
    {
        do
        {
            try realm.write
            {
                realm.add(mycategory)
            }
            
        }catch
        {
            
            print("There was an error while trying to save",error)
        }
        tableView.reloadData()
    }
    
    func loadAllItems()
    {
         mycategory = realm.objects(Category.self)
        

        tableView.reloadData()

    }
    
    
}
