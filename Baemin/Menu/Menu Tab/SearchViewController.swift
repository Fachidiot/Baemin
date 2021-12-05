//
//  SearchViewController.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/26.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBAction func buttonBack_search(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
    }
    
    let list = Rank.dummyList
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController: UICollectionViewDataSource {
    // 몇개 표시 할까?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: 트랙매니저에서 트랙갯수 가져오기
        return list.count
    }
    
    // 셀 어떻게 표시 할까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankCollectionViewCell", for: indexPath) as? RankCollectionViewCell else {
            return UICollectionViewCell()

        }
        
        let rank = list[indexPath.item]
        cell.loadRank(rank: rank)
        
        return cell
        
    }
    
    // 헤더뷰 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            // TODO: 헤더 구성하기
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "RankCollectionReusableView", for: indexPath) as? RankCollectionReusableView else {
                return UICollectionReusableView()
            }
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    // 클릭했을때 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        self.navigationController?.pushViewController(menuVC!, animated: true)
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 20 - card(width) - 20 - card(width) - 20
        // TODO: 셀사이즈 구하기
        let width = (collectionView.bounds.width - 20) / 2
        let height = width / 4
        
        return CGSize(width: width, height: height)
    }
}
