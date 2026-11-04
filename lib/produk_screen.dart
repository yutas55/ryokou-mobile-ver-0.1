import 'package:flutter/material.dart';

class ProdukScreen extends StatefulWidget {
  const ProdukScreen({super.key});

  @override
  State<ProdukScreen> createState() => _ProdukScreenState();
}

class _ProdukScreenState extends State<ProdukScreen> {
  String _searchText = '';

  final List<Map<String, String>> _motorList = [
    {
      'name': 'Honda Vario 125',
      'specs': '125cc • Tahun 2023',
      'price': 'Rp 85.000/hari',
      'image':
          'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?w=500',
    },
    {
      'name': 'Honda Beat Street',
      'specs': '110cc • Tahun 2023',
      'price': 'Rp 70.000/hari',
      'image':
          'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?w=500',
    },
    {
      'name': 'Honda Scoopy',
      'specs': '110cc • Tahun 2024',
      'price': 'Rp 80.000/hari',
      'image':
          'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?w=500',
    },
    {
      'name': 'Yamaha NMAX 155',
      'specs': '155cc • ABS 2023',
      'price': 'Rp 120.000/hari',
      'image':
          'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?w=500',
    },
    {
      'name': 'Yamaha Aerox 155',
      'specs': '155cc • Tahun 2024',
      'price': 'Rp 110.000/hari',
      'image':
          'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?w=500',
    },
    {
      'name': 'Yamaha Fazzio',
      'specs': '125cc • Tahun 2024',
      'price': 'Rp 90.000/hari',
      'image':
          'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final motorFiltered = _motorList.where((motor) {
      return motor['name']!.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Cari merk atau tipe motor...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child: motorFiltered.isEmpty
              ? const Center(child: Text('Motor tidak ditemukan'))
              : GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: motorFiltered.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) {
                    final motor = motorFiltered[index];

                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              motor['image']!,
                              height: 105,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 105,
                                  color: Colors.grey.shade200,
                                  child: const Center(
                                    child: Icon(Icons.two_wheeler, size: 40),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            motor['name']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            motor['specs']!,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            motor['price']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 14,
                                color: Color(0xFF2E7D32),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Tersedia',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF2E7D32),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
