//
//  TopTabbar.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/29.
//

import UIKit

class TopTabbar: UIScrollView {
    // MARK: Public Member Variables
    var padding : CGFloat = 10.0
    var extraConstant : CGFloat = 40.0
    var buttonWidth : CGFloat = 52.0 {
        didSet {
            if buttonWidth < 1 {
                buttonWidth = oldValue
            }
        }
    }
    
    var moveDuration : CGFloat = 0.3 {
        didSet {
            if moveDuration < 0.01 {
                moveDuration = oldValue
            }
        }
    }
    
    var fontSize : CGFloat = 12.0 {
        didSet {
            if fontSize < 8 {
                fontSize = oldValue
            }
        }
    }
    
    var buttonTitlefont : UIFont?
    
    var fontColor : UIColor = .black
    var buttonBackgroundColor : UIColor = .white
    
    // MARK: Private Member Variables
    private var m_aryButtons : [UIButton] = []
    private var m_aryTitleList : [String] = []
    private var m_completionHandler : ((_ index : Int)->(Void))?
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: Public Methods
    
    func configureTopTabbar(titleList : [String], completionHandler :@escaping ((_ index : Int)->(Void))){
        self.m_completionHandler = completionHandler
        self.m_aryTitleList = titleList
        self.initScrollView()
        self.addButtons()
    }
    
    // 탭 클릭 이벤트
    func selectTab(index : NSInteger) {
        guard self.m_aryButtons.count > 0 else {
            return
        }
        
        // deselected all buttons.
        self.deselectedButtons()
        
        let sender = self.m_aryButtons[index]
        sender.tintColor = UIColor(displayP3Red: 90/255, green: 190/255, blue: 187/255, alpha: 1)
        sender.setTitleColor(.white, for: .normal)
        
        sender.isSelected = true
        
        let target_x = sender.frame.origin.x
        
        if self.contentOffset.x + self.frame.width < target_x + self.buttonWidth {
            let extraMove : CGFloat = sender.tag == self.m_aryTitleList.count - 1 ? 0 : self.extraConstant
            
            UIView.animate(withDuration: 0.3, animations: {
                self.contentOffset.x = target_x + self.padding + self.buttonWidth - self.frame.width + extraMove
            })
        } else if self.contentOffset.x > target_x {
            let extraMove : CGFloat = sender.tag == 0 ? 0 : self.extraConstant
            
            UIView.animate(withDuration: 0.3, animations: {
                self.contentOffset.x = target_x - self.padding - extraMove
            })
        }
        
        self.animateSelected(sender)
        
        if self.m_completionHandler != nil {
            self.m_completionHandler!(sender.tag)
        }
    }
    
    // MARK: Private Methods
    private func initScrollView() {
        self.backgroundColor = .white
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    // 클릭 해제
    private func deselectedButtons() {
        for btn in self.m_aryButtons {
            btn.isSelected = false
            btn.tintColor = .white
            btn.setTitleColor(UIColor.lightGray, for: .normal)
        }
    }
    
    // 버튼 추가
    private func addButtons() {
        var x : CGFloat = 0.0
        let y : CGFloat = 0.0
        var size : CGFloat = 0.0
        
        for (index,title) in (self.m_aryTitleList.enumerated()) {
            x = x + size
            if index != 0 {
                size = m_aryButtons[index - 1].frame.width
            }
            
            let btn : UIButton = UIButton(type: .custom)
            btn.configuration = .filled()
            btn.configuration?.cornerStyle = .capsule
            btn.tag = index
            btn.titleLabel?.font = self.buttonTitlefont == nil ? UIFont.systemFont(ofSize: fontSize) : self.buttonTitlefont
            btn.setTitle(title, for: .normal)
            btn.tintColor = .white
            btn.setTitleColor(UIColor.lightGray, for: .normal)
            btn.frame = CGRect(x: x + size + (padding * CGFloat(index + 1)), y: y, width: btn.intrinsicContentSize.width, height: 35)
            btn.addTarget(self, action: #selector(TopTabbar.handleTap(_:)), for: .touchUpInside)
            
            self.m_aryButtons.append(btn)
            self.addSubview(btn)
        }
        
        self.contentSize = CGSize(width: x + size * 2 + (padding * CGFloat(self.m_aryTitleList.count+1)), height: 1)
    }
    
    private func animateSelected(_ sender : UIButton) {
        let originalFrame : CGRect = sender.frame
        var frame : CGRect = sender.frame
        frame.origin.y -= 2.5
        
        UIView.animate(withDuration: 0.2, animations: {
            sender.frame = frame
        }) { (isDone) in
            UIView.animate(withDuration: 0.2, animations: {
                sender.frame = originalFrame
            })
        }
    }
    
    // MARK: Handle Action
    @objc fileprivate func handleTap(_ sender : UIButton) {
        self.selectTab(index: sender.tag)
    }
}
