## TableView Swipe Action 구현

<br>

 **iOS 11** 버전부터는 TableView의 Swipe Action에 대해 편하게 구현할 수 있다.

❗️ `TableViewDelegate`의 메소드를 활용하면 된다.

<br>

👉 `func tableView(_ tableView: UITableView, leadingSwipeConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? ` 

> 좌측에서 우측으로 Swipe하는 Action에 대한 동작을 구현할 수 있다.

👉 `func tableView(_ tableView: UITableView, trailingSwipeConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? ` 

> 우측에서 좌측으로 Swipe하는 Action에 대한 동작을 구현할 수 있다.

<br>

 리턴 타입 ***UISwipeActionsConfiguration***란?

👉 커스텀으로 TableView Swipe시 동작할 액션들을 정의할 수 있다. 보통 그 액션들을 리스트 형식으로 초기화하여 사용한다.

```swift
// 형식으로 초기화
UISwipeActionsConfiguration(actions: [])
```

❗️추가하는 순서대로 leading, trailing 액션이던 가장 사이드쪽부터 이미지들이 채워진다.

<br>

***UIContextualAction*** 란?

 👉 TableView의 row에 왼쪽 또는 오른쪽으로 스와이프를 실행할 때 실행될 수 있는 것들을 정의한다.

```swift
// 형식으로 초기화하여 사용한다.
UIContextualAction.init(style: UIContextualAction.Style, title: String?, handler: UIContextualAction.Handler)
```

<br>

`UIContextualAction.Handler` 의 정의

클로저에 대한 내용이 Type Alias로 정의되어 있다.

```swift
typealias Handler = (UIContextualAction, UIView, @escaping (Bool) -> Void) -> Void
```

👉 action : 해당 액션을 수행할 전적인 객체

👉 UIView : 정확히는 모르겠는데 동작하는 액션의 View을 담당하는 것 같다.

👉 @escaping closure : 해당 액션이 수행되고 난 후, 동작할 기능들을 정리하는 구간이다.

<br>

**Delete Action 예시 코드**

```swift
class ViewController: UIViewController {
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    return UISwipeActionsConfiguration(actions: [makeDeleteAction(at: indexPath)])
  }
  
  private func makeDeleteAction(at indexPath: IndexPath) -> UIContextualAction {
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in                                                       
  }
    // 배경색상, Title 모두 Action 영역의 밖에서 바꿀 수 있다.
    deleteAction.backgroundColor = UIColor.red
}
```



