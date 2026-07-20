import 'package:cloud_firestore/cloud_firestore.dart';

class ScreeningService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveScreening({
    required String childID,
    required String ageGroup,
    required List<Map<String, dynamic>> results,
  }) async {
    await _firestore
        .collection("children")
        .doc(childID)
        .collection("screenings")
        .add({
          "screeningDate": FieldValue.serverTimestamp(),
          "ageGroup": ageGroup,
          "results": results,
        });
  }
}
