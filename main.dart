import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter Material Design untuk membangun UI

void main() {
  runApp(const MyApp()); // Fungsi utama untuk menjalankan aplikasi Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Konstruktor widget MyApp dengan key opsional

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elegant Grey UI', // Judul aplikasi
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug di pojok kanan atas
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey), // Skema warna berdasarkan warna abu-abu
        useMaterial3: true, // Mengaktifkan fitur Material 3
        fontFamily: 'Roboto', // Font default aplikasi
      ),
      home: const MyHomePage(title: '🦦 Flutter Expert List'), // Widget halaman utama
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title; // Judul halaman

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final List<Map<String, String>> people = const [
    {"name": "ANNABIYA", "field": "Data Science"},
    {"name": "IBRAHIM", "field": "Mobile Development"},
    {"name": "MEILINDA", "field": "UI/UX Design"},
    {"name": "ALDINO", "field": "Software Engineering"},
    {"name": "BRAM", "field": "Cloud Infrastructure"},
    {"name": "FREDY", "field": "Cyber Security"},
    {"name": "ALISA", "field": "AI & Machine Learning"},
    {"name": "BIYA", "field": "Web Development"},
    {"name": "LEVINE", "field": "Digital Art & Motion"},
    {"name": "NIKI", "field": "Game Development"},
  ]; // List data orang berisi nama dan bidang keahlian

  List<Color> get avatarColors => [
    Colors.grey.shade700,
    Colors.grey.shade600,
    Colors.grey.shade500,
    Colors.grey.shade400,
    Colors.grey.shade800,
    Colors.grey.shade300,
    Colors.grey.shade600,
    Colors.grey.shade700,
    Colors.grey.shade500,
    Colors.grey.shade400,
  ]; // List warna untuk avatar, agar bervariasi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Warna latar belakang scaffold
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16), // Padding dalam container
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade900, Colors.grey.shade700], // Gradasi abu-abu untuk header
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30), // Membulatkan bagian bawah container
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26, // Bayangan
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            width: double.infinity, // Lebar penuh
            child: Column(
              children: [
                Text(
                  title, // Menampilkan judul halaman
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Temukan para ahli berbakat dalam dunia teknologi ✨',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ), // Subjudul
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: people.length, // Jumlah item dalam list
              itemBuilder: (context, index) {
                final person = people[index]; // Data orang ke-index
                final name = person["name"]!; // Nama orang
                final field = person["field"]!; // Bidang keahlian
                final initials =
                    name.length >= 2
                        ? name.substring(0, 2).toUpperCase() // Inisial dari nama (2 huruf pertama)
                        : name.substring(0, 1).toUpperCase();

                return TweenAnimationBuilder(
                  duration: Duration(milliseconds: 500 + (index * 100)), // Durasi animasi dengan delay berbeda tiap item
                  tween: Tween<double>(begin: 0, end: 1), // Tween dari opacity 0 ke 1
                  builder:
                      (context, value, child) => Opacity(
                        opacity: value, // Opacity berdasarkan tween
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * 20), // Efek muncul dari bawah
                          child: child,
                        ),
                      ),
                  child: Card(
                    elevation: 4, // Tinggi bayangan kartu
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.grey.shade200, // Warna latar belakang kartu
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (_) => AlertDialog(
                                backgroundColor: Colors.grey.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      person['name']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Divider(thickness: 1),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.work_outline,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(child: Text(person['field']!)),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton.icon(
                                    onPressed: () => Navigator.pop(context),
                                    icon: const Icon(Icons.close),
                                    label: const Text('Tutup'),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.grey.shade800,
                                    ),
                                  ),
                                ],
                              ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor:
                            avatarColors[index % avatarColors.length], // Warna avatar berdasarkan index
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            initials, // Menampilkan inisial orang
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            size: 18,
                            color: Colors.black87,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.school,
                            size: 16,
                            color: Colors.black45,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            field,
                            style: const TextStyle(
                              fontSize: 13.5,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Colors.grey,
                      ), // Ikon panah ke kanan
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}