import 'package:flutter/material.dart';
import 'package:product_nelson/services/api_service.dart';
import 'package:product_nelson/model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  List<Product> products = [];

  @override
  void initState(){
    super.initState();
    apiService.getallProducts().then((fetchedProducts) {
      setState(() {
        products = fetchedProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Nelson'),
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product.image,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.category.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.shortTitle(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: product.isExpensive() ? FontWeight.bold : FontWeight.normal,
                                  color: product.isExpensive() ? Colors.red : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    product.rating,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
//no 4:
// 1. Alur data: ApiService mengambil data produk dari url api menggunakan getallProducts kemudian data dibaca dan diubah menjadi list product setelah data diterima setState menyimpan ke list product lalu ListView menampilkan data tersebut
// 2. Supaya filter bisa dihidup dan dimatikan tanpa kehilangan data