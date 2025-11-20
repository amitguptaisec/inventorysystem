import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/app_colors.dart';
import '../../utils/customsnackbar.dart';
import '../bloc/stockout_bloc.dart';
import '../model/stockout_list_page_response_model.dart';
import '../repository/stockout_repository.dart';
import 'stockout_list.dart';

class StockoutListMaster extends StatefulWidget {
  const StockoutListMaster({super.key});

  @override
  State<StockoutListMaster> createState() => _StockoutListMasterState();
}

class _StockoutListMasterState extends State<StockoutListMaster> {
  Widget dynamicContent = Container();
  StockoutListRespModel stockoutListData = StockoutListRespModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StockoutBloc>(
      create: (context) => StockoutBloc(stockoutRepo: StockoutRepoImpl()),
      child: BlocListener<StockoutBloc, StockoutState>(
        listener: (context, state) {
          if (state is StockoutListSuccessstate) {
            if (state.stockoutListResp.status == 200) {
              stockoutListData = state.stockoutListResp;
            } else {
              showAppSnack(
                context,
                state.stockoutListResp.error.toString(),
                color: AppColors.error,
              );
            }
          }
        },
        child: BlocBuilder<StockoutBloc, StockoutState>(
          builder: (context, state) {
            if (state is StockoutInitial) {}
            if (state is StockoutLoadingState) {
              Center(child: CircularProgressIndicator());
            }
            if (state is StockoutListFailedState) {}
            return StockoutListScreen(stockoutListdata: stockoutListData);
          },
        ),
      ),
    );
  }
}
