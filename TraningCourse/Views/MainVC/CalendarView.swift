//
//  CalendarView.swift
//  TraningCourse
//
//  Created by Владислав Семенец on 13.01.2022.
//

import UIKit

class CalendarView: UIView {
        
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    private let idCalendarCell = "idCalendarCell"
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setConstrains()
        setDeligates()
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        
        addSubview(collectionView)
    }
    private func setDeligates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: - UICollectionViewDataSource
extension CalendarView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as! CalendarCollectionViewCell
        return cell
    }
}
//MARK: - UICollectionViewDelegate
extension CalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionViewTapped")
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 34, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}
//MARK: - setConstrains
extension CalendarView {
    private func setConstrains(){
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
