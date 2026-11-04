
import 'package:flutter/material.dart';

void main() {
  runApp(const AlKumailApp());
}

const Color emerald = Color(0xFF123D35);
const Color gold = Color(0xFFC6A45C);
const Color ivory = Color(0xFFF8F4E9);

class AlKumailApp extends StatelessWidget {
  const AlKumailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الكُميل',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: ivory,
        colorScheme: ColorScheme.fromSeed(seedColor: emerald),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> sections = const [
    {'title': 'الأدعية', 'icon': Icons.menu_book_rounded},
    {'title': 'الزيارات', 'icon': Icons.mosque_rounded},
    {'title': 'صلاة الليل وفضلها', 'icon': Icons.nightlight_round},
    {'title': 'المسبحة الإلكترونية', 'icon': Icons.radio_button_checked},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: emerald,
        foregroundColor: gold,
        centerTitle: true,
        title: const Text(
          'الكُميل',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            height: 205,
            decoration: BoxDecoration(
              color: emerald,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: gold, width: 1.5),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mosque, color: gold, size: 65),
                  SizedBox(height: 12),
                  Text(
                    'الكُميل',
                    style: TextStyle(
                      color: gold,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'رفيقك في الدعاء والزيارة والعبادة',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'أقسام التطبيق',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: emerald,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sections.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) {
              final item = sections[index];
              return InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SectionPage(
                        title: item['title'],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: gold.withOpacity(0.7)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon'], color: emerald, size: 42),
                      const SizedBox(height: 12),
                      Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: emerald,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFECE5D5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              children: [
                Text(
                  '﴿ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ ﴾',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: emerald,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'سورة الرعد - الآية 28',
                  style: TextStyle(color: emerald),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionPage extends StatelessWidget {
  final String title;

  const SectionPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: emerald,
        foregroundColor: gold,
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'قسم $title\nسيتم إضافة محتواه بالتفصيل',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: emerald,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
