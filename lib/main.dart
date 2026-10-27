
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CenterScreen(),
    );
  }
}

class CenterScreen extends StatelessWidget {
  const CenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FF),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Title
            const Text(
              'Center',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            // Blue profile card
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 41, 100, 209),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 1, 20, 36).withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        backgroundImage: const AssetImage('images/profile.jpg'),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Laith Saleh',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'A software engineer.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileStat('846', 'Collect'),
                      ProfileStat('51', 'Attention'),
                      ProfileStat('267', 'Track'),
                      ProfileStat('39', 'Coupons'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Quick actions
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                QuickAction(Icons.wallet_outlined,
                    'Wallet'),
                QuickAction(Icons.local_shipping_outlined,
                    'Delivery'),
                QuickAction(Icons.message_outlined, 'Message' ),
                QuickAction(Icons.build_outlined,
                    'Service'),
              ],
            ),

            const SizedBox(height: 30),

            // Settings cards
            const SettingsTile(
              icon: Icons.location_on,
              title: 'Address',
              subtitle: 'Ensure your harvesting address',
              color: Color.fromARGB(255, 76, 51, 145),
            ),

            const SizedBox(height: 12),

            const SettingsTile(
              icon: Icons.lock,
              title: 'Privacy',
              subtitle: 'System permission change',
              color: Color.fromARGB(255, 112, 31, 80),
            ),

            const SizedBox(height: 12),

            const SettingsTile(
              icon: Icons.layers,
              title: 'General',
              subtitle: 'Basic functional settings',
              color: Color.fromARGB(255, 88, 66, 25),
            ),

            const SizedBox(height: 12),

            const SettingsTile(
              icon: Icons.notifications,
              title: 'Notification',
              subtitle: 'Take over the news in time',
              color: Color.fromARGB(255, 26, 103, 107),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile statistics
class ProfileStat extends StatelessWidget {
  final String number;
  final String title;

  const ProfileStat(this.number, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

// Quick action widget
class QuickAction extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickAction(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Color(0xFFF0F1F5),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 22),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

// Settings list item
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
              size: 21,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
