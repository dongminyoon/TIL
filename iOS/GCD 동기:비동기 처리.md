## GCD 비동기 처리

 🔵 ***Grand Central Dispatch(GCD)***

 `Dispatch Queue` 을 사용하면 비동기식/동기식으로 임의의 코드블록을 수행할 수 있다. 기본적으로 Queue이기 때문에 ***FIFO***방식이다. 앱에서 사용가능한 여러가지 타입이 있다.

***작업 수행 방식***

> 👉 ***Serial Queue*** : 큐에 추가된 순서대로 한번에 하나의 Task을 수행한다. 필요한만큼 Queue 생성이 가능하다. 단 하드웨어의 성능에 맞추어야한다. 예를 들어 4개를 생성시 한 큐는 하나의 Task만을 수행하지만 동시에 동시에 4개의 Task가 수행된다.
>
> 👉 ***Concurrent Queue*** : 큐에 Task가 추가된 순서대로 계속 실행된다. 즉 한 Queue내에서도 여러가지의 작업들이 동시에 수행된다.

<br>

***Dispatch Queue 종류***

>👉 ***Main Dispatch Queue*** : 메인 쓰레드에서 Task을 실행하는 전역적으로 사용 가능한 Serial Queue이다. 즉 앱의 실행 루프에 맞추어 실행되는 Queue이다.
>
>👉 ***Global Dispatch Queue*** : 기본적으로 Concurrent 방식으로 Task을 실행한다. 메인 쓰레드 외에 전역적으로 사용가능한 Dispatch Queue이다.
>
>👉 ***커스텀 Dispatch Queue*** : 위의 두 Dispatch Queue 이외에 본인이 직접 설정하고 Dispatch Queue을 만들 수 있다.

<br>

**커스텀 Dispatch Queue**

```swift
// 본인이 원하는 방식으로 수행 방식을 정할 수 있다.
// Default 값은 Serial한 Queue이다.
let myDispatchQueue = DispatchQueue(label: "myDispatch", attributes: .concurrent)
```

<br>

❗️**Main Dispatch Queue에서 sync을 호출하면 안된다.**

 아직 정확한 이유는 모르겠고 느낌정도만 알겠다.

 sync로 선언을 하고 실행을 시키게 되면 다른 Task가 작업 완료될 때까지 wait상태에 머물러 있게 된다. 그렇기 때문에 **Main**에서 sync을 호출하게 되면 **Main**함수에서 앱의 주요 루프들이 돌아가는데 멈춰있게 된다. 그러다 앱이 무한정 기다리는 상태가 되어 ***dead lock*** 상태에 빠져 앱이 죽게 된다.

 UI 관련 작업들은 모두 Main Dispatch Queue에서 수행하여야 한다. 바로 UIApplication 인스턴스가 메인 쓰레드에 붙어있기 때문이다. `UIApplication -> UIWindow -> UIViewController -> UIView -> subviews` 와 같은 순으로 UI Event들이 연결되어 있다. 즉 UI작업들은 메인 쓰레드의 일부라고 할 수 있다. 그렇기 때문에 Main Dispatch Queue에서 이루어져야 한다.

