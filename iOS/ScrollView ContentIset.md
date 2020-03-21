## ScrollView AdjustedContentInset / ContentInsetAdjustmentBehavior

<br>

***ScrollView의 ContentInsetAdjustmentBehavior을 공부하다 발견***

 두 변수 모두 ScrollView의 프로퍼티로 있는 속성이다. ContentInset과 관련된 속성들이다.

<br>

🔵 **`adjustedContentInset`** : get만 가능한 타입이다. 여기서 `systemInset`이란 `contentInsetAdjustmentBehavior`로 결정되는 값이다. 

> adjustedContentInset = contentInset + systemInset

🔵 **`ContentInsetAdjustmentBehavior`** : adjusted content offset을 결정하기 위한 동작이다. 즉 adjusted content inset에 safe area inset이 어떻게 추가될지를 나타내는 상수이다.

> 👉 ***automatic*** : Content Inset을 전혀 건들지 않아도 자동으로 safe Area에 맞게 조절해주는 옵션 ➡️ 여기서 Inset이 자동으로 조절되면서 ContentOffset 역시 늘어난 Inset만큼 -된다.
>
> 👉 ***scrollableAxes*** : 스크롤이 가능한 방향으로만 Inset을 자동으로 조절해주는 옵션
>
> 👉 ***never*** : 이 경우는 ContentInset을 어떤 경우에도 조절해주지 않는다는 옵션
>
> 👉 ***always*** : 이 경우는 항상 조절 시, Safe Area Inset을 포함해서 전부 조절해주는 옵션 즉, Scrollable 외에도 조절이 가능하다.

<br>

❗️**하면서 알게 된 것 ContentInset으로 띄워진 만큼 Offset은 -가 된다**❗️