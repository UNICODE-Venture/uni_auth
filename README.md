# UniAuth

**DEVELOPED BY UNICODE TEAM**

UniAuth is a Flutter package designed to handle authentication modules in Flutter applications. It integrates various authentication services, primarily focusing on Firebase Auth for authentication and Unifonic for sending and verifying OTPs (One-Time Passwords).

## Features

- Firebase Authentication for seamless sign-in and sign-up.
- Integration with Unifonic for OTP-based authentication.
- Comprehensive error handling and user feedback.
- Highly customizable for various authentication scenarios.

## Getting Started

to use UniAuth in your Flutter project, follow these steps:

### Installation

1. Add UniAuth to your `pubspec.yaml` file:

```yaml
dependencies:
  uni_auth: latest_version
```

2. Run `flutter pub get` to install the package.

### Usage

Import UniAuth in your Dart file:

```dart
import 'package:uni_auth/uni_auth.dart';
```

Initialize UniAuth with your Firebase Instance and baseUrl:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // here First you need to initialize your firebase app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // then init UniAuth Package and baseUrl and local as option
  UniAuth.init(
    auth: FirebaseAuth.instance,
    locale: const Locale('en'), //Optional
    baseUrl: 'YOUR_BASE_URL',
  );

  runApp(const MyApp());
}
```

#### Some Methods

#### Create User With Email and Password

```dart
 await UniAuthService.createUserWithEmail(
        authData: AuthData(
          email: 'YOUR_EMAIL',
          password: 'YOUR_PASSWORD',
        ),
      );
```

#### Check User LoggedIn or Not

```dart
UniAuthService.checkUserLoggedIn;
```

#### Send and Verify OTP

```dart
UniAuthService.sendOTP(AuthData());
UniAuthService.verifyOTP(AuthData());
```

#### Login with token

```dart
UniAuthService.loginWithToken(token: 'YOUR_TOKEN');
```

## Example

An example application demonstrating how to use UniAuth is included in the package. Check the `example` directory for more details.

## Contributing

Contributions are welcome! If you would like to contribute, please fork the repository and submit a pull request.

## License

UniShipping is available under the [MIT license](LICENSE). See the LICENSE file for more info.
