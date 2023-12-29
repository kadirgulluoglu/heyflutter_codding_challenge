import 'package:flutter/material.dart';
import 'package:heyflutter_codding_challenge/core/extensions/context_extension.dart';
import 'package:heyflutter_codding_challenge/features/home/helper/bottom_bar_item.dart';
import 'package:heyflutter_codding_challenge/product/enums/assets_enum.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.pagePadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsEnum.logo.toPng),
                  const Icon(Icons.notifications_none_outlined),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: context.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: context.containerRadius,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar,
    );
  }

  BottomNavigationBar get buildBottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: BottomBarItem.item,
    );
  }
}
