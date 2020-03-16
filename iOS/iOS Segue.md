## 화면전환 Segue

<br>

**Segue**

 iOS에서 화면을 전환하는 방법에서 스토리보드를 통해 목적지를 직접 지정하는 방식을 Segue을 이요한 화면 전환이라고 한다. 두 화면 사이 연결된 전환 객체를 Segue 객체라고 한다.

<br>

***Segue 4가지 종류***

👉 **Show**

> - `Navigation Controller`을 Embed 했을 때 사용된다. Push로 `Navigation  Controller`의 스택의 최상단에 쌓이게 된다.
>
> - `Navigation Controller`가 Embed 되어있지 않은 경우는 Modal 방식으로 화면이 전환된다.

👉 **Show Detail**

> * 아이패드에서 사용되는 화면전환 방법이다.
> * `Navigation Controller` 스택에는 전혀 영향을 미치지 않는다. Push가 아닌 Replace 된다는 점에서 크게 다르다.

👉 **Present Modally**

> * `Navigation Controller` 스택에는 전혀 영향을 미치지 않는다.
> * Modal Style, Transition Style을 지정하여 다양한 방식으로 연출가능하다.

👉 **Popover Presentation**

> * 아이패드에서만 사용되는 화면 전환 방식이다. 작은 Popup 형태의 뷰을 띄운다.

