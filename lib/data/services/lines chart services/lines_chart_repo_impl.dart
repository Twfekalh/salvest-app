import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/lines%20chart/lines.chart.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';
import 'lines_chart_repo.dart';

class LinesChartRepoImpl implements LinesChartRepo {
  final ApiService _apiService;
  LinesChartRepoImpl(this._apiService);

  @override
  Future<LinesChartResponse> fetchLinesChart({required int year}) async {
    final helper = await _apiService.post(
      endpoint: APIConfig.getProfitAndInvestmentPercentages,
      token: token,
      data: {'year': year},
    );
    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return LinesChartResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load lines chart data');
    }
  }
}
