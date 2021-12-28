import 'package:nasa_application/core/services/exporter.dart';

class AuthService {
  static final _instance = AuthService._();
  factory AuthService() => _instance;

  AuthService._() {
    _authStateController.add(LoginRequired());
  }

  final StreamController<AuthState> _authStateController =
      StreamController<AuthState>();

  Stream<AuthState> get authStream => _authStateController.stream;

  Future<bool> init() async {
    try {
      var app = await Firebase.initializeApp();
      FirebaseAuth auth = FirebaseAuth.instanceFor(app: app);
      auth.authStateChanges().listen((User? user) {
        if (user == null) {
          _authStateController.add(LoginRequired());
        } else {
          _authStateController.add(LoggedIn());
        }
      });
      return true;
    } on Exception catch (e) {
      throw StateError(e.toString());
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        StateError(result.message ?? 'Unkown error');
      }
    } on Exception catch (e) {
      StateError(e.toString());
    }
  }

  Future<void> logOutFromFacebook() async {
    FirebaseAuth.instance.signOut();
  }
}

abstract class AuthState {}

class LoggedIn extends AuthState {}

class LoginRequired extends AuthState {}
