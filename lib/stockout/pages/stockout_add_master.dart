import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/app_colors.dart';
import '../../utils/customsnackbar.dart';
import '../bloc/stockout_bloc.dart';
import '../repository/stockout_repository.dart';
import 'add_stockout_page.dart';

class StockoutAddMaster extends StatefulWidget {
  const StockoutAddMaster({super.key});

  @override
  State<StockoutAddMaster> createState() => _StockoutAddMasterState();
}

class _StockoutAddMasterState extends State<StockoutAddMaster> {
  Widget dynamicContent = Container();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StockoutBloc>(
      create: (context) => StockoutBloc(stockoutRepo: StockoutRepoImpl()),
      child: BlocListener<StockoutBloc, StockoutState>(
        listener: (context, state) {
          if (state is StockoutAddSuccessstate) {
            if (state.stockoutAddResp.status == 200) {
              showAppSnack(
                context,
                state.stockoutAddResp.error.toString(),
                color: AppColors.success,
              );
              Navigator.pop(context);
            } else {
              showAppSnack(
                context,
                state.stockoutAddResp.error.toString(),
                color: AppColors.error,
              );
            }
          }
        },
        child: BlocBuilder<StockoutBloc, StockoutState>(
          builder: (context, state) {
            if (state is StockoutInitial) {}
            if (state is StockoutLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is StockoutListFailedState) {}
            return StockoutAdd();
          },
        ),
      ),
    );
  }
}
