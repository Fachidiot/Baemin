//
//  MyCollectionViewCell.swift
//  Baemin
//
//  Created by 김학동 on 2021/12/06.
//

import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {

    static var id: String { NSStringFromClass(Self.self).components(separatedBy: ".").last ?? "" }
//    var bag = DisposeBag()

    var model: MyCollectionViewModel? { didSet { bind() } }

    lazy var contentsView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = .white

        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()

        configure()
    }

    override var isSelected: Bool {
        didSet {
            contentsView.backgroundColor = isSelected ? UIColor(displayP3Red: 90/255, green: 190/255, blue: 187/255, alpha: 1) : .white
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

//        bag = DisposeBag()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        addSubview(contentsView)
        contentsView.addSubview(titleLabel)
    }

    private func configure() {
        backgroundColor = .white

        contentsView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    private func bind() {
        let title = model?.title
        titleLabel.text = title
    }
}
