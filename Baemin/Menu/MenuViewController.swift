//
//  MenuViewController.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/26.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bottomSheetTapped(_ sender: Any) {
            let bottomSheetVC = BottomSheetViewController(contentViewController: LocationSettingViewController())
            bottomSheetVC.modalPresentationStyle = .overFullScreen
            self.present(bottomSheetVC, animated: false, completion: nil)
    }
    
    @IBOutlet weak var tabbar: TopTabbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabbar()
    }

    private func setTabbar() {
        if #available(iOS 11.0, *) {
            tabbar.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        let list : [String] = ["배달", "배민1", "포장", "비마트", "쇼핑라이브", "선물하기", "전국별미"]
        
        self.tabbar.buttonWidth = 100
        self.tabbar.moveDuration = 0.4
        self.tabbar.fontSize = 16.0
        
        self.tabbar.configureTopTabbar(titleList: list) { (index) -> (Void) in
            print(list[index])
            
            
        }
    }
}
