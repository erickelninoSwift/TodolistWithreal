//
//  CategoryTableViewController.swift
//  ErickElninoToDoListApp
//
//  Created by El nino Cholo on 2020/06/29.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import UIKit
import CoreData


class CategoryTableViewController: UITableViewController,UITextFieldDelegate {

    
    var mycategory:[Category] = [Category]()
    
    let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mycategory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell", for: indexPath)
        cell.textLabel?.text = mycategory[indexPath.row].name
        
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
                secondVC.categoryproptotype = mycategory[myindexpath]
            }
        }
    }
    
    @IBAction func addCategory(_ sender: UIBarButtonItem)
    {
        var textField:UITextField = UITextField()
        let alert = UIAlertController(title: "My Category", message: "Please Enter name of the new category ", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Add", style: UIAlertAction.Style.default) { (erickcategory) in
            print(textField.text!)
            let erick = Category(context: self.myContext)
            erick.name = textField.text!
            self.mycategory.append(erick)
            self.saveData()
            
            
            
        }
        alert.addTextField { (ericktextcategory) in
            textField = ericktextcategory
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveData()
    {
        do
        {
            try myContext.save()
            
        }catch
        {
            
            print("There was an error while trying to save",error)
        }
        tableView.reloadData()
    }
    
    func loadAllItems(request:NSFetchRequest<Category> = Category.fetchRequest())
    {
        do
        {
           mycategory = try myContext.fetch(request)
            
        }catch
        {
            print("There was an error while retreiving data",error)
        }
        
        tableView.reloadData()
        
    }
    
    
}
