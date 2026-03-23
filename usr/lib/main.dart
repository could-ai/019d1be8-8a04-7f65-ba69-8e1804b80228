import 'package:flutter/material.dart';

void main() {
  runApp(const ServiceQualityApp());
}

class ServiceQualityApp extends StatelessWidget {
  const ServiceQualityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kualitas Layanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      // CRITICAL: Routing safety for web previews and standalone bootstrapping
      initialRoute: '/',
      routes: {
        '/': (context) => const ServqualScreen(),
      },
    );
  }
}

class ServqualDimension {
  final String title;
  final String englishTitle;
  final String description;
  final IconData icon;
  final Color color;

  ServqualDimension({
    required this.title,
    required this.englishTitle,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class ServqualScreen extends StatelessWidget {
  const ServqualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 5 Dimensi Kualitas Layanan (SERVQUAL)
    final List<ServqualDimension> dimensions = [
      ServqualDimension(
        title: 'Bukti Fisik',
        englishTitle: 'Tangibles',
        description: 'Penampilan fasilitas fisik, peralatan, personel, dan materi komunikasi. Pelanggan akan melihat seberapa baik, bersih, dan menariknya fasilitas yang diberikan oleh penyedia layanan.',
        icon: Icons.storefront_outlined,
        color: Colors.blue,
      ),
      ServqualDimension(
        title: 'Keandalan',
        englishTitle: 'Reliability',
        description: 'Kemampuan untuk memberikan layanan yang dijanjikan dengan akurat dan terpercaya. Layanan harus konsisten, tepat waktu, dan sesuai dengan harapan pelanggan tanpa adanya kesalahan.',
        icon: Icons.verified_outlined,
        color: Colors.green,
      ),
      ServqualDimension(
        title: 'Daya Tanggap',
        englishTitle: 'Responsiveness',
        description: 'Kesediaan untuk membantu pelanggan dan memberikan layanan yang cepat dan tanggap. Termasuk kecepatan dalam menangani keluhan, menjawab pertanyaan, dan memberikan solusi.',
        icon: Icons.support_agent_outlined,
        color: Colors.orange,
      ),
      ServqualDimension(
        title: 'Jaminan',
        englishTitle: 'Assurance',
        description: 'Pengetahuan, kesopanan karyawan, serta kemampuan mereka untuk menumbuhkan rasa percaya dan keyakinan pada pelanggan. Ini mencakup kompetensi, kredibilitas, dan keamanan.',
        icon: Icons.shield_outlined,
        color: Colors.purple,
      ),
      ServqualDimension(
        title: 'Empati',
        englishTitle: 'Empathy',
        description: 'Perhatian yang tulus dan individual yang diberikan perusahaan kepada pelanggannya. Memahami kebutuhan spesifik setiap pelanggan, kemudahan komunikasi, dan kepedulian personal.',
        icon: Icons.favorite_outline,
        color: Colors.red,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Dimensi Kualitas Layanan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Model SERVQUAL',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Terdapat 5 dimensi utama kualitas layanan yang secara langsung mempengaruhi tingkat kepuasan pelanggan (berdasarkan teori Parasuraman, Zeithaml, dan Berry):',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final dim = dimensions[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: index == 0, // Expand the first one by default
                        tilePadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: dim.color.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            dim.icon,
                            color: dim.color,
                            size: 28,
                          ),
                        ),
                        title: Text(
                          dim.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          dim.englishTitle,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              bottom: 20.0,
                            ),
                            child: Text(
                              dim.description,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1.5,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: dimensions.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }
}
