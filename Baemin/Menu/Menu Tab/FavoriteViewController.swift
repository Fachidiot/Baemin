//
//  FavoriteViewController.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/29.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBAction func button_Back(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
