import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorysystem/inventory/repository/inventory_repository.dart';
import '../../theme/app_colors.dart';
import '../../utils/customsnackbar.dart';
import '../bloc/inventory_bloc.dart';
import 'add_inventory_page.dart';

class InventoryAddMaster extends StatefulWidget {
  const InventoryAddMaster({super.key});

  @override
  State<InventoryAddMaster> createState() => _InventoryAddMasterState();
}

class _InventoryAddMasterState extends State<InventoryAddMaster> {
  Widget dynamicContent = Container();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InventoryBloc>(
      create: (context) => InventoryBloc(inventoryRepo: InventoryRepoImpl()),
      child: BlocListener<InventoryBloc, InventoryState>(
        listener: (context, state) {
          if (state is InventoryAddSuccessstate) {
            if (state.inventoryAddResp.status == 200) {
              showAppSnack(
                context,
                state.inventoryAddResp.success.toString(),
                color: AppColors.success,
              );
              Navigator.pop(context);
            } else {
              showAppSnack(
                context,
                state.inventoryAddResp.error.toString(),
                color: AppColors.error,
              );
            }
          }
        },
        child: BlocBuilder<InventoryBloc, InventoryState>(
          builder: (context, state) {
            if (state is InventoryInitial) {}
            if (state is InventoryLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is InventoryListFailedState) {}
            return InventoryAdd();
          },
        ),
      ),
    );
  }
}
