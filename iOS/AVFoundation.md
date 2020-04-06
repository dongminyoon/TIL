## AvFoundation

  ***AvFoundation***은 Apple 플랫폼에서 시청각 미디어를 캡쳐, 처리, 합성, 가져오기(import), 내보내기(export)를 하는 다양한 작업을 포함한 4개의 주요 기술 영역을 결합한 프레임워크이다.

 **미디어 재생** 기능이 가장 자주 사용된다. HTTP 실시간 스트리밍을 통해 원격으로 제공되는 QuickTime 동영상, MP3 오디오 파일 및 시청각 미디어와 같은 미디어 asset을 효율적으로 로드하고 제어할 수 있다.

<br>

## AVKit

 ***AVKit***은 미디어 재생을 위한 View-Level 서비스를 생성하고, 사용자 제어 기능, 챕터 탐색 기능 및 자막 및 자막 지원 기능을 관벽하게 지원한다.

 ***AVKit***은 Layer 구조에서 보아도 ***AvFoundation*** 위에 있는 프레임워크이다. 즉 보조라고 볼 수 있다. ***AVFoundation***의 재생 인프라를 사용하여, 재생중인 컨텐츠와 어울리는 플레이어 인터페이스를 제공한다.

<br>

**비디오 재생기능에 관한 Asset**

 `AVAsset`의 객체의 프로퍼티를 통해 현재 미디어 데이터의 재생 가능 여부, 총 재생 시간, 생성 날짜 그리고 메타 데이터등의 데이터들에 접근이 가능하다.

 `AvAsset`을 생성했다고해서 언급한 정보들에 대해 즉시 접근할 수 있는 것은 아니다. 생성된 직후 아직 채워지지 않은 값에 대한 값들을 비동기적으로 메소드를 이용해 받아올 수 있다.

👉  `loadValuesAsynchronously(forKeys:completionHandler:)` : 원하는 속성을 비동기적으로 받아올 수 있다.

👉 `statusOfValue(forkey:error:) -> AVKeyValueStatus` : 해당 키에 관한 **AVAsset**의 속성을 가져온다.

<br>

***애플의 예제***

```swift
// 재생 가능한지 여부를 가지고 있는 'playable' 속성을 가져오는 코드
let url = Bundle.main.url(forResource: "example", withExtension: "mp4")!
let asset = AVAsset(url: url)
let playableKey = "playable"

// Load the "playable" property
asset.loadValuesAsynchronously(forKeys: [playableKey]) {
    var error: NSError? = nil
    let status = asset.statusOfValue(forKey: playableKey, error: &error)
    switch status {
    case .loaded:
        // 데이터를 성공적으로 받아온 경우
    case .failed:
        // 데이터 받아오기 실패
    case .cancelled:
        // 도중에 취소
    default:
        // Handle all other cases
    }
}
```

<br>

<br>

***비디오 재생 예제 만들기❗️***

 `class AVPlayer: NSObject` 객체를 이용해서 미디어의 재생, 시간 등을 컨트롤할 수 있다. QuickTime Movie, Mp3 파일, HTTP Live Streaming 파일들을 재생할 수 있다.

 **AVPlayer** 객체는 단 하나의 미디어 Asset을 한 타임에 재생 가능하다. 그리고 `replaceCurrentItem(with:)` 메소드를 이용해서 **AVPlayer**을 재활용하여 다른 Asset 파일을 재생할 수 있다.



