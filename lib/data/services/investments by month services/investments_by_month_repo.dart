import 'package:salvest_app/data/models/get_Investments_ByMonthAndYear/investments.by.month.dart';

abstract class InvestmentsByMonthRepo {
  Future<InvestmentsByMonthResponse> fetchByMonth(int year, int month);
}
