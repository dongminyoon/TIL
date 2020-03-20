## iOS Stretchy Header

<br>

***실행화면***

<img src = '../images/stretchy.gif' height = '300px'>





***UICollectionViewReusableView 사용 Header 구현***

`ReuableView`을 사용하여 HeaderView에 사용한다.

보통 `ReuableView`는 Header와 Footer에 자주 사용한다. 기본적으로 `CollectionView` 의 설정을 통해 header, footer 체크로 선택한다. 

<img src = '../images/headerView.png' height = '200px'>

<br>

<br>

***DataSource 메소드***

기존에 CustomCell을 생성할 때와는 다른 메소드를 사용한다.

👉 **`collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView`**

> 1️⃣ **`collectionView`** : 해당 메소드의 요청이 들어온 CollectionView 객체
>
> 2️⃣ **`kind`** : HeaderView로부터 들어왔는지 FooterView로부터 들어왔는지에 대한 정보
>
> ```swift
> UICollectionView.elementKindSectionHeader 		// HeaderView의 Kind 정보
> UICollectionView.elementKindSectionFooter			// FooterView으 Kind 정보
> ```
>
> 3️⃣ **`indexPath`** : collectionView의 위치에 맞는 indexPath ➡️ section, row

<br>

***collectionView 메소드***

👉 **`dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath)`**

> 1️⃣ **`ofKind`** : kind로 HeaderView인지 FooterView인지 판단 가능하다.
>
> 2️⃣ **`withReuseIdentifier`** : HeaderView에 등록된 identifier 입력
>
> 3️⃣ **`indexPath`** : collectionView cell의 위치에 맞는 indexPath

<br>

✅ `UICollectionVIew.contentInsetAdjustmentBehavior` Option

❗️옵션의 조정을 통해 UICollectionView의 Safe Area에 따른 UIEdgeInset을 조정할 수 있다❗️

> 👉 **`always`** 
>
> 👉 **`automatic`**
>
> 👉 **`never`**
>
> 👉 **`scrollableAxes`** 

<br>

<br>

***UICollectionViewFlowLayout 사용***

❗️지금까지의 DataSource, Delegate와 다르게 **Protocol** 타입이 아니다❗️

👉 **`UICollectionViewFlowLayout.layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes?]`**

> CollectionView의 각 Cell이 Update될 때마다 호출되는 메소드이다.

👉 **`UICollectionView.shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool`**

> Bool 타입으로 True로 설정하면 Layout 업데이트가 필요할 때, 업데이트가 가능해진다. False로 설정하면 Layout 업데이트가 불가능해진다.

<br>

**실행코드**

```swift
class StretchHeaderLayout: UICollectionViewFlowLayout {
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let layoutAttributes = super.layoutAttributesForElements(in: rect)
    layoutAttributes?.forEach { attributes in
                               if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {

                                 guard let collectionView = collectionView else { return }
                                 let contentOffsetY = collectionView.contentOffset.y

                                 if contentOffsetY > 0 { return }
                                 let width = collectionView.frame.width
                                 // HeaderCell에 해당하는 Attribute의 height에 contentOffset이 올라간만큼을 더해준다.
                                 let height = attributes.frame.height - contentOffsetY
                                 // contentOffsetY가 내려간 만큼 origin.y로 옮겨야한다. 이렇게해야 스크롤을 했을 때, 윗 공간이 안뜨게 된다.
                                 attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
                               }
                              }
    return layoutAttributes
  }

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}

```





