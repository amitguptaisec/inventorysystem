import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorysystem/inventory/repository/inventory_repository.dart';

import '../../theme/app_colors.dart';
import '../../utils/customsnackbar.dart';
import '../bloc/inventory_bloc.dart';
import '../model/inventory_list_page_response_model.dart';
import 'inventory_list.dart';

class InventoryListMaster extends StatefulWidget {
  const InventoryListMaster({super.key});

  @override
  State<InventoryListMaster> createState() => _InventoryListMasterState();
}

class _InventoryListMasterState extends State<InventoryListMaster> {
  Widget dynamicContent = Container();
  InventoryListRespModel inventoryListData = InventoryListRespModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InventoryBloc>(
      create: (context) => InventoryBloc(inventoryRepo: InventoryRepoImpl()),
      child: BlocListener<InventoryBloc, InventoryState>(
        listener: (context, state) {
          if (state is InventoryListSuccessstate) {
            if (state.inventoryListResp.status == 200) {
              inventoryListData = state.inventoryListResp;
            } else {
              showAppSnack(
                context,
                state.inventoryListResp.error.toString(),
                color: AppColors.error,
              );
            }
          }
        },
        child: BlocBuilder<InventoryBloc, InventoryState>(
          builder: (context, state) {
            if (state is InventoryInitial) {}
            if (state is InventoryLoadingState) {
              Center(child: CircularProgressIndicator());
            }
            if (state is InventoryListFailedState) {}
            return InventoryListScreen(inventoryListdata: inventoryListData);
          },
        ),
      ),
    );
  }
}
