## Pan Gesture Recognizer 활용

***Pan Gesture Recognizer 활용 Floating Panel 구현***

 손가락이 어떤 Object을 터치하고 움직였을 때, 그 움직임을 인식하는 **Gesture Recognizer**이다. 즉 손가락이 상하좌우로 움직이는 것을 인식한다. 

 인식하는 동안 손가락의 이동 방향 및 속도를 인식할 수 있습니다. 즉 이를 이용해서 드래그 액션을 구현할 수 있다고 이해하면 될 것 같습니다.

>  `translation(in: UIView?) -> CGPoint` 
>
> 👉 어떤 뷰에서 움직임을 인식하고 얼마나 움직였는지 그 좌표를 얻을 수 있습니다.
>
>  `velocity(in: UIView?) -> CGPoint` 
>
> 👉 어떤 뷰에서 어떤 방향으로 움직이고 있고, 그 움직이는 객체의 속력을 얻을 수 있습니다.

<br>

 기본적으로 View에서 사용하기 위해서 써야하는 방식이 있다. 여기서 생소한 점이 있을 수 있다. 사용하기 위한 절차는 다음과 같다.

1️⃣ `UIPanGestureRecogniger` 생성

2️⃣ `UIPanGestureRecognizer`을 등록하고 사용할 View 생성

3️⃣ `UIPanGestureRecognizer` View에 등록

4️⃣ 이동한 값 받아오기

5️⃣ 이동한 값 초기화 해주기

> 이 부분이 가장 생소할 것이다. transition을 사용하게 되면 이전에 저장된 transition을 값을 계속 저장하게 된다. 그렇기 때문에 새롭게 pan 액션을 하게 될 때는 0으로 초기화의 작업이 필요하다.

<br>

✔️ **실행코드**

```swift
let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(movePanelView(_:)))

@objc func movePanelView(_ sender: Any) {
  let transition = panGestureRecognizer.translation(in: placePopupView)
  let resultY = transition.y + placePopupView.transform.ty
  placePopupView.transform = CGAffineTransform(translationX: 0, y: resultY)
  
  panGestureRecognizer.setTranslation(.zero, in: placePopupView)
}
```

<br>

🔴 **PanGestureRecognizer 활용 Panel View 구현 추가 예정**



