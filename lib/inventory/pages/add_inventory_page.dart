import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/inventory_bloc.dart';

class InventoryAdd extends StatefulWidget {
  const InventoryAdd({super.key});

  @override
  State<InventoryAdd> createState() => _InventoryAddState();
}

class _InventoryAddState extends State<InventoryAdd> {
  final _itemNameCtl = TextEditingController();
  final _categoryidCtl = TextEditingController();
  final _quantityCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InventoryBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text("Add Inventory")),
      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [
            TextField(
              controller: _itemNameCtl,
              decoration: const InputDecoration(labelText: "Item Name"),
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
                bloc.add(
                  InventoryAddEvent(
                    categoryId: int.parse(_categoryidCtl.text),
                    quantity: int.parse(_quantityCtl.text),
                    inventoryName: _itemNameCtl.text,
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
