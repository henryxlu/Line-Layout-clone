//
//  SecondViewController.swift
//  Line Profile
//
//  Created by Henry on 2019/6/25.
//  Copyright © 2019 Henry. All rights reserved.
//

import UIKit


//protocol PassDatadelegate {
//    func passdata (_ data:String)
//}

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SendDataBackDelegate {
    
    
    
    var data = SecondData()
    
//    var data = [Data]()

//    enum Sections: CaseIterable {
//        case firstSection
//        case secondSection
//        case thirdSection
//    }
//
    
    
    
    
    
//    let sections = Section.allCases
    
//    let firstSection = [
//        Data(title: "Display name", contain: "Ivy"),
//        Data(title: "Status", contain: "Hello!"),
//        Data(title: "Phone number", contain: "+886")
//    ]
//
//    let secondSection = [Data(title: "", contain: "Share profile media updates")]
//
//    let thirdSection = [Data(title: "Share profile media updates on Timeline.", contain: "")]
//
//    let fourthSection = [
//        Data(title: "", contain: "LINE ID"),
//        Data(title: "", contain: "Allow others to add me by ID")
//        ]
//
//    let fifthSection = [Data(title: "", contain: "My QR code")]
    
   
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var littlePhoto: UIImageView!
    @IBOutlet weak var littlephoto2: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.image = UIImage(named: "background")
        photo.image = UIImage(named: "photo")
        littlePhoto.image = UIImage(named: "icon")
        littlephoto2.image = UIImage(named: "icon")
        photo.layer.cornerRadius = 20
        
        let nib = UINib(nibName: "SecondTableViewCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "profilecell")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return data.main.count
        case 1:
            return data.share.count
        case 2:
            return data.title2.count
        case 3:
            return data.id.count
        default:
            return data.qrcode.count
        }
        
        }
//        switch section {
//        case 0 :
//            return firstSection.count
//        case 1 :
//            return secondSection.count
//        case 2 :
//            return thirdSection.count
//        case 3 :
//            return fourthSection.count
//        default:
//            return fifthSection.count
//        }
//        let mySection = sections[section]
//        switch mySection {
//        case .firstSection :
//            return firstSection.count
//        case .secondSection :
//            return secondSection.count
//        case .thirdSection :
//            return thirdSection.count
//        case 3 :
//            return fourthSection.count
//        default:
//            return fifthSection.count
//        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "profilecell", for: indexPath) as! SecondTableViewCell
        let SwitchView = UISwitch()
        
        //  寫enum取代數字
        if indexPath.section == 0{
            cell.titalLabel.text = data.title[indexPath.row]
            cell.containLabel.text = data.main[indexPath.row]
            cell.accessoryType = .disclosureIndicator
        }
        if indexPath.section == 1{
            cell.containLabel.text = data.share[indexPath.row]
            cell.accessoryView = SwitchView
        }
        if indexPath.section == 2{
            cell.titalLabel.text = data.title2[indexPath.row]
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        if indexPath.section == 3{
            cell.containLabel.text = data.id[indexPath.row]
            if indexPath.row == 0 {
                cell.idLabel.text = "lineid"
            }
            if indexPath.row == 1 {
                cell.accessoryView = SwitchView
            }
        }
        if indexPath.section == 4{
            cell.containLabel.text = data.qrcode[indexPath.row]
            cell.accessoryType = .disclosureIndicator
        }
        if indexPath.section == 2 && indexPath.row == 1{
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let rect = CGRect(x: 0 , y: 0, width: 0, height: 0)
//        if section == 2 {
//            return UIView.init(frame: rect)
//        }
        
        let view = SecondTableViewCell()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var footerHeight: CGFloat = 40
        if section == 2 || section == 1{
            footerHeight = 0
        }
        return footerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            //傳值方法1：需搭配segue，純傳畫面不做事，傳畫面後做動作需要配合prepare for segue
            //performSegue(withIdentifier: "passTVC", sender: nil)
            
            //傳值方法2：直接判斷畫面直接傳過去
            let thirdVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "TVC") as!ThirdViewController
            thirdVC.name = data.main[0]
            //delegate需指定
            thirdVC.delegate = self
            self.navigationController?.pushViewController(thirdVC, animated: true)
            
            
        }
        
    }
    
    func passName(name: String) {
        data.main[0] = name
        //cell需要relode資料才能更新資訊，也可寫在viewwillappear
        tableview.reloadData()
    }
    
    //傳值方法1：需搭配performsegue傳入的畫面帶資料
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let thirdVC = segue.destination as? ThirdViewController {
    //            thirdVC.name = data.main[0]
    //        }
    //    }
    
}
