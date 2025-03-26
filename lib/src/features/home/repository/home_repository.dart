import 'package:pit01gp04/src/features/home/model/bill_model.dart';
import 'package:pit01gp04/src/features/home/service/home_service.dart';

class HomeRepository {
  final HomeService homeService;

  const HomeRepository({
    required this.homeService,
  });

  Future<List<Bill>?> getBillsList() async {
    final response = await homeService.getHomeData();

    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singleBill) => Bill.fromMap(singleBill)).toList();
    }
    return null;
  }
}
