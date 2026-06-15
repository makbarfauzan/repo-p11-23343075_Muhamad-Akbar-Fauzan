import 'package:dio/dio.dart';

class NoteRemoteDataSource {
  final Dio dio;

  NoteRemoteDataSource(this.dio);

  Future<List<dynamic>> getNotes() async {
    try {
      final response = await dio.get('/notes');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Gagal mengambil data note: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> getNoteById(int id) async {
    try {
      final response = await dio.get('/notes/$id');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Gagal mengambil note: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> createNote(Map<String, dynamic> note) async {
    try {
      final response = await dio.post('/notes', data: note);
      return response.data;
    } on DioException catch (e) {
      throw Exception('Gagal menambah note: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> updateNote(int id, Map<String, dynamic> note) async {
    try {
      final response = await dio.put('/notes/$id', data: note);
      return response.data;
    } on DioException catch (e) {
      throw Exception('Gagal mengubah note: ${e.message}');
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      await dio.delete('/notes/$id');
    } on DioException catch (e) {
      throw Exception('Gagal menghapus note: ${e.message}');
    }
  }
}
