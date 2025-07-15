import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/functions.dart';
import 'package:minimal_ecommerce_app/components/shop_tile_btn.dart';
import 'package:minimal_ecommerce_app/model/product_model.dart';

class MyProductTile extends StatelessWidget {
  final ProductModel productModel;
  const MyProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8), // Reduced and uniform margin
      padding: const EdgeInsets.all(12), // Reduced padding for compactness
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Ensure column takes only needed space
        children: [
          // Image
          AspectRatio(
            aspectRatio: 1, // Square image for consistency
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              ),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  productModel.imagePath,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8), // Reduced spacing
          // Name + Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                productModel.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Slightly smaller font for grid
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Rs.${productModel.price.toStringAsFixed(0)}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // Slightly smaller font
                ),
              ),
            ],
          ),
          const SizedBox(height: 4), // Reduced spacing

          // Description
          Text(
            productModel.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 12, // Smaller font for grid
            ),
            maxLines: 2, // Reduced to 2 lines for compactness
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8), // Reduced spacing

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShopTileBtn(
                icon: Icons.description,
                onTap: () => Navigator.pushNamed(
                  context,
                  '/detail_screen',
                  arguments: productModel,
                ),
              ),
              const SizedBox(width: 8),
              ShopTileBtn(
                icon: Icons.shopping_bag_outlined,
                onTap: () => Functions().addItemtoCart(context, productModel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}