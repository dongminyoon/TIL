## Container View Programmatically

***Container View 코드로 생성하기***

 Container View을 Storyboard로만 생성하면 자동으로 `ChildViewController`을 연결해준다. 그러나 코드로 생성할 때는 `ParentViewController`와 `ChildViewController`의 연결을 수동적으로 해주어야 한다.

<br>

---

✔️ ***Container View 코드로 생성하기***

1️⃣ 우선 `Parent ViewController`의 `Child ViewController`를 등록하여야 한다.

2️⃣ `Parent ViewController`의 `Container View`을 넣고 싶은 뷰에 View을 추가한다.

3️⃣ `Child ViewController`의 View의 크기를 `Container View`의 크기에 맞추어준다.

4️⃣ `Child ViewController`에 `Parent ViewController`가 등록되었음을 알린다.

<br>

👉 ***실행 코드***

```swift
// ParentViewController에서 ChildViewController 등록하기
let containerView: UIView = UIView()

func addChildView() {
  guard let childVC = self.storyboard?.instantiateViewController(identifier: identifier) else { return }
 	// 1번
  self.addChild(childVC)
  // 3번
	childVC.view.frame = containerView.bounds
  // 2번
  containerView.addSubView(childVC.view)
  // 4번 부모에서 addChild을 부른 직후 불러야한다.
	childVC.didMove(toParent: self)
}
```

<br>

---

 삭제할 때의 순서는 생성할 때와 반대의 순서로 진행될 수 있게 해준다.

<br>

✔️ ***Container View 코드로 삭제하기***

1️⃣ `Child ViewController`에서 `Parent ViewController`을 삭제할 것이라는 것을 알린다.

2️⃣ `Child ViewController`을 `Parent ViewController`로부터 직접 삭제한다.

3️⃣ `Child ViewController`의 View을 `Container View`로부터 삭제한다.

<br>

👉 ***실행코드***

```swift
// ChildViewController에서 삭제하는 작업 진행
func removeParentView() {
  // 1번 removeFromParent()을 부르기 직전에 불러야한다.
  self.willMove(toParent: nil)
  // 2번
  self.removeFromParent()
  // 3번
  self.view.removeFromSuperView()
}
```



