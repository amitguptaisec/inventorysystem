import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/app_colors.dart';
import '../../utils/customsnackbar.dart';
import '../bloc/stockout_bloc.dart';

class StockoutAdd extends StatefulWidget {
  final int? inventoryid;
  final int? quantity;
  const StockoutAdd({
    super.key,
    required this.inventoryid,
    required this.quantity,
  });

  @override
  State<StockoutAdd> createState() => _StockoutAddState();
}

class _StockoutAddState extends State<StockoutAdd> {
  final _quantityCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StockoutBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text("Add Stockout")),
      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [
            TextField(
              controller: TextEditingController(
                text: widget.quantity.toString(),
              ),
              decoration: const InputDecoration(labelText: "Item Name"),
              enabled: false,
              // onChanged: (value) =>
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _quantityCtl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Quantity"),

              // onChanged: (value) =>
            ),

            const SizedBox(height: 12),

            // DropdownButtonFormField<int>(
            //   value: state.categoryId,
            //   decoration: const InputDecoration(labelText: "Category"),
            //   items: categories
            //       .map((cat) => DropdownMenuItem<int>(
            //             value: cat["id"],
            //             child: Text(cat["name"]),
            //           ))
            //       .toList(),
            //   onChanged: (value) {
            //     bloc.add(InventoryCategoryChanged(value!));
            //   },
            // ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (int.parse(_quantityCtl.text) <= (widget.quantity ?? 0)) {
                  bloc.add(
                    StockoutAddEvent(
                      inventoryId: widget.inventoryid,
                      quantity: int.parse(_quantityCtl.text),
                    ),
                  );
                } else {
                  showAppSnack(
                    context,
                    'Quantity exceeds',
                    color: AppColors.error,
                  );
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
