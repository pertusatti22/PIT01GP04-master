import '../model/dream_model.dart';
import '../service/dream_service.dart';

class DreamRepository {
  final DreamService dreamService;

  const DreamRepository({
    required this.dreamService,
  });

  Future<List<Dream>?> getDreamList() async {
    final response = await dreamService.getDreamData();

    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singleDream) => Dream.fromMap(singleDream)).toList();
    }
    return null;
  }
}
