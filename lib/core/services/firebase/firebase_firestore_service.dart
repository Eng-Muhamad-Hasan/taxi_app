import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/core/services/database_service.dart';

class FirebaseFirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    final data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<String?> findDocumentIdByField({
    required String path,
    required String field,
    required value,
  }) async {
final result =await firestore.collection(path).where(field, isEqualTo: value).get();
    if (result.docs.isNotEmpty) {
      return result.docs.first.id;
    }
    return null;
  }
    
  @override
  Future<dynamic> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
    String? documentId,
  }) async{
    if (documentId != null) {
      //return a specific doc data from a collection as a Map<String, dynamic>
      final data = await firestore
          .collection(path)
          .doc(documentId)
          .get();
      return data.data();
    } else {
      //return all docs data from a collection as a List<Map<String, dynamic>>
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (queryParameters != null) {
       
        // support orderBy + limit
        if (queryParameters["orderBy"] != null && queryParameters["limit"] != null) {
          String orderByField = queryParameters["orderBy"].toString();
          bool descending = queryParameters["descending"] ?? false;
          final limit = queryParameters["limit"] as int;
          final result = await data
              .orderBy(orderByField, descending: descending)
              .limit(limit)
              .get();
          return result.docs.map((e) => e.data()).toList();
        }
        // support orderBy
       else if (queryParameters["orderBy"] != null) {
          String orderByField = queryParameters["orderBy"].toString();
          bool descending = queryParameters["descending"] ?? false;
          final result = await data
              .orderBy(orderByField, descending: descending)
              .get();
          return result.docs.map((e) => e.data()).toList();
        }
        // support where filter: { 'whereField': 'code', 'whereValue': 'P001' }
        if (queryParameters["whereField"] != null && queryParameters["whereValue"] != null) {
          final whereField = queryParameters["whereField"].toString();
          final whereValue = queryParameters["whereValue"];
          final result = await data
              .where(whereField, isEqualTo: whereValue)
              .get();
          return result.docs.map((e) => e.data()).toList();
        }

        // fallback to simple get
        final result = await data.get();
        return result.docs.map((e) => e.data()).toList();
      } else {
        final result = await data.get();
        return result.docs.map((e) => e.data()).toList();
      }
    }
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async{
  if (documentId != null) {
     await firestore.collection(path).doc(documentId).update(data);
    } else {
      await firestore.collection(path).doc(documentId).set(data);
    }
  }
}