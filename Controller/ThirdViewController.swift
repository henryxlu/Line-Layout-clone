//
//  ThirdViewController.swift
//  Line Profile
//
//  Created by Henry on 2019/6/26.
//  Copyright © 2019 Henry. All rights reserved.
//

import UIKit

protocol SendDataBackDelegate {
    func passName (name:String)
}


class ThirdViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    
    var name : String?
    var delegate:SendDataBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        textfield.text = name
    }
    
    @IBAction func saveName(_ sender: UIButton) {
        delegate?.passName(name: textfield.text!)
        navigationController?.popViewController(animated: true)
    }
    
    

}
