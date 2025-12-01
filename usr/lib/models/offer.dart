import 'package:flutter/material.dart';

class Offer {
  final String brandName;
  final String description;
  final String logoAsset;
  final String category;
  final bool isTrending;
  final bool isPopular;

  const Offer({
    required this.brandName,
    required this.description,
    required this.logoAsset,
    required this.category,
    this.isTrending = false,
    this.isPopular = false,
  });
}
