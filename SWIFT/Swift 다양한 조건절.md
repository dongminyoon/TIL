## 스위프트 조건절 패턴 매칭 정리 ( if case let )



 보통 `if` 문은 표현식을 평가한 결과가 `true` or `false` 인지를 판단하여 분기를 처리한다. Swift에서는 패턴매칭에 의한 평가를 우선지원하고 있기 때문에, 실제로는 적용할 수 있는 문법의 종류가 매우 다양하다. 



#### **다양한 패턴들** 



* Identifier-pattern

  이 패턴은 매칭을 할 때, 좌변을 평가한 값이 우변과 비교하는 매칭방식이다.

```swift
let a = 42
var b = 42

if case a = b {
    print("a is equal to b")
} 
// "a is equal to b"
```



* Value-binding-pattern

  이 패턴은 옵셔널 바인딩과는 다르게 우변의 값을 좌편의 이름에 바인딩한다. 우변은 옵셔널 값이 아니어도 상관없다.

   바인딩 방식은 따로 where절을 추가하지 않을 시 항상 성립한다.

```swift
let a = 42
let b = 42

if case let x = b, x == a {
    print("a is equal to b")
}
// "a is equal to b"
```



* Tuple-pattern

  튜플 패턴은 퓨틀 형태의 표시를 의미한다. 다음 예제는 두번째 요소가 1인 모든 튜플에 매칭하는 패턴이다.

```swift
let a = (4, 0)

if case (_, 0) = a {
    print("a is on the X axis")
} // "a is on the X axis"

// 바인딩 패턴으로도 결합하기도 한다.
let b = (4, 4)

if case let (x, y) = b , x == y {
    print("a is on the line f(x) = x.")
} // "a is on the line f(x) = x"
```



* Enum-case 패턴

  Enum-case 패턴은 우변의 값이 `enum`타입의 특정 `case`에 해당하는지를 보는 것이다.

```swift
enum Either {
    case Left(Int, Int)
    case Right(Double, Double)
}

var a = Either.Left(13, 169)
if case .Left = a {
    print("a is .Left Type")
} // "a is .Left Type"

// 여기서 Either 타입이 튜플로 연관 값을 가지고 있기 때문에, 튜플 패턴과 결합하여 사용할 수 있다.

if case .Left(let x, _) = a , x % 2 == 0 {
    print("a is .Left type and its first element is even number.")
}
```



* type-casting

  타입 캐스팅 패턴은 `is` 패턴과 `as` 패턴 두 가지가 있다.

  1. `is` 패턴은 간단히 좌변이 검사받을 값 우변이 검사할 값으로 이루어 진다. 우변이 좌변의 타입에 매치하는지를 본다.
  2. `as` 패턴은 왼쪽의 패턴에 먼저 매치한 후, 매치가 성공하면 해당 패턴을 `as` 오른쪽의 타입으로 캐스팅한다. 캐스팅에 성공하면 통과 못하면 실패로 간주한다.

```swift
var c : Any = 23
if case is Int = c {
    print("c is Integer")
}
// c is Integer

c = 23.4
if case let x as Double = c {
    print("c is Double")
}
// c is Double
```

