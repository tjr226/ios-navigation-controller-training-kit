//
//  ContactsTableViewController.swift
//  NavigationViewTrainingKit
//
//  Created by Timothy Rooney on 5/29/20.
//  Copyright © 2020 Timothy Rooney. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contacts: [String] =
        ["Jim",
        "Bob",
        "Pat"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact
         
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // WHAT info to pass?
        // WHERE to pass it to?
        
        if segue.identifier == "ShowContact" {
            // WHERE
            guard let contactDetailVC = segue.destination as? ContactsDetailViewController else { return }
            
            // WHAT
            
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            let contact = contacts[indexPath.row]
            
            contactDetailVC.contact = contact
            
        }
        
    }

}
