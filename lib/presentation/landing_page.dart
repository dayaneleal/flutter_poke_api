import 'package:flutter/material.dart';
import 'package:flutter_poke_api/presentation/pokedex_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _selectedTab = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => _selectedTab.value = index,
        children: [
          const PokedexPage(), 
          Container(color: Colors.amber), 
          Container(color: Colors.blue)],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedTab,
        builder: (_, int valor, __) {
          return BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.catching_pokemon), label: 'Pokédex'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline_outlined),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined), label: 'Profile')
              ],
              currentIndex: _selectedTab.value,
              onTap: (value) {
                _selectedTab.value = value;
                _pageController.jumpToPage(value);
              });
        },
      ),
    );
  }
}
