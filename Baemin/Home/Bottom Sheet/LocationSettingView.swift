//
//  LocationSettingView.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/25.
//

import UIKit

class LocationSettingView: UIView {
    
    @IBOutlet var view: UIView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        Bundle.main.loadNibNamed("LocationSettingView", owner: self, options: nil)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "LocationSettingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! LocationSettingView
    }
}
