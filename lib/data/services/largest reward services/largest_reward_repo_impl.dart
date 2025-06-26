import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/showLargestReward/show.largest.reward.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';

import 'largest_reward_repo.dart';

class LargestRewardRepoImpl implements LargestRewardRepo {
  final ApiService _apiService;
  LargestRewardRepoImpl(this._apiService);

  @override
  Future<LargestRewardResponse> fetchLargestReward() async {
    final helper = await _apiService.get(
      endpoint: APIConfig.shoLargestReward,
      token: token,
    );
    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return LargestRewardResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load largest reward');
    }
  }
}
