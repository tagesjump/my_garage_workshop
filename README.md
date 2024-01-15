# Мой гараж

Вы готовы погрузиться в мир кроссплатформенной разработки и создать свое первое приложение «Мой гараж»? Наш воркшоп –
это уникальная возможность для всех, кто хочет освоить Flutter, один из самых востребованных и динамично развивающихся
инструментов для создания приложений на рынке.

## Архитектура

Этот проект следует принципам [Google architecture guidelines](https://developer.android.com/jetpack/docs/guide),
основанным на архитектуре [BLoC](https://bloclibrary.dev/#/), придерживаясь ряд идей
относительно [чистой архитектуры](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), которые
подразумевают разделение слоев проекта на несколько уровней.

Достичь этих идей также помогает использование Dependency Injection с реализацией DI-контейнера при помощи
пакета [get_it](https://pub.dev/packages/get_it) в связке с автоматическим внедрением зависимостей
через [injectable](https://pub.dev/packages/injectable). Все модели проекта основаны на использовании
объектов [equatable](https://pub.dev/packages/equatable).

## Требования к среде разработки

* [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.16.7 и выше)
* [Dart SDK](https://dart.dev/get-dart) (3.2.4 и выше)
* [Android Studio и IntelliJ](https://docs.flutter.dev/tools/android-studio)
  или [Visual Studio Code](https://docs.flutter.dev/tools/vs-code)

## Начало работы

### Шаг 1

Для установки зависимостей проекта переходим в корневую директорию и запускаем команду:

```shell
flutter pub get
```

### Шаг 2

Этот проект зависим от библиотек, которые используют кодогенерацию, поэтому, необходимо запустить следующую
команду для генерации этих файлов:

```shell
dart run build_runner build --delete-conflicting-outputs
```

### Проблемы с кодогенерацией?

Убедитесь, что вы применяете все свои изменения в коде — запуском кодогенерации. Если же что-то пошло не так, то вы
всегда можете удалить сгенерированные файлы следующей командой:

```shell
dart run build_runner clean
```

И перезапустить кодогенерацию, вернувшись к шагу [№2](#шаг-2).

## Полезные ресурсы

* [Flutter](https://flutter.dev/)
* [Effective Dart](https://dart.dev/effective-dart)
