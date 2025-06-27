import 'package:flutter/material.dart';
import 'package:salvest_app/data/models/investment/datum.mode.dart';
import 'package:salvest_app/presentation/portfolio/widgets/custom_row_info.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class CapitalGrowthListViewItem extends StatelessWidget {
  final InvestmentMode mode;
  const CapitalGrowthListViewItem({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346,
      height: 170,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: const Color(0xFF9A8AEC),
          ),
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      child: Column(
        children: [
          CustomRowInfo(
            title: 'Property:',
            availability: mode.propertyName ?? '',
            titleColor: Colors.black,
            availabilityColor: AppColors.darkGreen,
            titleFontSize: 12,
            availabilityFontSize: 12,
            titleFontWeight: FontWeight.w700,
            availabilityFontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 4),
          CustomRowInfo(
            title: 'Location:',
            availability: mode.propertyLocation ?? '',
            titleColor: Colors.black,
            availabilityColor: Colors.black54,
            titleFontSize: 12,
            availabilityFontSize: 12,
            titleFontWeight: FontWeight.w700,
            availabilityFontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 4),
          CustomRowInfo(
            title: 'Profit %:',
            availability:
                mode.profitPercent != null ? '${mode.profitPercent}%' : '',
            titleColor: Colors.black,
            availabilityColor: AppColors.brightGreen,
            titleFontSize: 12,
            availabilityFontSize: 12,
            titleFontWeight: FontWeight.w700,
            availabilityFontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 4),
          CustomRowInfo(
            title: 'Start:',
            availability: mode.investmentStartTime ?? '',
            titleColor: Colors.black,
            availabilityColor: AppColors.darkGreen,
            titleFontSize: 12,
            availabilityFontSize: 12,
            titleFontWeight: FontWeight.w700,
            availabilityFontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 4),
          CustomRowInfo(
            title: 'End:',
            availability: mode.investmentEndTime ?? '',
            titleColor: Colors.black,
            availabilityColor: Colors.black54,
            titleFontSize: 12,
            availabilityFontSize: 12,
            titleFontWeight: FontWeight.w700,
            availabilityFontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 4),
          CustomRowInfo(
            title: 'Investors:',
            availability: mode.investorCount?.toString() ?? '0',
            titleColor: Colors.black,
            availabilityColor: AppColors.darkGreen,
            titleFontSize: 12,
            availabilityFontSize: 12,
            titleFontWeight: FontWeight.w700,
            availabilityFontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 4),
          CustomRowInfo(
            title: 'Your Profit:',
            availability: '\$${mode.userProfit}',
            titleColor: Colors.black,
            availabilityColor: AppColors.brightGreen,
            titleFontSize: 12,
            availabilityFontSize: 12,
            titleFontWeight: FontWeight.w700,
            availabilityFontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 4),
          // CustomRowInfo(
          //   title: 'Completed:',
          //   availability: completedText,
          //   titleColor: Colors.black,
          //   availabilityColor: completedText == 'Yes' ? AppColors.darkGreen : Colors.red,
          //   titleFontSize: 12,
          //   availabilityFontSize: 12,
          //   titleFontWeight: FontWeight.w700,
          //   availabilityFontWeight: FontWeight.w400,
          // ),
        ],
      ),
    );
  }
}
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(left: 18.0, top: 8.0),
  //           child: Row(
  //             children: [
  //               Image(image: AssetImage(AppAssets.bedRoomImage)),
  //               SizedBox(width: 8),
  //               Container(width: 2, height: 9, color: AppColors.black82),
  //               SizedBox(width: 8),
  //               Image(image: AssetImage(AppAssets.syriaFlag)),
  //               Text(
  //                 'Lattakia',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 12,
  //                   fontFamily: 'Inter',
  //                   fontWeight: FontWeight.w400,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Column(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  //               child: CustomRowInfo(
  //                 availability: '46% available',
  //                 availabilityColor: const Color(0xB5088610),
  //                 availabilityFontSize: 10,
  //                 availabilityFontWeight: FontWeight.w700,
  //                 title: 'Super Deluxe Villa ',
  //                 titleColor: Colors.black,
  //                 titleFontSize: 12,
  //                 titleFontWeight: FontWeight.w900,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: CustomRowInfo(
  //                 title: '\$200,340 ',
  //                 titleColor: const Color(0xFF21D836),
  //                 titleFontSize: 10,
  //                 titleFontWeight: FontWeight.w700,
  //                 availability: '1500 investors',
  //                 availabilityColor: Colors.black.withValues(alpha: 117),
  //                 availabilityFontSize: 10,
  //                 availabilityFontWeight: FontWeight.w700,
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 8),
  //         Container(
  //           width: 323,
  //           height: 72,
  //           decoration: ShapeDecoration(
  //             color: const Color(0xFFD9D9D9),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               spacing: 2,
  //               children: [
  //                 CustomRowInfo(
  //                   title: 'yearly investment  ',
  //                   titleColor: Colors.black,
  //                   titleFontSize: 10,
  //                   titleFontWeight: FontWeight.w400,
  //                   availability: '12.4%',
  //                   availabilityColor: Colors.black,
  //                   availabilityFontSize: 10,
  //                   availabilityFontWeight: FontWeight.w400,
  //                 ),
  //                 CustomRowInfo(
  //                   title: 'dead line investment  ',
  //                   titleColor: Colors.black,
  //                   titleFontSize: 10,
  //                   titleFontWeight: FontWeight.w400,
  //                   availability: '2April 2025',
  //                   availabilityColor: Colors.black,
  //                   availabilityFontSize: 10,
  //                   availabilityFontWeight: FontWeight.w400,
  //                 ),
  //                 CustomRowInfo(
  //                   title: 'current valuation  ',
  //                   titleColor: Colors.black,
  //                   titleFontSize: 10,
  //                   titleFontWeight: FontWeight.w400,
  //                   availability: '\$200,340',
  //                   availabilityColor: Colors.black,
  //                   availabilityFontSize: 10,
  //                   availabilityFontWeight: FontWeight.w400,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
// }
