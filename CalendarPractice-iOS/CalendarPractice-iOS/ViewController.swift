//
//  ViewController.swift
//  CalendarPractice-iOS
//
//  Created by 김수연 on 2021/12/13.
//

import UIKit

import Then
import SnapKit

import FSCalendar

class ViewController: UIViewController {

    var calendarView = FSCalendar().then {
        $0.backgroundColor = UIColor(red: 241/255, green: 249/255, blue: 255/255, alpha: 1)
        // 선택 날짜 색상
        $0.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        // 오늘 날짜 색상
        $0.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        // 여러개 선택가능
        $0.allowsMultipleSelection = true
        // 스와이프 동작으로 다중선택 
        $0.swipeToChooseGesture.isEnabled = true

        // 스와이프 스크롤 작동 여부 ( 활성화하면 좌측 우측 상단에 다음달 살짝 보임, 비활성화하면 사라짐 )
        $0.scrollEnabled = true
        // 스와이프 스크롤 방향 ( 버티칼로 스와이프 설정하면 좌측 우측 상단 다음달 표시 없어짐, 호리젠탈은 보임 )
        $0.scrollDirection = .vertical
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
    }


}

extension ViewController {
    func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }

    func setViewHierarchies() {
        view.backgroundColor = .white
        view.addSubview(calendarView)
    }

    func setConstraints() {
        calendarView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(500)
        }
    }
}
