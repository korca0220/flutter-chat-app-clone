# flutter_chat_app_clone

실행 방법
- firebase 파일 압축해제

```
flutter pub run build_runner build
```

프로젝트 구조
```
lib
  ㄴ data
    ㄴ repositories // Implement
    ㄴ source // remote API
  ㄴ doamin
    ㄴ model 
    ㄴ repositories // Interface
    ㄴ use_case
  ㄴ global // 전역으로 쓰이는 것들
    ㄴ ...
  ㄴ presentation
    ㄴ pages // UI & ViewModel
      ㄴ example_page
        ㄴ event // Logic, UI Event
        ㄴ example_page.dart
        ㄴ example_page_view_model.dart
    ㄴ providers // provider, DI
  main.dart
```
