import '../model/account_model.dart';
import '../service/account_service.dart';

class AccountRepository {
  final AccountService accountService;

  const AccountRepository({
    required this.accountService,
  });

  Future<List<Account>?> getAccountList() async {
    final response = await accountService.getAccountsData();

    if (response != null) {
      final data = response.data as List<dynamic>;
      return data
          .map((singleAccount) => Account.fromMap(singleAccount))
          .toList();
    }
    return null;
  }
}
