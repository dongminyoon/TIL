## JSON 

1. JSON 이란 ?

JSON ( JavaScript Object Notation )은 사람이 읽을 수 있는 텍스트 기반의 데이터 교환 표준이다.

텍스트 기반이기 때문에, 어떠한 프로그래밍 언어에서도 JSON 데이터를 읽고 사용할 수 있다.

<br>

2. JSON 특징

- JavaScript를 확장하여 만들어졌다.
- JSON은 JavaScript 객체 표기법을 따른다.
- JSON은 기계와 사람 모두 읽기 편하도록 고안되었다.

<br>

### JSON 구조

JavaScript의 객체 표기법으로부터 파생된 부분 집합이다. 따라서 JavaScript 객체 표기법에 따른 구조로 구성된다.

1. JSON 데이터는 이름과 값의 쌍으로 이루어 진다.
2. JSON 데이터는 쉼표 ","로 나열된다.
3. 객체는 {}를 사용하여 나타낸다.
4. 배열은 []을 사용하여 나타낸다.

<br>

##### JSON 객체 

```javascript
{
    "name" : "식빵",
    "family" : "웰시코기",
    "age" : 1,
    "weight" : 2.14
}
```

<br>

##### JSON 배열

```javascript
"dog" : [
    { "name" : "식빵", "family" : "웰시코기", "age" : 1, "weight" : 2.14 },
    { "name" : "콩콩", "family" : "포메라니안", "age": 3, "weight": 2.5 },
    { "name" : "젤리", "family" : "푸들", "age" : 7, "weight" : 3.1 }
]
```

배열 이름은 "dog"이고 3개의 JSON 객체를 요소로 가지는 JSON 배열이다.

<br>

##### 배열과 객체의 차이점

JSON 에서 배열과 객체는 여러 데이터를 묶어놓은 집합이라는 점에서는 서로 비슷한 타입이다. 그러나 객체는 프로퍼티의 집합이며, 배열은 데이터값의 집합이라는 차이가 있다.





