## Swift Property

스위프트 프로퍼티의 종류

✅ **Stored Property(저장 프로퍼티)**

* 보통 구조체나 클래스에서만 사용될 수 있는 변수, 쉽게 말해 우리가 자주 사용하는 변수들이다. `let`, `var` 변수이다.

  > `var` : 변수 저장 변수 => 프로그램 실행 중 변할 수 있는 변수
  >
  > `let` : 상수 저장 변수 => 프로그램 실행 중 변할 수 없는 변수
  >
  > `lazy Stored Properties` : 게으른 저장 변수 => 값이 사용되기 전까지는 생성되지 않는 변수

<br>

✅ **Computed Property(연산 프로퍼티)**

- 연산 프로퍼티를 사용하기 전에는 꼭 이 변수를 저장하고 사용할 변수가 하나 있어야 한다. 연산 프로퍼티란 저장 프로퍼티와는 다르게 값을 저장하기 보다는 그때 그때 계산하여 할당하여 사용한다.

  > `getter` : getter 프로퍼티만 사용하는 것은 가능하다. 그러나 setter 프로퍼티만 사용하는 것은 불가능 하다.
  >
  > `setter` : setter 변수에 값을 세팅하는 용도 반드시 다른 변수에 값을 저장하여야 한다.

```swift
class Point {
  var tempX: Int = 1
  
  var x: Int {
    // 만약 여기서 return x을 하게 되면 Error가 발생, Recursive하게 변수를 호출하기 때문에 에러가 발생한다.
    get {
      return tempX
    } 
    set(dm) {
      tempX = dm * 2
    }
  }
}
```

<br>

```swift
class Point {
  var tempX: Int = 1
  
  var x: Int {
    get {
      return tempX
    }
    // (dm)을 쓰고 싶지 않으면 newValue라는 키워드를 사용하여 하면 된다
    set {
      tempX = newValue * 2
    }
  }
}
```

<br>

```swift
// get만 있을 경우 get을 생략 가능하다
class Point {
  var originX = 0
  var originY = 0
  var width = 10
  var height = 10
  var center: Double {
    return CGPoint(originX + width / 2, originY + height / 2)
  }
}
```

<br>

## Property Observer

 저장 프로퍼티와 연산 프로퍼티의 변수들을 감시할 수 있는 역할을 하는 변수들이다. 이 `Property Observer`을 정의해서 프로퍼티 값의 변경을 모니터링 할 수 있다.

 `Property Observer`는 값이 현재값과 동일하더라도 속성의 값이 설정(set)될 때마다 호출된다. 

 `Lazy Property`을 제외하고 정의된 저장 프로퍼티에 프로퍼티 옵저버를 추가할 수 있다. 즉, 연산 프로퍼티에도 `Property Observer`을 추가하는 것이 불가능하다.

<br>

✅ **willSet** : 값이 저장되기 직전에 호출된다.

* 새로운 프로퍼티의 값이 **상수 매개변수**로 전달된다.

> 구현 내의 매개변수 이름과 괄호를 쓰고 싶지 않으면 여기서도 `newValue`란 이름으로 사용할 수 있다.

<br>

✅ **didSet** : 새로운 값이 저장된 직후에 호출된다.

* 이전 프로퍼티 값이 **상수 매개변수**로 전달된다.

> 여기서도 구현 내에 매개변수 이름과 괄호를 쓰고 싶지 않으면 `oldValue`라는 기본 매개변수 이름을 사용할 수 있다.

<br>

**사용코드**

```swift
class StepCounter {
  var totalSteps: Int = 0 {
    willSet {
      print("totalSteps을 \(newValue)로 설정하려고 합니다.")
    }
    didSet {
      if totalSteps > oldValue {
        print("\(totalSteps - oldValue)걸음이 추가되었습니다.")
      }
    }
  }
}
```

