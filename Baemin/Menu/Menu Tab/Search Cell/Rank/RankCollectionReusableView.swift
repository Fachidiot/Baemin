//
//  RankCollectionReusableView.swift
//  Baemin
//
//  Created by 김학동 on 2021/12/04.
//

import UIKit

class RankCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        update()
    }
    
    func update() {
        // TODO: 헤더뷰 업데이트 하기
        let date = Date() // 현재의 Date 날짜 및 시간
        let dateFormatter = DateFormatter() // Date 포맷 객체 선언
        dateFormatter.locale = Locale(identifier: "ko") // 한국 지정
        
        dateFormatter.dateFormat = "MM.dd kk:mm" // Date 포맷 타입 지정
        let date_string = dateFormatter.string(from: date) // 포맷된 형식 문자열로 반환
        self.time.text = date_string + " 기준"
    }
}
