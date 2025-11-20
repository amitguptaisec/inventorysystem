import 'package:flutter/material.dart';

class StockoutListScreen extends StatelessWidget {
  StockoutListScreen({super.key});

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
                itemCount: 2,
                itemBuilder: (_, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text("id")),
                      title: Text("name"),
                      subtitle: Text("Qty: 100000"),
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
