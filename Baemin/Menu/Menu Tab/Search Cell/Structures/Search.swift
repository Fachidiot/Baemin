//
//  Search.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/30.
//

import Foundation
import UIKit

struct Recent {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    static var dummyList: [Recent] {
        return [
            Recent(name: "떡볶이"),
            Recent(name: "게살버거"),
            Recent(name: "심장마비버거"),
            Recent(name: "수제버거"),
            Recent(name: "맥도날드"),
            Recent(name: "버거킹"),
            Recent(name: "롯데리아")
        ]
    }
}

struct Recommend {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    static var dummyList: [Recommend] {
        return [
            Recommend(name: "생필품 고민끝!"),
            Recommend(name: "지금 필요한 용기"),
            Recommend(name: "피부관리의 시작"),
            Recommend(name: "1일1떡볶이"),
            Recommend(name: "만두는 필수"),
            Recommend(name: "간편한해물")
        ]
    }
}

struct Rank {
    let rank: Int
    let name: String
    
    init(rank: Int, name: String) {
        self.rank = rank
        self.name = name
    }
    
    static var dummyList: [Rank] {
        return [
            Rank(rank: 1, name: "교촌치킨"),
            Rank(rank: 2, name: "전"),
            Rank(rank: 3, name: "닭발"),
            Rank(rank: 4, name: "타코야끼"),
            Rank(rank: 5, name: "굽네치킨"),
            Rank(rank: 6, name: "족발"),
            Rank(rank: 7, name: "치킨"),
            Rank(rank: 8, name: "삼첩분식"),
            Rank(rank: 9, name: "푸라닭"),
            Rank(rank: 10, name: "동대문엽기떡볶이")
        ]
    }
}
