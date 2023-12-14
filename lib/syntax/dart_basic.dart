void main() { // 메인 함수 (프로그램의 실행 시작 지점)
  print(4123); // 콘솔 출력 함수

  // 변수와 자료형
  // 변수 란? - 변할 수 있는 수(값)
  // 자료형 이란? - 변수가 저장하는 데이터 형식

  // String (문자열 변수)
  // String name = "홍드로이드";
  String name; // null (비어있는) 상태
  name = "홍드로이드";
  print(name);
  name = "홍길동";
  print(name);

  // int (정수형 변수)
  int age = 30;
  print(age);

  // bool (true or false) - 논리형 변수
  bool isChild = true;
  print(isChild);

  // double - 소수 타입의 변수
  double tall = 164.4;
  print(tall);

  var abc = "abc"; // 타입 추론 변수
  // abc = 10; 다른 데이터를 이후에 넣을 순 없다.


  // 조건문 & 반복문
  int amount = 2000;
  // if 문 - 조건을 검사하고 조건이 참인 경우 중괄호 내부를 실행한다
  if (amount > 3000) {
    print('부자 입니다');
  } else if (amount == 3000) {
    print('평민 입니다');
  } else if (amount == 4000) {
    print ('평민보다 조금 부자');
  } else {
    // if 나 else if에 대한 조건이 모두 해당되지않을때 여기를 실행 합니다 !
    print('모든 조건문에 해당되지 않습니다');
  }

  // 반복문 (for 문)
  for (int i = 0; i < 5; i++) {
    if (i == 1) {
      print ('반복 : $i');
    }
  }

  // List - 순서가 있는 데이터 컬렉션, 인덱스 (index) 라는 개념을 활용해서 특정 요소에 접근할 수 있습니다
  String n1 = "홍드로이드";
  String n2 = "홍길동";
  String n3 = "성보라";

  List<String> listNames = ["홍드로이드", "홍길동", "성보라"];
  print(listNames[2]);
  listNames.add('명쾌한 작은별');

  for (int i = 0; i < listNames.length; i++) {
    print(listNames[i]);
  }


  // 함수와 메서드 (function & method)
  // 함수 - 코드의 논리들을 구분하거나 분리하고, 재 사용성을 높이는 용도로 사용!
  start("홍철 홍철 잘생겼습니다!"); // call function - 함수 호출 !

  String hobby = getName();
  print(hobby);

  int result = add(10, 30);
  print(result);

  Person person = Person('홍드로이드', 30, '컴퓨터 게임'); // 클래스 인스턴스 객체
  person.sayHello();

  // Person('홍드로이드', 30, '컴퓨터 게임').sayHello();


}

void start(String name) {
  print('시작 합니다');
  print (name);
}


String getName() {
  String hobby = "컴퓨터 게임";
  return hobby;
}

int add(int a, int b) {
  return a + b;
}

// class (클래스) - 객체를 생성하기 위한 템플릿 (template), 또는 청사진 (blueprint) 사용 됩니다
// 객체의 상태 (변수) 나 행동 (method function) 을 정의할 수 있습니다

class Person {
  // 객체의 기본 상태 (속성)를 정의
  String name;
  int age;
  String hobby;

  // 생성자 함수
  Person(this.name, this.age, this.hobby);

  // 행동 (method)
  void sayHello() {
    print('안녕하세요 저는 $name이고, $age살, 취미는 $hobby 입니다');
  }

  void walk() {
    print("걷기 !");
  }
}