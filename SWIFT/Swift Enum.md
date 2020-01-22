## Swift ENUM 타입

- Swift에서는 `ENUM` 타입은 __일급 클래스__로 취급된다. 클래스가 가지는 계산 프로퍼티( **저장 프로퍼티는  정의 불가** )나 메소드를 포함하는 것도 가능하다. `init()`을 가지거나 확장(상속이 가능)도 가능하다.

### 문법

*  `enum CompassPoint`타입이므로 타입 이름은 대문자로 시작한다.
* `case north` 각 케이스의 이름은 소문자로 시작한다.
* C와는 다르게 선언할 때, case에 자동으로 값을 할당받지 않는다.

```swift
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 한줄로도 선언 가능
enum CompassPoint {
    case north, south, east, west
}
```



* 각 `case`에 **값(raw value)**을 할당하기 위해선 타입을 지정해주어야 한다. ( C와는 다르게 Swift에서는 열거형에 정수형 말고도 다른 타입에 연결하여 유연하게 사용가능하다. )

```swift
enum CompassPoint : String {
    case north = "North"
    case south = "South", east = "East"  // 한줄로 선언도 가능
    case west  // 값을 지정하지 않는 것도 가능
}

let temp : CompassPoint = CompassPoint.north
print(temp.rawValue) // "North"
print(temp.south.rawValue) // "South"
```



* enum`의 `case` 는 위처럼 쌍으로 구분된다. 즉, `case`와 `rawValue`가 같다고 해도 다른 `enum`에 들어있으면 다른 값이다.

```swift
enum SomeEnums {
    case one, two, three, four
}
// case가 같아도 다른 Enum에 있으므로 다른 값으로 취급
enum AnotherEnums {
    case one, two, three, four
}
```



* Enum 타입 응용 - 열거형의 케이스를 Raw Value에서부터 생성해야하는 경우 - **Raw Value는 중복되면 안된다.**

```swift
enum Movement : Int {
    case left = 0
    case right = 1
    case top = 2
    case bottom = 3
}

let rightMovement = Movement(rawValue: 1) 
// 열거형의 케이스를 값으로 부터 생성하는 경우
// 열거형의 특별한 생성자 사용
// Movement(rawValue: 1) 로 생성되는 값은 Optional 값이다.
// Movement(rawValue: 5) 로 Raw Value에 없는 값을 입력할 경우 Nil을 반환
```



* Enum 타입 안에 메소드 사용

```swift
enum Device {
    case iPad, iPhone, appleTV, appleWatch
    func introduced() -> String {
        switch self {
            case iPad : return "\(self) was introduced 2007"
            case iPhone : return "\(self) was introduced 2006"
            case appleTV : return "\(self) was introduced 2008"
            case appleWatch : return "\(self) was introduced 2010"
        }
    }
}

print(Device.iPhone.introduced()) // "iPhone was introduced 2006"
```



* Enum의 모든 케이스 탐색할 수 있게 해주는 Protocol

```swift
enum TextType : CaseIterable {
    case title
    case subtitle
    case body
    case comment
}

for type in TextType.allCases {
    print(type)
}
// title, subtitle, body, comment
```

