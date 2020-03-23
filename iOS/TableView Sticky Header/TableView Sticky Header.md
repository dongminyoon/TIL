## TableView Sticky Header

<br>

***TableView contentOffset.y에 따라 동적으로 Header가 변하는 뷰***

<br>

**실행화면**

<img src='../../images/stickyView.gif' height="400px">

<br>

<br>

***순서***💻

1️⃣ 우선 `TableView`와 `UIView`을 생성해서 HeaderView로 활용하기 위해 각각의 AutoLayout을 잡아주었다.

> ❗️여기서 TableView의 Header 속성은 사용하지 않았다. UIView을 HeaderView로 사용하기 위한 AutoLayout을 잡았다
>
> ❗️TableView의 Top AutoLayout는 Header View의 Bottom이 아닌 Super View의 Header로 잡아주었다

2️⃣ `TableView`의 내용들이 `Header View`에 가리지 않기 위해 ContentInset을 조정해주었다

> ❗️ContentInset을 조정하게 되면 ContentOffset이 0이 기준이 되는게 아니고 +해준만큼 -로 기준이 되어 계산된다

```swift
// contentInset이 계산되는 것이 SafeArea을 기준으로 자동으로 계산되지 않도록 해주었다
customTableView.contentInsetAdjustmentBehavior = .never
// HeaderView의 Height만큼 띄워서 나타나야 콘텐츠가 가리지 않는다
customTableView.contentInset = UIEdgeInsets(top: customHeaderView.frame.height, left: 0, bottom: 0, right: 0)
```

3️⃣ `ScrollViewDelegate` 함수를 override하여 ContentOffset에 따라 Header의 크기가 달라지게 코드를 작성한다.

```swift
// heightConstraint을 바꾸어서 동적으로 HeaderView의 높이를 바꾸어준다
@IBOutlet weak var heightConstraint: NSLayoutConstraint!
// Scroll을 할 때마다 HeaderView의 크기가 변하기 때문에 기준을 잡기 위해 초기 높이 값을 선언
private let initHeightConstraint: CGFloat = -200

extension ViewController: UITableViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let contentOffsetY = scrollView.contentOffset.y
    
      // HeaderView의 크기의 최솟값과 최댓값의 사이만큼 스크롤이 되었을 시
      if contentOffsetY > initHeightConstraint && contentOffsetY < -130 {
        heightConstraint.constant = -contentOffsetY
      }
    	// 스크롤이 최솟값에서 더 스크롤되었을 시
    	else if contentOffsetY < initHeightConstraint {
        heightConstraint.constant = -contentOffsetY
      }
    	// 이외의 상황에선 아무일도 일어나지 않음
    	else { return }
  }
}
```





