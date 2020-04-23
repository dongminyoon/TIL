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

