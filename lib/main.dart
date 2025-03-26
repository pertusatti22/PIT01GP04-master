import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pit01gp04/src/features/account/service/account_service.dart';
import 'package:pit01gp04/src/features/expense/service/expense_service.dart';
import 'package:pit01gp04/src/features/home/service/home_service.dart';

import 'src/features/dream/service/dream_service.dart';
import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp(
    dreamService: DreamService(),
    accountService: AccountService(),
    expenseService: ExpenseService(),
    homeService: HomeService(),
  ));
}
