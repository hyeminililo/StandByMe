// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleAuth {
//   // Google 로그인을 수행하고 Firebase에 인증 처리하는 메소드
//   Future<UserCredential> signInWithGoogle() async {
//     GoogleSignIn googleSignIn = GoogleSignIn();

//     // Trigger the authentication flow // 인증흐름을 트리거 하기 -> 이곳에서 구글 계정으로 로그인 할 수 있는 페이지로 리디렉션됨
//     final GoogleSignInAccount? account = await googleSignIn
//         .signIn(); //googleUser에 계정 정보 저장 (id, e-mail, nickname)

//     if (account != null) {
//       // Obtain the auth details from the request // 요청에서 인증 세부정보를 얻는다 (aceessToken과 idToken 정보 불러옴 )
//       final GoogleSignInAuthentication googleAuth = await account
//           .authentication; // googleUser에 authentication을 통해 인증에 필요한 세부 정보 얻기

//       // Create a new credential으로 accessToken과 idToken 을 저장 (credential에)
//       final AuthCredential googleCredential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final firebaseAuth = FirebaseAuth.instance;

//       // Once signed in, return the UserCredential
//       return await firebaseAuth.signInWithCredential(googleCredential);
//     }
//     //   FirebaseUser user = authResult.user;
//     throw Exception("Google sign-in failed");
//   }
// }
