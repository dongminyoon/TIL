## Swift 정규식 이용



* 정규식이란 : 텍스트 데이터 중 원하는 패턴과 일치하는 문자열을 찾아내기 위해 사용하는 방식이다. 미       리 정의된 기호와 문자열을 이용해서 만든 패턴문자열을 의미한다.

정규표현식 연습 사이트 - https://regexone.com/lesson/repeating_characters



|           \d            |        Any Digit         |
| :---------------------: | :----------------------: |
|           \D            | Any Non-digit Character  |
|            .            |   Any Singe Character    |
|          [abc]          |       Only a, b, c       |
|         [^dmp]          |      Not d, m nor p      |
|          [a-z]          |     Character a to z     |
|  {m} (문자 뒤에 사용)   |      m Repetitions       |
| {m, n} (문자 뒤에 사용) |    m to n Repetitions    |
|   * (문자 뒤에 사용)    | Zero or more Repetitions |
|   + (문자 뒤에 사용)    | One or more Repetitions  |
|   ? (문자 뒤에 사용)    |   Optitional character   |
|           \s            |      Any whitespace      |
|          (...)          |      Capture Group       |
|       (abc\|def)        |    Matches abc or def    |
|                         |                          |



#### **Swift**에서 정규식 사용하기



swift에서 정규식을 사용하기 위해서 `NSRegularExpression` 클래스를 사용한다. 

* `NSRegularExpression` 의 `init()` 이 `throws`이기 때문에 `try` 와 함께 사용하여야 한다.
* 매치결과는 `TextCheckingResult` 클래스의 인스턴스로 얻게 된다. 이는 매치영역의 범위를 `NSRange` 로 가지고 있다.



사용 메소드

* `numberOfMatches(in: ,options: , range: ) -> Int ` --> 테스트 결과 매치되는 영역의 개수를 리턴한다.
* `firstMatch(in: , options: , range: ) -> TextCheckingResult?` --> 첫번째로 매치되는 결과를 리턴한다.
* `matches(in: , options: , range: ) -> [TextCheckingResult]` --> 모든 매치를 결과로 리턴한다.
* `rangeOfFirstMatch(in: , options: , range: ) -> NSRange` --> 패턴과 첫번째로 매치되는 구간의 NSRange를 리턴한다.



매치 수 찾기 

```swift
let str = "1234567890"
let pattern = "\\d{1,3}"  // 숫자 1~3개
let regex = try? NSRegularExpression(pattern : pattern, options: [])

let n = regex?.numberOfMatches(in: str, options: [], range: NSRange(str.startIndex..., in: str)) // 4 (123|456|789|0)

```



첫번째 매치 뽑기

```swift
let str = "1234567890"
let pattern = "\\d{3}(?=8)" // 8앞의 숫자 3개
let regex = try? NSRegularExpression(pattern : pattern, options: [])

if let n = regex?.firstMatch(in: str, options: [], range: NSRange(str.startIndex..., in: str)) {
    str[Range(n.range, in: str)!] // print "567"
}
```



매치 되는 전부 뽑기

```swift
let str = "1234567890"
let pattern = "\\d{1,3}" // 숫자 1~3개
let regex = try? NSRegularExpression(pattern : pattern, options : [])

let n = regex?.matches(in: str, options: [], range: NSRange(str.startIndex..., in: str))

print(n) //  123 456 789 0
```



String 확장하여 요소 추출

```swift
extension String {
    // 정규식 조건에 맞는 스트링 리턴
    func getArrayAfterRegex(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
```

