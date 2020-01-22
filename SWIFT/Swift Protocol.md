## Swift - Protocol

* Delegate Design Pattern

1. 보통 프로토콜로 구현되는 디자인 패턴의 종류이다. 
2. **객체 지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아니라 처리해야 할 일 중 일부를 다른 객체에게 넘기는 것을 의미한다.**
3. **즉, 프로토콜에서 해야할 일을 정의만하고 구현은 프로토콜을 채택한 객체에서 이루어 진다.**



* `Protocol`은 Java에서는 `Interface`, C++에서는 `Abstract class`등과 유사하다. 즉, 추상화만 시켜줄 뿐 기능은 구현하지 않는다.



### 문법

```swift
protocol SomeProtocol {
    // 프로토콜 정의 방식
}
```

* `protocol`을 상속한 클래스, 구조체에서 `protocol`에 있는 프로퍼티나 메소드를 사용하지 않을 경우 **컴파일에러**가 발생한다.

**프로토콜 사용**을 위해서는 `class`상속과 똑같은 방법을 사용한다. 그러나 `class`와 `protocol`둘다 상속을 원할 시에는 `class`를 앞에 `protocol`을 뒤에 넣는다.

```swift
struct SomeStructure: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // 프로토콜 사용 방식
}

// 앞은 클래스, 뒤는 프로토콜
```



* `protocol` 이 다른 `protocol` 을 상속할 경우 상속받은 프로토콜은 상위 프로토콜의 요구사항을 구현하지 않아도 된다. --> 채택한 것이 아니라 프로토콜 사이에는 상속을 받기 때문이다.

```swift
protocol Dongmin {
    var returnDongmin: Double { get }
    mutating func add(n : Int)
}
protocol AnotherProtocol { }
protocol InheritingProtocol : Dongmin, AnotherProtocol { }
// InheritingProtocol은 Dongmin, AnotherProtocol을 채택하고 있는게 아니라 상속받고 // 있기 때문에 구현사항을 구현하지 않아도 된다.

protocol InheritingProtocol : Dongmin, AnotherProtocol {
    mutating func sub(n : Int)
}
// 상속받고 있는 프로토콜에도 요구사항 추가가 가능

struct Family : InheritingProtocol {     // Compile Error!!
} 
// InheritingProtocol을 채택한 구조체에서는 모든 요구사항을 구현해주어야 한다.

struct Family : InheritingProtocol {
    var myDouble : Double = 0.0
    var returnDongmin : Double {
        return myDouble
    }
    mutating func add(n : Int) {
        myDouble += Double(n)
    }
    mutating func sub(n : Int) {
        myDouble -= Double(n)
    }
}
// 채택한 프로토콜의 모든 요구사항을 구현
```

