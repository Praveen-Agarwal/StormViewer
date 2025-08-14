//
//  ViewController.swift
//  Project1
//
//  Created by Praveen Agarwal on 14/08/25.
//

import UIKit

// To embed any viewController inside NavigationViewController:
// Editor -> Embed In -> NavigationViewController

// To make initial view controller go to attribute inspector there you will find an option

class ViewController: UITableViewController {
    var pictures: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! // No issue here with exclamation mark as for iOS apps this will always have a path.
        let items = try! fm.contentsOfDirectory(atPath: path)
        // Here as well its safe to use try! as this path must have contents otherwise our app is already in some fundamental problem.
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

