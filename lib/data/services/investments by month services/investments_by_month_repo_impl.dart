import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/get_Investments_ByMonthAndYear/investments.by.month.dart';

import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'investments_by_month_repo.dart';
import 'package:salvest_app/utility/enums.dart';

class InvestmentsByMonthRepoImpl implements InvestmentsByMonthRepo {
  final ApiService _apiService;
  InvestmentsByMonthRepoImpl(this._apiService);

  @override
  Future<InvestmentsByMonthResponse> fetchByMonth(int year, int month) async {
    final helper = await _apiService.post(
      endpoint: APIConfig.getInvestmentsByMonthAndYear,
      token: token,
      data: {'year': year, 'month': month},
    );
    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return InvestmentsByMonthResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load investments by month');
    }
  }
}
