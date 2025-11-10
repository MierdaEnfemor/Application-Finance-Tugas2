import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Latar belakang gelap elegan
      appBar: AppBar(
        title: const Text('Finance Mate'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E293B), // Abu-ungu gelap
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Title =====
            const Text(
              'My Cards',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFCBD5E1), // Abu lembut
              ),
            ),
            const SizedBox(height: 12),

            // ===== Banner Cards =====
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank HS',
                    cardNumber: '**** **** 2345',
                    balance: 'Rp12.500.000',
                    color1: Color(0xFF2C003E), // Ungu tua (gradasi awal)
                    color2: Color(0xFF7A1FA2), // Ungu muda (gradasi akhir)
                  ),
                  AtmCard(
                    bankName: 'Bank HSA',
                    cardNumber: '**** **** 8765',
                    balance: 'Rp5.350.000',
                    color1: Color(0xFF3E0C64), // Ungu pekat ke pink lembut
                    color2: Color(0xFF5B1F91),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Grid Menu =====
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GridMenuItem(icon: Icons.health_and_safety, label: 'Health'),
                GridMenuItem(icon: Icons.travel_explore, label: 'Travel'),
                GridMenuItem(icon: Icons.fastfood, label: 'Food'),
                GridMenuItem(icon: Icons.event, label: 'Event'),
              ],
            ),

            const SizedBox(height: 24),

            // ===== Transaction List =====
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFCBD5E1),
              ),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Grid Menu Item Widget ----
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: const Color(0xFF334155).withOpacity(0.5),
          child: Icon(
            icon,
            color: const Color(0xFF7C3AED), // Ungu lembut elegan
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFFE2E8F0)),
        ),
      ],
    );
  }
}
