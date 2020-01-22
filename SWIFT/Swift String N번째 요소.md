## Swift - String에서 N번째 문자 가져오기

* Swift에서는 C처럼 `String`의 요소에 `str[0]`을 통해 접근이 불가능하다.



### N번째 문자 접근하기

Swift 4

```swift
let str = "Hello, world!"
let index = str.index(str.startIndex, offsetBy: 0)   // String의 첫번째 문자
str[index] // returns Character 'H'

let endIndex = str.index(str.endIndex, offsetBy: -1) // String의 마지막 문자
str[endIndex] // returns String "!"

String(str.suffix(from: index)) // returns String "Hello, world!"
String(str.prefix(upTo: endIndex)) // returns String "Hello, world"
String(str.prefix(through: endIndex)) // return String "Hello, world!"
// upTo는 자신 포함 X, through는 자신 포함 O
```



