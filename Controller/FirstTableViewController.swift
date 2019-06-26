//
//  FirstTableViewController.swift
//  Line Profile
//
//  Created by Henry on 2019/6/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import UIKit

class FirstTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var data = [
        ["Profile","Account","Privacy","Account transfer"],
        ["Stickers","Themes","Coins"],
        ["Notificiations","Photos & videos","Chats","Calls","Friends","Timeline"]
    ]
    
    var icon = [
        ["個人檔案","帳號","隱私","移動帳號","keep"],
        ["貼圖","主題","代幣"],
        ["提醒","照片","聊天","通話","好友","貼文串"]
    ]
      
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "LineTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "line")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = LineTableViewCell()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        return view
    }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "line", for: indexPath) as! LineTableViewCell
        cell.dataLabel.text = data[indexPath.section][indexPath.row]
        cell.iconImage.image = UIImage(named: icon[indexPath.section][indexPath.row])


        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) && (indexPath.row == 0){
            performSegue(withIdentifier: "passSVC", sender: nil)
        }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let destination = storyboard.instantiateViewController(withIdentifier: "SVC") as! SecondViewController
//        self.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
    
    
    
    

}
