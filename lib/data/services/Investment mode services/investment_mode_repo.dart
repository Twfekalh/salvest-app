import 'package:salvest_app/data/models/investment/investment.mode.dart';

abstract class InvestmentModeRepo {
  Future<InvestmentModeResponse> fetchInvestmentModes(String mode);
}
