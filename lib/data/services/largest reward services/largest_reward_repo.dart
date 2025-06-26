import 'package:salvest_app/data/models/showLargestReward/show.largest.reward.dart';

abstract class LargestRewardRepo {
  Future<LargestRewardResponse> fetchLargestReward();
}
