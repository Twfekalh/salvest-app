import 'package:salvest_app/data/models/lines%20chart/lines.chart.dart';

abstract class LinesChartRepo {
  Future<LinesChartResponse> fetchLinesChart({required int year});
}
