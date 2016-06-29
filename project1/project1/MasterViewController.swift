//
//  MasterViewController.swift
//  project1
//
//  Created by Chris Jordan on 08/06/2016.
//  Copyright © 2016 Chris Jordan. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var imageViewController: DetailViewController? = nil
    var imagePaths = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        let fileManager = NSFileManager.defaultManager()
        let resourcePath = NSBundle.mainBundle().resourcePath!
        let files = try! fileManager.contentsOfDirectoryAtPath(resourcePath)
        
        for file in files {
            if file.hasPrefix("nssl") {
                imagePaths.append(file)
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedImage = imagePaths[indexPath.row]
                let navigationController = segue.destinationViewController as! UINavigationController
                let imageViewController = navigationController.topViewController as! DetailViewController
                imageViewController.selectedImageFilePath = selectedImage
                imageViewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                imageViewController.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagePaths.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let selectedPath = imagePaths[indexPath.row]
        cell.textLabel!.text = selectedPath
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
}

