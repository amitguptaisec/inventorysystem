import 'package:flutter/material.dart';

class StockoutAdd extends StatefulWidget {
  const StockoutAdd({super.key});

  @override
  State<StockoutAdd> createState() => _StockoutAddState();
}

class _StockoutAddState extends State<StockoutAdd> {
  @override
  Widget build(BuildContext context) {
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

            ElevatedButton(onPressed: () {}, child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
