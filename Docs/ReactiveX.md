# ReactiveX

ReactiveX는 관측가능한(observable) 시퀀스를 사용해 비동기 및 이벤트 기반 프로그램을 구성하기 위한 라이브러리이다.

ReactiveX는 Observer pattern을 확장해 데이터나 이벤트의 시퀀스를 지원하고 낮은 수준의 스레드, 동기화, 스레드 안전성, 동시 데이터 구조 및 논블로킹 I/O에 대한 문제를 추상화하는 동시에 순서를 함께 구성할 수 있는 연산자를 선언적으로 추가한다. 

Observables은 여러 항목의 비동기 시퀀스에 접근하는 이상적인 방법이다. 

<img src = "https://user-images.githubusercontent.com/40784518/91989731-cfb12c80-ed6b-11ea-8774-3c9ab4076a89.png" width = 80%/>



이것은 때때로 "함수형 반응형 프로그래밍"이라고 불린다. 그러나 이것은 부정확한 단어다. ReactiveX는 함수형일 수 있고 혹은 반응형일 수 있다. 그래서  "함수형 반응형 프로그래밍"은 다른 동물이다(?). 한가지 주요 차이점은 함수형 반응형 프로그래밍이 시간이 지남에 따라 지속적으로 변화하는 값에서 작동하는 반면, ReactiveX는 시간에 따라 방출된 별개의 값을 연산한다는 것이다.



## Observables를 사용하는 이유

ReactiveX의 Observable 모델을 사용하면 배열과 같은 데이터 컬렉션에 사용하는 것과 동일한 종류의 단순하고 압축 가능한 작업으로 비동기 이벤트의 스트림을 처리할 수 있다. 이것은 뒤죽박죽 얽힌 콜백의 거미줄에서 해방시켜주고, 더 읽기 쉽고 버그에 덜 걸리게 해준다. 



단일 수준의 비동기 작업은 사용이 쉽지만 이것이 중첩되었을 때, 복잡성이 늘어난다. iOS 개발시에도 DispatchQueue를 이용해 비동기 작업을 수행할 수 있지만 실행 흐름을 최적으로 구성하기 어렵고, 복잡해지고, 오류가 발생하기 쉽다. 

ReactiveX의 Observables은 비동기 데이터의 흐름을 구성하기 위해 만들어졌다.



## Reactive Programming

ReactiveX는 Observable을 필터링, 선택, 변환, 결합 및 작성할 수 있게하는 연산자 집합을 제공한다. 이를 통해 효율적인 실행과 구성이 가능하다.

Iterable을 사용하면 소비자는 스레드 블록에서 생산자로부터 값이 도착할때까지 기다린다. 이와는 대조적으로 Observable은 생산자가 값을 사용할 수 있을 때마다 소비자에게 값을 푸시한다. 이 접근 방식은 값이 동기식 또는 비동기식으로도 도착할 수 있기 때문에 더욱 유연하다.



### Reference

http://reactivex.io/intro.html