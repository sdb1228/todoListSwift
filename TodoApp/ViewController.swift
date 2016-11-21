//
//  ViewController.swift
//  TodoApp
//
//  Created by steven burnett on 11/20/16.
//  Copyright © 2016 steven burnett. All rights reserved.
//

import UIKit

struct cellData {
    var cell : Int!
    var text : String!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        arrayOfCellData = [cellData(cell : 1, text: "asdfasdfasdfasd"), cellData(cell : 2, text: "123123123123"), cellData(cell : 1, text: "czxvxcvzxcvxzc")]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if arrayOfCellData[indexPath.row].cell == 2 {
            arrayOfCellData[indexPath.row].cell = 1
        }
        else {
            arrayOfCellData[indexPath.row].cell = 2
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "CELL")
        }
        
        
        // we know that cell is not empty now so we use ! to force unwrapping but you could also define cell as
        // let cell = (tableView.dequeue... as? UITableViewCell) ?? UITableViewCell(style: ...)
        if arrayOfCellData[indexPath.row].cell == 1 {
            cell?.backgroundColor = UIColor.blue
        }
        else
        {
            cell?.backgroundColor = UIColor.white
        }
        
        cell!.textLabel?.text = "Baking Soda"
        cell!.detailTextLabel?.text = "1/2 cup"
        
        cell!.textLabel?.text = "Hello World"
        
        return cell!
    }
}

