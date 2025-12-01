import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/offer.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to offer details page
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                offer.logoAsset,
                height: 60,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.business, size: 60); // Placeholder icon
                },
              ),
              const SizedBox(height: 12),
              Text(
                offer.brandName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                offer.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
