## Socket

🔵 **Socket 통신** vs **HTTP통신**

> **Socket** : Socket 통신은 클라이언트가 서버와 접속이 되면 서버나 클라이언트에서 강제로 접속을 해제할 때까지는 계속해서 접속이 유지된다. ==> 보통 Socket 통신은 실시간으로 정보 교환이 필요하는 채팅이나 온라인 게임, 실시간 동영상 강좌등에서 사용된다.
>
> **HTTP** : 클라이언트의 요청이 있을 때, 해당 페이지에 대한 자료를 전송하고 곧바로 연결을 끊는 방식 

<br>

<br>

🔵 **CocoaPods**의  `SocketIO`을 이용하여 구현한다.

> 1️⃣ 프로젝트 폴더 이동 `$pod init`
>
> 2️⃣ `$vi Podfile` 로 vi 편집기 사용
>
> 3️⃣ `Socket.IO-Client-Swift` **Cocoapods** 홈페이지의 버전 입력
>
> 4️⃣ `$pod install` 로 해당 **Cocoapods** 라이브러리 설치

<br>

✅ **Socket Service**

```swift
import SocketIO

struct SocketService {
  // Singleton 객체 생성
  static let shared = SocketService()
  // 해당 서버로의 Socket Manager 생성
  let manager = SocketManager(socketURL: URL(string: APIConstants.serverURL)!, config: [.log(true), .compress])									
  // 해당 BaseURL 서버의 "test" 영역과 데이터통신
  // self.manager.socket.defaultSocket을 사용해 namespace 가 "/"인 socket도 생성 가능
 	lazy var socket = self.manager.socket(forNamespace: "/test")
}
```

<br>

 여기서 통신을 하기 위한 중요한 `SocketIO` 메소드들이 있습니다.

1️⃣ `socket.on("test")` : 이름이 "test"로 된 이벤트를 수신한다.

2️⃣ `socket.connect` : 설정한 주소와 namespace(포트)로 연결을 시도한다.

3️⃣ `socket.disconnect` : 소켓 연결을 종료한다.

4️⃣ `socket.emit("msg", ["A", "B"])` : msg란 이벤트로 A, B 데이터를 보낸다.