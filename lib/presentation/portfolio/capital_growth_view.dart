import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/investment%20mode%20bloc/investment_mode_bloc.dart';
import 'package:salvest_app/business_logic/investment%20mode%20bloc/investment_mode_state.dart';
import 'package:salvest_app/presentation/portfolio/widgets/capital_growth_list_view_item.dart';
import 'package:salvest_app/presentation/portfolio/widgets/custom_row_info.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class CapitalGrowthView extends StatelessWidget {
  const CapitalGrowthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Capital Growth',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<InvestmentModeBloc, InvestmentModeState>(
        builder: (context, state) {
          if (state is InvestmentModeLoading ||
              state is InvestmentModeInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is InvestmentModeError) {
            return Center(child: Text(state.message));
          }
          if (state is InvestmentModeLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.modes.length,
              itemBuilder:
                  (ctx, i) => CapitalGrowthListViewItem(mode: state.modes[i]),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
