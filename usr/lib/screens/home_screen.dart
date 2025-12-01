import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/offer.dart';
import 'package:couldai_user_app/utils/mock_data.dart';
import 'package:couldai_user_app/widgets/category_button.dart';
import 'package:couldai_user_app/widgets/offer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';

  List<Offer> get _filteredOffers {
    if (_selectedCategory == 'All') {
      return mockOffers;
    }
    return mockOffers.where((offer) => offer.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final trendingOffers = _filteredOffers.where((o) => o.isTrending).toList();
    final popularOffers = _filteredOffers.where((o) => o.isPopular).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoNight'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildCategoryFilters(),
          const SizedBox(height: 24),
          if (trendingOffers.isNotEmpty) ...[
            _buildSectionTitle('🔥 Trending Offers'),
            const SizedBox(height: 16),
            _buildOffersGrid(trendingOffers),
            const SizedBox(height: 24),
          ],
          if (popularOffers.isNotEmpty) ...[
            _buildSectionTitle('⭐ Popular Promotions'),
            const SizedBox(height: 16),
            _buildOffersGrid(popularOffers),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Unlock Exclusive Crypto Bonuses',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Your gateway to the best referral and promotional offers in the crypto space and beyond. Start earning with CryptoNight!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters() {
    const categories = ['All', 'Crypto', 'Finance', 'Apps', 'E-commerce', 'Sports'];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryButton(
            label: category,
            isSelected: _selectedCategory == category,
            onPressed: () {
              setState(() {
                _selectedCategory = category;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20),
    );
  }

  Widget _buildOffersGrid(List<Offer> offers) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: offers.length,
      itemBuilder: (context, index) {
        return OfferCard(offer: offers[index]);
      },
    );
  }
}
