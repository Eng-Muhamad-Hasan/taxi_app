abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<dynamic> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
    String? documentId,
  });

  Future<bool> checkIfDataExists({
    required String path,
      required String documentId,
  });

  Future<String?> findDocumentIdByField({
    required String path,
    required String field,
    required dynamic value,
  });
}
