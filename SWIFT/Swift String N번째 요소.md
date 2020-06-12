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

<br>

### String 특정문자 치환하기

 `String.replaceOccurences(of:with:)`을 활용한다. of부분에 바꾸어지게 될 문자를 넣고 with부분에 새롭게 바꾸고 싶은 문자를 넣저주면된다.

```swift
// 여기서 isnnet102부분을 닉네임으로 바꾸고 싶은 경우 다음과 같이 코드를 작성하면 된다. 
var enterMent = "isnnet102님이 입장하셨습니다."
let newMent = enterMent.replaceOccurences(of: "isnnet102" with: "Prodo")
print(newMent)	// Prodo님이 입장하셨습니다.
```

