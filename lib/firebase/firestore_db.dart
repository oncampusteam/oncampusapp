import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:on_campus/firebase/classes.dart';
import 'package:on_campus/firebase/constants.dart';
import 'package:flutter/material.dart';
import 'package:on_campus/screens/Welcome%20Screens/welcome_screen_4.dart';
import 'package:on_campus/screens/Welcome%20Screens/welcome_screen_5.dart';

class FirestoreDb {
  static FirestoreDb instance = FirestoreDb();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Regions>> getRegions(BuildContext context) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collection("Region").get();

      List<Regions> regionsList =
          querySnapshot.docs.map((e) => Regions.fromJson(e.data())).toList();

      return regionsList;
    } catch (e) {
      print(e);
      Get.snackbar("Error",
          "An unknown error occurred. Please try again later. \n ${e.toString()}\n ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
      return [];
    }
  }

  Future<List<Hostels>> getPrivateHostels() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collectionGroup("Private Hostels").get();

      List<Hostels> allPrivateHostels =
          querySnapshot.docs.map((e) => Hostels.fromJson(e.data())).toList();
      for (var e in querySnapshot.docs) {
        String fullPath = e.reference.path;

        // Example path: "Regions/Ashanti/Cities/Ayeduase/Private Hostels/Wagyingo"
        List<String> pathSegments = fullPath.split('/');

        String region = pathSegments[1];
        String city = pathSegments[3];
        await e.reference.update({
          'region': region,
          'city': city,
        });
        // print("Data: ${e.data().length}");
        // print("Data-info: ${e.data()}");
      }
      return allPrivateHostels;
    } catch (e) {
      print(e);
      Get.snackbar("Error",
          "An unknown error occurred. Please try again later. \n ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
      return [];
    }
  }

  Future<List<Hostels>> getSchoolHostels() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collectionGroup("School Hostels").get();
      List<Hostels> allSchoolHostels =
          querySnapshot.docs.map((e) => Hostels.fromJson(e.data())).toList();

      for (var e in querySnapshot.docs) {
        String fullPath = e.reference.path;

        // /Region/Cape Coast/Universities/UCC/School Hostels/SRC Hostel
        List<String> pathSegments = fullPath.split('/');
        String region = pathSegments[1];
        String university = pathSegments[3];
        await e.reference.update(
          {'region': region, 'university': university},
        );
        print(e.data().length);
      }
      return allSchoolHostels;
    } catch (e) {
      Get.snackbar("Error",
          "An unknown error occurred. Please try again later. \n ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
      return [];
    }
  }

  Future<List<Hostels>> getPopular() async {
    List<Hostels> popularHostels = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
          .collectionGroup("Private Hostels")
          .where("ispopular",
              isEqualTo: true) // use boolean true instead of string
          .get();

      popularHostels =
          querySnapshot.docs.map((e) => Hostels.fromJson(e.data())).toList();
      for (var e in querySnapshot.docs) {
        print(e.data());
      }

      return popularHostels;
    } catch (e) {
      print("Anfa oo");
      print(e);
      Get.snackbar("Error",
          "An unknown error occurred. Please try again later. \n ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
      return [];
    }
  }

  Future<List<Hostels>> roomTypes(String name) async {
    List<Hostels> popu = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
          .collectionGroup("Private Hostels")
          .where(FieldPath.documentId, isEqualTo: name)
          .get();

      popu = querySnapshot.docs.map((e) => Hostels.fromJson(e.data())).toList();

      for (var e in querySnapshot.docs) {
        print("popu: ${e.data()}");
      }

      return popu;
    } catch (e) {
      Get.snackbar("Error",
          "An unknown error occurred. Please try again later. \n ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
      return [];
    }
  }

  Future<List<Hostels>> getPopu() async {
    List<Hostels> popu = [];
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
          .collection("Cities")
          .doc("Ayeduase")
          .collection("Private Hostels")
          // .where("isPopular", isEqualTo: true)
          .get();

      popu = querySnapshot.docs.map((e) => Hostels.fromJson(e.data())).toList();

      for (var e in querySnapshot.docs) {
        print("popu: ${e.data()}");
      }

      return popu;
    } catch (e) {
      print("An error occurred during Google sign-in: $e");
      Get.snackbar("Error",
          "An unknown error occurred. Please try again later. \n ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
      return [];
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      print("loading....");

      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        UserModel usermodel = UserModel(
            email: userCredential.user?.email,
            name: userCredential.user!.displayName,
            id: userCredential.user?.uid);

        Get.to(
            () => WelcomeScreen5(
                username: userCredential.user!.displayName!.split(' ').first),
            transition: Transition.fadeIn,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 600));

        await db.collection("Users").doc(usermodel.id).set(usermodel.toJson());

        await db
            .collection("Users")
            .doc(usermodel.id)
            .collection("favHostels")
            .doc();
      }

      print(userCredential.user?.displayName);
      print(userCredential.user?.uid);
      print(userCredential.user?.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        print("The account already exists with a different credential.");
        Get.snackbar("Error",
            "An account already exists with the same email address but with a different sign-in method. Please use the correct sign-in method.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'invalid-credential') {
        print("The provided credential is malformed or has expired.");
        Get.snackbar("Error", "Invalid login credentials. Please try again.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'user-disabled') {
        print("The user account has been disabled by an administrator.");
        Get.snackbar("Error",
            "This user account has been disabled. Please contact support for assistance.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'user-not-found') {
        print("There is no user corresponding to the provided credentials.");
        Get.snackbar("Error",
            "No user found with these credentials. Please try again or register.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        print("The password is invalid or the user does not have a password.");
        Get.snackbar("Error", "Incorrect password. Please try again.",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print("An unexpected error occurred: ${e.message}");
        Get.snackbar("Error",
            "An unexpected error occurred during sign-in: ${e.message}",
            snackPosition: SnackPosition.BOTTOM);
      }
    } on GoogleSignInAccount catch (e) {
      print("Google Sign-In failed: $e");
      Get.snackbar("Error",
          "Google sign-in failed. Please check your network connection and try again.",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print("An error occurred during Google sign-in: $e");
      Get.snackbar("Error",
          "An unknown error occurred. Please try again later. \n ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> createFavHostels(Hostels hostel, UserModel usermodel) async {
    await db
        .collection("Users")
        .doc(usermodel.id)
        .collection("favHostels")
        .doc(hostel.name)
        .set(hostel.toJson());
  }
}
