// lib/presentation/portfolio/widgets/investments_of_wallets.dart
import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_assests.dart';

class InvestmentsOfWallet extends StatelessWidget {
  final int totalOpportunities;
  final int totalAmount;

  const InvestmentsOfWallet({
    super.key,
    required this.totalOpportunities,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 200,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(AppAssets.walletBackg),
          fit: BoxFit.fill,
        ),
        color: const Color(0xFF9A8AEC),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color(0x7F9A8AEC)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Opportunities: $totalOpportunities',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total Amount: \$${totalAmount}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
