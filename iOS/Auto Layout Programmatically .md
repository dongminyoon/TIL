## Auto Layout Programmatically

<br>

***Auto Layout Programmatically로 잡기***

 처음 iOS 개발을 접할 때는 보통 storyboard을 이용해서 **AutoLayout**을 잡기 마련이다. 

>  "하지만 Storyboard로 작성을 하다보면 한계가 온다. 이 순간에는 코드로 작성해야 한다."

<br>

👉 ***코드로 Constraint을 잡기 위해서는 `UIView.translatesAutoresizingMaskIntoConstraints = false`를  설정해주어야 한다.***

 공식문서에 따르는 정의에 의하면

> A Boolean Value that determines whether the view's autoresizing mask is translated into Auto Layout constraints

 즉, View의 Autoresizing mask가 Auto Layout constraints으로 변환되는지 여부를 결정하는 Bool 값이다.

<br>

✔️ 예시 코드 👉 StackView 사용

```swift
class ViewController: UIViewController {

  @IBOutlet weak var sampleStackView: UIStackView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    addSubView()
  }

  private func addSubView() {
    for index in 0...10 {
      let sampleView: UIView = {
        let tempView = UIView()
        tempView.backgroundColor = UIColor(red: CGFloat((index*10)/255), green: 1, blue: 1, alpha: 1)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return tempView
      }()
      sampleStackView.addArrangedSubview(sampleView)
    }
  }
}

```

<br>

<br>

***AutoLayout 배열로 잡기***

 동적으로 바뀔 Constraints을 위해 AutoLayout을 잡기 위해 **배열**로 적용

 Constraint을 을 배열에 넣고 이를 한 번에 activate시키고 deactive시키면서 적용한다.

<br>

 여기서 AutoLayout을 코드로 잡을 때, 중요한 점이 있다. 하나의 Constraint가 잡혀있는 상태에서 그 Constraint을 **deactive**하지 않고 새로운 Constraints을 **active** 할 시, Constraints가 중복으로 적용되는 것을 알 수 있다.

 즉, 새로운 Constraints을 잡을 시, 기존의 Constraints을 **deactive**해준 후, 새롭게 **active**해주는 작업이 필요하다.

<br>

✔️ 예시코드

```swift
private var newConstaints: [NSLayoutConstraint] = []

private func setConstraints() {
  let leadingConstraint = customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
  let trailingConstraint = customView.trailingAnchor.constarint(equalTo: self.view.trailingAnchor)
  let bottomConstraint = customView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
  let topConstraint = customView.topAnchor.constraint(equalTo: self.view.topAnchor)
  
  newConstraints = [leadingConstraint, trailingConstraint, bottomConstraint, topConstraint]
  NSLayoutConstraint.deactive(oldConstraints)
  NSLayoutConstraint.activate(newConstraints)
}
```







