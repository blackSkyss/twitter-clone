import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/util/providers/firebase_providers.dart';
import 'package:uuid/uuid.dart';

final commonFirebaseStorageRepositoryProvider = Provider((ref) {
  final storage = ref.read(storageProvider);
  return CommonFirebaseStorageRepository(storage);
});

class CommonFirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;

  CommonFirebaseStorageRepository(this.firebaseStorage);

  Future<List<String>> storeFileToFirebase(String ref, List<File> files) async {
    List<String> links = [];
    for (var file in files) {
      final id = const Uuid().v1();
      UploadTask uploadTask =
          firebaseStorage.ref().child("$ref/$id").putFile(file);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      links.add(downloadUrl);
    }
    return links;
  }
}
