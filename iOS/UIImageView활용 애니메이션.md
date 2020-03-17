## iOS 로딩 화면 구현

<br>

**`UIImageView` 을 이용한 프레임 애니메이션 구현**

✅ **`var animationImages: [UIImage]?`**

> 애니메이션에 사용하기 위한 UIImage 객체의 배열이다

✅ **`func startAnimating()`**

> animationImages: [UIImage] 에 있는 이미지를 활용한 애니메이션을 시작시키는 메소드이다.

✅ **`func stopAnimating()`**

> 동작되고 있던 애니메이션이 종료된다.

✅ **`var animationDuration: TimeInterval`**

> animationImages에 있는 이미지들이 한 사이클동안 실행될 시간을 설정한다. 낮으면 낮을수록 빠르게 실행된다.

✅ **`animationRepeaetCount: Int`**

> 애니메이션이 반복될 횟수를 지정한다. default 값은 0으로 0일 시 무한 반복을 의미한다.

<br>

 보통 팝업 창은 제일 윗부분에 위치한다. 그러므로 `UIApplication.shared.keyWindow`의 view에 붙여서 사용하여야 합니다. 또한 팝업창은 다음 화면으로도 넘어간 후에도 관리할 수 있어야하므로 **Singlton** 객체를 사용하여 관리하여야 합니다.

 ***싱글톤 관리 객체***

```swift
class LoadingService {
  // Singlton 객체 생성
  static let shared = LoadingService()
  // 팝업창 나타날 때, 뒷 배경에 나타날 검은 화면
  private var backgroundView: UIView?
  // 애니메이션을 담당할 팝업 뷰
  private var popupView: UIImageView?
  
	// 애니메이션의 시작을 관리하는 메소드
	func show() {}
  
  // 애니메이션의 정지를 관리하는 메소드
  func hide() {}
}
```

<br>

 show 함수에서 `backgroundView`와 `popupView`을 생성하여 keyWindow의 화면에 추가해주어야 합니다.

***show() 메소드***

```swift
func show() {
  guard let window = UIApplication.shared.keyWindow else { return }
  self.backgroundView = makeBackgroundView(window.frame.width, window.frame.height)
  self.popupView = makePopupView(of: window.center)
  makeAnimationImages()
  setPopupAnimation()
  
  window.addSubView(backgroundView!)
  window.addSubView(popupView!)
  
  // 여기서 모든 뷰의 세팅이 끝나고 애니메이션이 실행
  popupView?.startAnimating()
}

// 초기 백그라운드 뷰 ==> 검은색의 알파값을 가진 투명한 배경 뷰 생성
private func makeBackgroundView(_ width: CGFloat, _ height: CGFloat) -> UIView {
  let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
  backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
  return backgroundView
}

// 초기 팝업 뷰 생성 ==> 이 땐 프레임 단위의 이미지가 들어있지 않음
private func makePopupView(of centerPoint: CGPoint) -> UIImageView {
  let popupView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
  popupView.center = centerPoint
  return popupView
}

// popupView.animationImages에 프레임 단위의 이미지를 생성하기 위한 메소드
private func makeAnimationImages() {
  var animationImages: [UIImage] = []
  for index in 1..<28 {
    guard let animationPiece = UIImage(named: "frame_loading_" + String(format: "%02d", index)) else { return }
    animationImages.append(animationPiece)
  }
  self.popupView?.animationImages = animationImages
}

// 팝업 될 시, 애니메이션의 지속시간 반복 횟수 등의 세팅을 담당하는 메소드
private func setPopupAnimation() {
  self.popupView?.animationDuration = 0.7
  self.popupView?.animationRepeatCount = 0        // 0일 경우 무한반복이라는 세팅이다.
}
```

<br>

 위의 코드까지만 실행하면 원하는 뷰에서 해당 `show()` 메소드를 실행 시, 팝업화면 애니메이션이 진행되는 것을 볼 수 있다. 

 이제 해당 팝업화면이 실행되고 종료할 수 있는 `hide()` 메소드를 만들어 주어야 한다. `hide()` 메소드는 `show()` 메소드보다 훨씬 간단하다.

***hide() 메소드***

```swift
func hide() {
  // 실행시켰던 애니메이션을 종료시킴
  popupView?.stopAnimating()
  
  // 두 뷰 모두 window로부터 삭제시킴
  popupView?.removeFromSuperview()
  backgroundView?.removeFromSuperview()
}
```

<br>

 해당 메소드를 이제 팝업화면이 필요한 화면에서 불러오고 종료시켜주면 실행되는 것을 볼 수 있습니다.



