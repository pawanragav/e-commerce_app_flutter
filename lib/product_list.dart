import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:shop_app/global_variables.dart";
import "package:shop_app/products_card.dart";
import "package:shop_app/products_card_details.dart";

class ProducList extends StatefulWidget {
  const ProducList({super.key});

  @override
  State<ProducList> createState() => _ProducListState();
}

class _ProducListState extends State<ProducList> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];

  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 179, 176, 176),
      ),
      borderRadius: BorderRadius.circular(50),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Shoe\nCollection',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  )),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : Color.fromARGB(255, 233, 226, 226),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 233, 226, 226)),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductsDetailsPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
