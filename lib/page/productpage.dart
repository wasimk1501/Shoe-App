import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_shop/page/product_details.dart';

import '../model/product_model.dart';

class BuildProductPage extends StatelessWidget {
  const BuildProductPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        final products = productItems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (__) {
                      return ProductDetails(products: products);
                    }));
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Icon(
                              Icons.favorite,
                              color: color,
                            ),
                          ),
                        ),
                        Image.asset(
                          products.imgUlr,
                          cacheHeight: 120,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                products.title,
                style: GoogleFonts.adamina(
                    fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                "\$ ${products.price}",
                style: GoogleFonts.adamina(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }),
    );
  }
}
