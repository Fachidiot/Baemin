//
//  LaunchViewViewController.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/24.
//

import UIKit

class LaunchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkDeviceNetworkStatus()
    }
    
    func checkDeviceNetworkStatus() {
        if(DeviceManager.shared.networkStatus) {
//            let MainStoryboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as UIViewController?
//            if let view = MainStoryboard {
//                view.modalPresentationStyle = .fullScreen
//                self.present(view, animated: true, completion: nil)
//            }
            let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
            self.navigationController?.pushViewController(pushVC!, animated: true)
        } else {
            let alert: UIAlertController = UIAlertController(title: "네트워크 상태 확인", message: "네트워크가 불안정 합니다.", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "다시 시도", style: .default, handler: { (ACTION) in
                self.checkDeviceNetworkStatus()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }

}
