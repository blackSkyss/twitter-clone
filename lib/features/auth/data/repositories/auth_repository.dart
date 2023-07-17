import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/util/providers/firebase_providers.dart';
import '../../../../util/constants/constants_export.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final auth = ref.read(authProvider);
  final firestore = ref.read(firestoreProvider);
  return AuthRepository(
    auth: auth,
    firestore: firestore,
  );
}

@Riverpod(keepAlive: true)
Stream<User?> authState(AuthStateRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChange;
}

@riverpod
Future<UserModel> getUserData(GetUserDataRef ref, String userId) async {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.getUserData(userId);
}

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  // Login
  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = await getUserData('');
    return user;
  }

  // Signup
  Future<UserModel> signupUser({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserModel user = UserModel(
      email: email,
      name: credential.user!.displayName ?? 'empty',
      followers: [],
      following: [],
      profilePic: AssetsConstants.defaultProfilePic,
      bannerPic: credential.user!.photoURL ?? 'empty',
      uid: credential.user!.uid,
      bio: 'empty',
      isTwitterBlue: false,
    );

    await _users.doc(credential.user!.uid).set(user.toMap());
    return user;
  }

  // Logout
  Future<void> logOut() async {
    await _auth.signOut();
  }

  // Get user data
  Future<UserModel> getUserData(String uid) async {
    if (uid.isEmpty) {
      final currentUser = _auth.currentUser;
      final snapshot = await _users.doc(currentUser!.uid).get();
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    }

    final snapshot = await _users.doc(uid).get();
    return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }
}
