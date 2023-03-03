## Flutter App Using Hive
### Setup Dependencies

- Add the following to your pubspec.yaml:
  ```
  dependencies:
      hive: ^2.2.3
      hive_flutter: ^1.1.0
      uuid: ^3.0.7
      flutter_datetime_picker: ^1.5.1
      eva_icons_flutter: ^3.1.0
   
  dev_dependencies:
      hive_generator: ^2.0.0
      build_runner: ^2.3.3
  ```
  
- Guide to get adapter class:
  ```
  Write this command in your terminal:
  flutter pub run build_runner build --delete-conflicting-outputs
  ```