import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Data {
  static final List<String> listFilter1 = [
    "All",
    "Indian",
    "Italian",
    "Asian",
    "French",
    "Mexican",
    "Chinese"
  ];

  static final List<String> listFilter2 = [
    "All",
    "France",
    "Civ",
    "Americ",
    "Yemen",
    "Mali",
    "Senegal"
  ];

  static Future<List<Map<String, dynamic>>?> getListHomePost() async {
    List<Map<String, dynamic>> listHomePost = [];
    try {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
          await getDoc('listHomePost');

      for (var element in docs) {
        Map<String, dynamic> data = element.data();
        listHomePost.add(data);
      }

      return listHomePost;
    } on Exception {
      return null;
    }
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDoc(
      String path) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection(path).get();
    await Future.delayed(
        const Duration(seconds: 2)); //simulating network latency
    final docs = snapshot.docs;
    return docs;
  }

  static Future<List<Map<String, dynamic>>?> getListFoodHome() async {
    List<Map<String, dynamic>> listFoodHome = [];
    try {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
          await getDoc('listFoodHome');

      for (var element in docs) {
        listFoodHome.add(element.data());
      }
      return listFoodHome;
    } on Exception {
      // TODO
      return null;
    }
  }

  static Future<void> addListsFireBase() async {
    try {
      // for ( Map<String, dynamic> element in listFoodHome) {
      //   FirebaseFirestore.instance
      //   .collection('listFoodHome').add(element);
      // }

      // for ( Map<String, dynamic> element in listHomePost) {
      //   FirebaseFirestore.instance
      //   .collection('listHomePost').add(element);
      // }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }
}
