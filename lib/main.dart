
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
      title: 'Center',
      theme: ThemeData(
     scaffoldBackgroundColor: Colors.white,
      ),
      home: const CenterScreen(),
    );
  }
}

class CenterScreen extends StatelessWidget {
  const CenterScreen({super.key});

  static const Color primaryBlue = Color.fromARGB(255, 41, 91, 199);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 2, bottom: 16),
                child: Text(
                  'Center',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              
              Container(
                padding: const EdgeInsets.fromLTRB(17, 17, 17, 16),
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(19),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('images/profile.jpg'),
                            
                            ),
                        
                        
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Laith saleh',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'salesman',
                                style: TextStyle(
                                  color: Color(0xFFDCE7FF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 19,
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatItem(number: '846', label: 'Collect'),
                        StatItem(number: '51', label: 'Attention'),
                        StatItem(number: '267', label: 'Track'),
                        StatItem(number: '39', label: 'Coupons'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              // Quick actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  QuickAction(
                    icon: Icons.wallet,
                    label: 'Wallet',
                    onTap: () {},
                  ),
                  QuickAction(
                    icon: Icons.local_shipping_outlined,
                    label: 'Delivery',
                    badge: '3',
                    onTap: () {},
                  ),
                  QuickAction(
                    icon: Icons.chat,
                    label: 'Message',
                    badge: '2',
                    onTap: () {  },
                    
                  ),
                  QuickAction(
                    icon: Icons.star,
                    label: 'Service',
                    badge: '1',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Settings
              const SettingItem(
                icon: Icons.location_on,
                color: Color.fromARGB(255, 89, 74, 150),
                title: 'Adress',
                subtitle: 'Ensure your harvesting address',
              ),
              const SettingItem(
                icon: Icons.lock,
                color: Color.fromARGB(255, 114, 34, 82),
                title: 'Privacy',
                subtitle: 'System permission change',
              ),
              const SettingItem(
                icon: Icons.layers,
                color: Color.fromARGB(255, 173, 123, 24),
                title: 'General',
                subtitle: 'Basic functional settings',
              ),
              const SettingItem(
                icon: Icons.notifications,
                color: Color.fromARGB(255, 8, 161, 163),
                title: 'Notification',
                subtitle: 'Take over the news in time',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String number;
  final String label;

  const StatItem({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFDCE7FF),
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? badge;
  final VoidCallback onTap;

  const QuickAction({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        width: 68,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: const Color(0xFFF5F5F7),
                  child: Icon(
                    icon,
                    color: const Color(0xFF252525),
                    size: 21,
                  ),
                ),
                if (badge != null)
                  Positioned(
                    right: -4,
                    top: -3,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF3475FF),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        badge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const SettingItem({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4D77FF).withOpacity(0.17),
            blurRadius: 22,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFBFC0C6),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFFC5C7CD),
            size: 23,
          ),
        ],
      ),
    );
  }
}
