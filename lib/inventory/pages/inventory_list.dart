import 'package:flutter/material.dart';

import '../model/inventory_list_page_response_model.dart';

class InventoryListScreen extends StatelessWidget {
  final InventoryListRespModel? inventoryListdata;
  InventoryListScreen({super.key, this.inventoryListdata});

  final TextEditingController _searchCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inventory List"), centerTitle: true),
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
                itemCount:
                    inventoryListdata?.success?.inventoryList?.length ?? 0,
                itemBuilder: (_, index) {
                  final itemlist = inventoryListdata?.success?.inventoryList;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${itemlist?[index].inventoryId}"),
                      ),
                      title: Text("${itemlist?[index].inventoryName}"),
                      subtitle: Text("${itemlist?[index].quantity}"),
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
