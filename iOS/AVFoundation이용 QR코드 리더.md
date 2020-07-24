## iOS QR Code Scanner 만들기

<br>

***AvFoundation 이용해서 QR코드 리더기 만들기***

>  iOS 7 이후로는 별도의 라이브러리 사용없이 카메라 기본 기능을 통해 QR 코드를 읽을 수 있게 되었다. 즉 AVFoundation의 기존 제공 기능만을 이용해서 QR 코드를 읽고 번역할 수 있다.

<br>

 우선 `AVFoundation`을 사용하기 때문에 프레임워크를 가져올 필요가 있다. 또한 Video을 사용하기 위해 몇 가지의 변수 설정이 필요하다.

```swift
import AVFoundation

// iOS에서 Video, Audio의 전반적인 설정을 관리하는 객체 ==> 사용하기 위해서는 필수이다.
var captureSession = AVCaptureSession()

// CALayer의 SubClass로서 Video 화면을 표시하는데 사용된다.
var videoPreviewLayer: AVCaptureVideoPreviewLayer?

// QR Code가 인식되었을 때, QR Code 바탕에 띄우는 화면이다.
var qrCodeView: UIView = {
  var tempFrameView = UIView()
  tempFrameView.layer.borderColor = UIColor.green.cgColor
  tempFrameView.layer.borderWidth = 2
  return tampFrameView
}
```

<br>

 CaptureSession에 직접적으로 어떤 Video을 사용할건지 어떤 데이터를 받아올건지의 값을 명시적으로 알려주어야 한다. 이를 위해 다음과 같은 작업이 필요하다.

1️⃣ Input 장치로 어떤 것을 쓸건지

2️⃣ Output 데이터로 어떤 데이터를 쓸건지

<br>

 처음으로 Input 데이터를 설정하는 작업이다.

```swift
guard let captureDevice = AVCaptureDevice.default(for: .video, position: .back) else { return }

do {
  let videoInput = try AVCaptureDeviceInput(device: captureDevice)
  if captureSession.canAddInput(videoInput) { captureSession.addInput(videoInput) }
}
```

<br>

 다음으로 Output으로 QR 코드의 데이터를 받을 것이기 때문에 설정하는 작업이다.

```swift
let captureMetadataOutput = AVCaptureMetadataOutput()
if captureSession.canAddOutput(captureMetadataOutput) { captureSession.addOutput(captureMetadataOutput) }

// MetaData가 인식되었을 때, 처리할 객체를 self로 지정 ==> self로 지정하기 위해 AVCaptureMetadataOutputObjectsDelegate 프로토콜을 채택하여야 한다.
// 들어오는 MetaData가 QR 코드임을 명시
captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
```

<br>

 카메라 화면을 앱에 표현하기 위한 `AVCaptureVideoPreviewLayer` 설정

```swift
// 앞에서 선언한 videoPreviewLayer을 이용한다.
videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
videoPreviewLayer?.frame = view.layer.bounds

// CALayer의 SubClass이기 때문에 Layer로 추가를 해주어야 한다.
view.layer.addSublayer(videoPreviewLayer!)
```

<br>

 이제 QR 코드를 인식했을 때의 동작이 필요하기 때문에, `AVCaptureMetadataOutputObjectsDelegate`을 프로토콜을 채택하여 구현해주어야 한다.

1️⃣ 데이터가 0개로 하나도 들어오지 않은 경우 `qrCodeFrameView`의 크기를 0으로 설정해주었다.

2️⃣ 데이터가 들어온 경우

```swift
extension ViewController: AVCaptureMetadataOutputObjectsDelegate {
  // MetaData가 들어올 때마다 실행되는 메소드
  func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
    if metadataObjects.count == 0 {
      self.qrCodeFrameView.transform = CGAffineTransform(scaleX: 0, y: 0)
      return
    }
    
    // MetaData을 사람이 읽을 수 있는 Data로 캐스팅
    guard let metaDataObj = metadataObjects[0] as? AVMetadataMachineReadableCodeObject else {
      print("Fail to cast MetaData as AVMetadataMachineReadableCodeObject")
      return
    }
    
    // QR 데이터인 경우
    if metaDataObj.type == .qr {
      // MetaData을 캡쳐한 직접적인 화면을 가져온다.
    	let qrCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metaDataObj)
      // 가져온 QR Code 화면을 캡쳐한 위치를 넣어준다.
      self.qrCodeFrameView.frame = qrCodeObject!.bounds
      // 작은 곳에서 커지게 애니메이션
      UIView.animate(withDuration: 0.5) {
        self.qrCodeFrameView.transform = CGAffineTransform(scaleX: 1, y: 1)
      }
      
      // 여기서 직접적으로 가져온 QR Code 데이터를 해독한다.
      guard let qrCodeStringData = metaDataObj.stringValue,
      let tokenInform = self.tokenInform else { return }
    }
  }
}
```

<br>

 각각의 설정을 모두 마쳐준 후, 마지막으로 `AVCaptureSession`을 재생시켜주면 된다.

```swift
catureSession.startRunning()
```



