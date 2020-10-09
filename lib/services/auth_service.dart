import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../widgets/user.dart';
import '../services/fcm_service.dart';
import '../main.dart';

class AuthService extends UserCredentials {
  FacebookLogin _facebookLogin = FacebookLogin();
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FCMService fcmService = FCMService();
  
  authWithFacebook() async {
    try {
      final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          FacebookAccessToken _accessToken = result.accessToken;
          final _graphResponse = await http.get(
              'https://graph.facebook.com/v2.6/me?fields=id,name,picture,email&access_token=${_accessToken.token}');
          final profile = json.decode(_graphResponse.body);
          final fcmToken = await fcmService.getfcmToken();
          saveUserCredentials(
            _accessToken.userId,
            2,
            fcmToken,
            profile['name'],
            profile['email'],
            profile['picture']['data']['url'],
            _accessToken.token,
            null,
            
          );
          break;
        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
      }
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      throw Exception(e);
    }
  }

  logwithG() async {
    try {
      googleSignIn.signIn().then(
        (final GoogleSignInAccount account) async {
          final GoogleSignInAuthentication auth = await account.authentication;
          final fcmToken = await fcmService.getfcmToken();
          saveUserCredentials(
            account.id,
            1,
            fcmToken,
            account.displayName,
            account.email,
            account.photoUrl,
            auth.accessToken,
            null,
          );
        },
      ).whenComplete(() => main()); 
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      throw Exception(e);
    }
  }

  void signOut() async {
    final prefs = await SharedPreferences.getInstance();
    _facebookLogin.logOut();
    googleSignIn.signOut();
    prefs.clear();
  }

  Future signInWithApple() async {
    try {
      var appleCredentials = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName
          ]);

      final fcmToken = await fcmService.getfcmToken();

      saveUserCredentials(
        appleCredentials.userIdentifier,
        3,
        fcmToken,
        appleCredentials.familyName + ' ' + appleCredentials.givenName,
        appleCredentials.email,
        null,
        appleCredentials.identityToken,
        appleCredentials.authorizationCode,
      );
    } on SignInWithAppleAuthorizationException {
      throw SignInWithAppleCredentialsException(message:'Remove from user');
    } catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s);
      throw Exception(e);
    }
  }
}
