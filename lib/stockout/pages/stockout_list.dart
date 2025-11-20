import 'package:flutter/material.dart';

import '../model/stockout_list_page_response_model.dart';

class StockoutListScreen extends StatelessWidget {
  final StockoutListRespModel? stockoutListdata;
  StockoutListScreen({super.key, this.stockoutListdata});

  final TextEditingController _searchCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stockout List"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchCtl,
              decoration: InputDecoration(
                hintText: "Search inventory...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {},
            ),

            const SizedBox(height: 12),

            // Inventory List
            Expanded(
              child: ListView.builder(
                itemCount: stockoutListdata?.success?.stockoutList?.length ?? 0,
                itemBuilder: (_, index) {
                  final itemlist = stockoutListdata?.success?.stockoutList;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${itemlist?[index].stockoutId}"),
                      ),
                      title: Text(
                        "${itemlist?[index].categoryName}: "
                        "${itemlist?[index].inventoryName}",
                      ),
                      subtitle: Text("Quantity: ${itemlist?[index].quantity}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
