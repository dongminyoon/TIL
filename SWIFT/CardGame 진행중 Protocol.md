## IOS Level 2 - Card Game



**진행하면서 새롭게 쓴 프로토콜들**



* `CustomStringConvertible` protocol

 타입을 표현할 때, 나타내는 우리만의 표현을 String으로 변환할 수 있게 해주는 프로토콜이다. 생성자 String(describing: )을 통해 Type을 String으로 변환하게 되면 이후에는 print(type)을 하게 되면 우리가 만든 표현식으로 콘솔창에 나타나게 된다.



기본 표현

```swift
struct Point {
    let x: Int, y: Int
}

let p = Point(x: 21, y: 30)
print(p)
// Prints "Point(x: 21, y: 30)"
```

사용 후 표현

```swift
extension Point: CustomStringConvertible {
    var description: String {
        return "(\(x), \(y))"
    }
}

print(p)
// Prints "(21, 30)"
```



* `CaseIterable` protocol

 `CaseIterable`을 구현한 Enum 모든 Case를 탐색할 수 있게 해주는 프로토콜이다.`CaseIterable`

을 구현하면 `allCases` property를 사용해 Enum의 모든 케이스에 접근할 수 있다.



```swift
enum CompassDirection: CaseIterable {
    case north, south, east, west
}

print("There are \(CompassDirection.allCases.count) directions.")
// Prints "There are 4 directions."

let caseList = CompassDirection.allCases.map{"\($0)"}.joined(separator: ", ")
// caseList == "north, south, east, west"
```



* `Comparable` protocol 

`Comparable` 은 이미 Swift의 많은 타입에서 구현하고 있는 프로토콜이다. 기본적으로 비교를 위한 연산자에 구현되어 있는 사항이다. 여기서 `Comparable` 프로토콜을 인스턴스 타입에 상속받게 되면, 상속받은 인스턴스 타입 간의 비교가 가능해진다. 

이미 기본적으로 사용하고 있는 연산자를 통해 두 값을 비교해보자.

```swift
let currentTemp = 73

if currentTemp >= 90 {
    print("It's a scorcher!")
} else if currentTemp < 65 {
    print("Might need a sweater today")
} else {
    print("Seems like picnic weather!")
} // Prints "Seems like picnic weather!" 
```



`Comparable` 프로토콜을 구현하게 되면 '<', '==' 두 연산자를 static method로 정의하여야 한다. '==' 연산자는 `Equatable` 프로토콜의 요구사항이다. `Comparable` 프로토콜이 상속을 받기 때문에 꼭 구현하여야 한다.

`Comparable` 프로토콜을 구현한 예제를 보자.

```swift
struct Date {
    let year: Int
    let month: Int
    let day: Int
}

extension Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else {
            return lhs.day < rhs.day
        }
    }
    
    static func == (lhs: Date, rhs: Date) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month
        	&& lhs.day == rhs.day
    }
}
```

이렇게 구현을 해놓게 되면 `Date` 인스턴스에 대해 '<', '==' 연산자를 통해 비교가 가능해진다.

```swift
let spaceOddity = Date(year: 1969, month: 7, day: 11)
let moonLanding = Date(year: 1969, month: 7, day: 20)
if moonLanding > spaceOddity {
    print("Major Tom stepped through the door first.")
} else {
    print("David Bowie was following in Neil Armstrong's footsteps.")
}
// Prints "Major Tom stepped through the door first."
```

