//
//  Menu.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/24.
//

import UIKit

struct Menu {
    let title: String
    let discription: String
    let thumnailName: String
    
    init(title: String, discription: String, thumnailName: String) {
        self.title = title
        self.discription = discription
        self.thumnailName = thumnailName
    }
    
    var thumnailImage: UIImage? {
        // TODO: Image를 주어진 senderImageName가지고 생성해주세요.
        let image = UIImage(named: "\(thumnailName).jpg")
        return image
    }
    
    static var dummyList: [Menu] {
        return [
            Menu(title: "배달", discription: "세상은 넓고\n맛집은 많다", thumnailName: "배달"),
            Menu(title: "배민", discription: "한 번에 한 집만\n빠르게 배달해요!", thumnailName: "배민1"),
            Menu(title: "포장", discription: "가까운 가게는 직접 가지러 가지요", thumnailName: "포장"),
            Menu(title: "비마트", discription: "장보기도\n즉시배달", thumnailName: "비마트"),
            Menu(title: "쇼핑라이브", discription: "맛있는\n초특가 라이브", thumnailName: "쇼핑라이브"),
            Menu(title: "선물하기", discription: "배민 상품권\n선물해 보세요", thumnailName: "선물하기"),
            Menu(title: "전국별미", discription: "음식으로 떠나는\n전국 여행", thumnailName: "전국별미")
        ]
    }
}
