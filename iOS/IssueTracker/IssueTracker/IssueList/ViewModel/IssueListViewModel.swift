

import Foundation
import RxSwift
import RxCocoa

class IssueListViewModel {
    
    var searchText = BehaviorRelay(value: "")
    var model: Observable<[IssueListModel]>!
    
    var disposeBag = DisposeBag()
    
    init() {
        model = searchText.asObservable()
            .distinctUntilChanged()
            .flatMapLatest(search)
    }
    
    func search(inputString: String) -> BehaviorRelay<[IssueListModel]> {
        var newModel = [IssueListModel]()
        newModel.append(IssueListModel(isOpened: true, label: ["feature"], title: "레이블 목록 보기 구현", content: "레이블 전체 목록을 볼 수 있어야 한다\n 2줄까지 보입니다.", mId: "1", id: "1"))
        newModel.append(IssueListModel(isOpened: true, label: ["bug"], title: "마일스톤 목록 보기 구현", content: "레이블 전체 목록을 볼 수 있어야 한다\n 2줄까지 보입니다.", mId: "1", id: "1"))
        
        let resultList = newModel.filter {
            $0.title.contains(inputString)
        }
        
        return BehaviorRelay(value: resultList)
    }
    
}
