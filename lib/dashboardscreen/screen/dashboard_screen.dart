import 'package:flutter/material.dart';
import 'package:inventorysystem/widgets/custom_card_text_icon_center.dart';
import '../../inventory/pages/inventory_add_master.dart';
import '../../inventory/pages/inventory_list_master.dart';
import '../../stockout/pages/stockout_add_master.dart';
import '../../stockout/pages/stockout_list_master.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/custom_scaffold_widget.dart';
import '../../widgets/custom_text_widget.dart';

class SimpleDashboardScreen extends StatelessWidget {
  const SimpleDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Dashboard",
      textStyle: AppTextStyles.headline1,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Quick Actions", textsyle: AppTextStyles.bold22),
            const SizedBox(height: 16),

            // First Row
            Row(
              children: [
                _dashboardCard(
                  title: "Add Inventory",
                  icon: Icons.add_box,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => InventoryAddMaster()),
                    );
                  },
                ),
                const SizedBox(width: 16),
                _dashboardCard(
                  title: "Add Stockout",
                  icon: Icons.remove_circle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => StockoutAddMaster()),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Second Row
            Row(
              children: [
                _dashboardCard(
                  title: "List Inventory",
                  icon: Icons.inventory,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => InventoryListMaster()),
                    );
                  },
                ),
                const SizedBox(width: 16),
                _dashboardCard(
                  title: "List Stockout",
                  icon: Icons.list_alt,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => StockoutListMaster()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Dashboard card widget
  Widget _dashboardCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return CustomCardTextIconCenter(title: title, icon: icon, onTap: onTap);
  }
}
