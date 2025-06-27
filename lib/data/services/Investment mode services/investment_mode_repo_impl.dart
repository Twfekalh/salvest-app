import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/investment/investment.mode.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';

import 'investment_mode_repo.dart';

class InvestmentModeRepoImpl implements InvestmentModeRepo {
  final ApiService _apiService;
  InvestmentModeRepoImpl(this._apiService);

  @override
  Future<InvestmentModeResponse> fetchInvestmentModes(String mode) async {
    final helper = await _apiService.post(
      endpoint: APIConfig.getPropertiesByInvestmentMode,
      token: token,
      data: {
        'investment_mode': mode, // هنا نستخدم قيمة mode الممررة
      },
    );

    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return InvestmentModeResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load investment modes');
    }
  }
}
