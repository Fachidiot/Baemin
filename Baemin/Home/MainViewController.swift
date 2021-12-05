//
//  MainViewController.swift
//  Baemin
//
//  Created by 김학동 on 2021/11/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchRecommend: UIButton!
    @IBAction func buttonClick(_ sender: UIButton) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController")
        self.navigationController?.pushViewController(searchVC!, animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let bottomSheetVC = BottomSheetViewController(contentViewController: LocationSettingViewController())
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchRecommend.titleLabel?.text = recommend.randomElement()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private let list = Menu.dummyList
    
    let recommend = ["브랜치 나와라 뚝딱!!", "찾는 맛집 이름이 뭐에요?", "육회비빔밥? 쌀국수? 육개장?", "포케? 돈까스? 커리?", "배고프니까 일단 검색!!", "막국수? 꼬막무침? 갈비탕?", "팟타이 나와라 뚝딱!!", "물회 나와라 뚝딱!!", "찾는 메뉴가 뭐에요?", "로제떡볶이 나와라 뚝딱!!", "초밥 나와라 뚝딱!!", "까르보나라 나와라 뚝딱!!"]
}

extension MainViewController: UICollectionViewDataSource {
    // 몇개 표시 할까?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: 트랙매니저에서 트랙갯수 가져오기
        return list.count
    }
    
    // 셀 어떻게 표시 할까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let menu = list[indexPath.item]
        cell.loadMenu(item: menu)
        
        return cell
        
    }
}

extension MainViewController: UICollectionViewDelegate {
    // 클릭했을때 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        self.navigationController?.pushViewController(menuVC!, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGSize? = list[indexPath.item].thumnailImage?.size
        size!.height = size!.height / 3.0
        size!.width = size!.width / 3.0
        return size!
    }
}
