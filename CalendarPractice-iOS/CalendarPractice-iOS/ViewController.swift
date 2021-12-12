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

    let dateFormatter = DateFormatter()

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
        setDateFormat()
        setDelegation()
    }
}

extension ViewController {
    func setDateFormat() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    func setDelegation() {
        calendarView.delegate = self
        calendarView.dataSource = self
    }
}

extension ViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    // 날짜 선택 시 콜백 메소드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + "선택됨")
    }

    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + "해제됨")
    }

    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()):
            return "오늘"
        case "2021-12-25":
            return "크리스마스"
        case "2021-12-24":
            return "이브"
        default:
            return nil
        }
    }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        switch dateFormatter.string(from: date) {
        case "2021-12-25":
            return .red
        default:
            return appearance.selectionColor
        }
    }

    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        // 날짜 3개까지만 선택되도록
        if calendar.selectedDates.count > 3 {
            return false
        } else {
            return true
        }
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
