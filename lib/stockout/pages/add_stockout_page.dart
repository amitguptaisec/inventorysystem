import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stockout_bloc.dart';

class StockoutAdd extends StatefulWidget {
  const StockoutAdd({super.key});

  @override
  State<StockoutAdd> createState() => _StockoutAddState();
}

class _StockoutAddState extends State<StockoutAdd> {
  final _inventoryidctl = TextEditingController();
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
              // controller: _nameCtl,
              decoration: const InputDecoration(labelText: "Item Name"),

              // onChanged: (value) =>
            ),

            const SizedBox(height: 12),

            TextField(
              // controller: _qtyCtl,
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
                bloc.add(
                  StockoutAddEvent(
                    inventoryId: int.parse(_inventoryidctl.text),
                    quantity: int.parse(_quantityCtl.text),
                  ),
                );
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
