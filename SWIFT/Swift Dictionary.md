## Swift Dictionary 타입

Dictionary 타입은 Key, Value로 데이터를 저장하는 형식이다.

각각의 Value는 **유일한 Key** 값에 저장되어 있다. Key 값은 Value를 찾기 위한 식별자 역할을 한다.

Key 값에 연결되어 있기 때문에, Dictionary 타입에는 순서가 의미 없다.



**Key에 들어가는 타입은 해쉬가능한 타입이어야 한다.** **( 즉, 그 자체로 유일한 표현 방법을 제공해야 한다. )**



* Dictionary 생성 법

```swift
// 생성하는 법
var dic : [Int : String] = [:]
var dic1 : [Int : String]()
var dic2 : Dictionary = [Int : String]()
var dic3 : Dictionary<Int, String> = Dictionary<Int, String>()

// 생성과 동시에 초기화
var dic : [Int : String] = [1:"동민", 2:"민형", 3:"동해"]
var dic1 = [1:"동민", 2:"민형", 3:"동해"] 			 // 타입 유추
var dic2 : Dictionary = [1:"동민", 2:"민형", 3:"동해"] // 타입 유추
var dic3 : Dictionary<Int, String> = [1:"동민", 2:"민형", 3:"동해"]

```



* Dictionary 값 수정

```swift
var dic : [Int : String] = [1:"동민", 2:"민형", 3:"동해"]
dic.updataValue("준엽", forkey: 3) // key 3에 해당하는 Value -> "준엽"
print(dic) // [1:"동민", 2:"민형", 3:"준엽"]
dic[3] = "서연"
print(dic) // [1:"동민", 2:"민형", 3:"서연"]

// updateValue 는 Optional 값을 반환한다.
// dic[3] 도 Optional 값을 반환한다.
// 해당하는 Key에 Value가 없을 경우 Nil을 반환
// 해당하는 Key에 Value가 있는 경우 Optional(value)값을 반환
```



* Dictionary 이용 For문 도는 법

```swift
var dic : [Int : String] = [1:"동민", 2:"동해", 3:"민형", 4:"찬호", 5:"준엽"]

for (key, value) in dic {
    print(key) 	// 1 2 3 4 5 --> 순서는 뒤죽박죽으로 나옴
}

for (key, value) in dic {
    print(value) // 동민 동해 민형 찬호 준엽 --> 순서는 뒤죽박죽으로 나옴
}

// (key , value) 순으로 Key 값과 Value 값 저장
```



* Dictionary 값 삭제

```swift
var dic : [Int : String] = [1:"동민", 2:"동해", 3:"민형", 4:"찬호", 5:"준엽"]
dic.removeValue(forKey: 5)
print(dic) // [1:"동민", 2:"동해", 3:"민형", 4:"찬호"]

dic.removeAll() // Dictionary의 모든 Key, Value 값 삭제
print(dic) // [:]
```

