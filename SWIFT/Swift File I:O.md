## Swift File I/O



#### **FileManager** : NSObject(objective - C 의 기능을 쓰는 객체)

 FileManger객체는 파일을 다루는데 편리한 기능들을 제공해준다. 그렇기 때문에 보통 Swift에서 파일을 생성, 복사, 이동, 읽어오기, 쓰기등의 파일에 관련된 작업을 할 때, FileManager 객체를 이용한다. 

보통 파일에 접근할 때 두 가지 방법이 있다. NSString or NSURL을 사용하는 방법이다. 두 방법 모두 사용할 수 있지만,  `NSURL`을 사용하는 것을 더 추천한다. `NSURL`을 사용하는 것이 경로정보로 바꾸는데 더 내부적으로 효율적이다.



* 파일 생성하기

 Apple 공식문서에서는 파일을 만들 때, 만드는 Contents들을 모두 Documents 디렉토리에 저장하도록 권장하고 있다.

그럼 파일을 만들기 전 우리는 Document 디렉토리의 위치를 알아야 한다. 그러기 위해선 Document 디렉토리의 URL을 얻어야 한다. 얻기 위해 우선 `FileManager` 인스턴스를 생성한다. `init()` 보다 `default` 을 사용하도록 권장하고 있다.

```swift
let fileManager = FileManager.default
let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0] // Domain에서 지정된 디렉토리의 URL을 배열로 리턴해준다.
					// Document의 URL을 얻었다.
let fileURL = documentURL.appendingPathComponent("file.txt") 
// 파일의 이름을 지정한다.

let writeString: String = "Write BlahBlahBlah"
try? writeString.write(to: fileURL, atomically: true, encoding: .utf8)
```



* 파일 읽어오기

 파일을 String 타입으로 읽어오는 것 역시 읽어올 파일이 위치한 디렉토리의 URL을 알아내야 한다.

```swift
let fileManager = FileManager.default
let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
// Domain에서 지정된 디렉토리의 URL을 배열로 리턴해준다.
// Document의 URL을 얻었다.
let fileURL = documentURL.appendingPathComponent("file.txt") 
// 읽어올 파일의 이름을 적어준다.
let readText = try? String(contentOf: fileURL, encoding: .utf8) // readText에 파일의 내용을 String으로 읽어온다.

```

