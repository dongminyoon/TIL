## TableView 재정렬하기

✅ ***Todo*** 

Editing 모드 사용하지 않고 ***UITableViewDragDelegate***, ***UITableViewDropDelegate*** 사용해서 구현하기.

✅ ***Done***

Editing 모드 사용해서 드래그 가능하게 하기

<br>

 TableView을 재정렬하기 위해선 `TableViewDataSource`의 메소드 두가지를 사용하여 가능하다.

 ***`TableView.isEditing`*** 변수도 사용하여야 ReArrangement가 가능하다.

👉**`func tableView(_:canMoveRowAt:)`** : tableView Row들이 다른 위치로 이동할 수 있는지 설정해준다.

👉 ***`func tableView(_:moveRowAt:to:)`*** : at의 위치로부터 to의 위치로 옮길 수 있게 하는 설정해준다.

<br>

 먼저 Edit 모드를 제어할 버튼을 만들어 준다.

```swift
// NavigationController 사용
override func viewDidLoad() {
  let rightItemTwo = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editView))
}

@objc func editView() {
  titleTableView.setEditing(!titleTableView.isEditing, animated: true)
}
```

<br>

 이제 ***UITableViewDataSource***의 메소드만 구현해주면 된다. 그 전에 데이터를 옮기기 전에 단계가 있다.

1️⃣ 옮길 위치의 데이터들을 복사한다.

2️⃣ 복사한 데이터들을 해당 SourceIndex의 위치에서 삭제한다.

3️⃣ 목적지에 복사한 데이터들을 insert한다.

```swift
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    // 1. 데이터 복사
    let movedModelImage = imageList[sourceIndexPath.row]
    let movedTitle = titleName[sourceIndexPath.row]
    let movedImportant = isImportant[sourceIndexPath.row]
    
    // 2. 복사한 데이터들 삭제
    imageList.remove(at: sourceIndexPath.row)
    titleName.remove(at: sourceIndexPath.row)
    isImportant.remove(at: sourceIndexPath.row)
    
    // 3. 목적지에 복사한 데이터들 insert
    imageList.insert(movedModelImage, at: destinationIndexPath.row)
    titleName.insert(movedTitle, at: destinationIndexPath.row)
    isImportant.insert(movedImportant, at: destinationIndexPath.row)
  }
}
```

<br>