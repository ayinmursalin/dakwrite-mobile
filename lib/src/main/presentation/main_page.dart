import 'package:dakwrite/src/auth/presentation/login/auth_login_page.dart';
import 'package:dakwrite/src/common/presentation/dialogs/common_dialogs.dart';
import 'package:dakwrite/src/main/presentation/home/main_home_page.dart';
import 'package:dakwrite/src/main/presentation/main_controller.dart';
import 'package:dakwrite/src/main/presentation/profile/main_profile_page.dart';
import 'package:dakwrite/src/main/presentation/search/main_search_page.dart';
import 'package:dakwrite/theme/common_colors.dart';
import 'package:dakwrite/theme/common_icons.dart';
import 'package:dakwrite/theme/common_typography.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MainPage extends StatefulWidget {
  static const route = '/main';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = const [
    MainHomePage(),
    MainSearchPage(),
    MainProfilePage(),
  ];

  late MainController _controller;

  var _currentPage = 0;
  var _canPop = false;

  @override
  void initState() {
    super.initState();

    _controller = MainController(
      authGetUserUseCase: GetIt.instance(),
    )..getUser();
  }

  void _onBackPressed(bool didPop) {
    if (_currentPage != 0) {
      setState(() {
        _currentPage = 0;
      });
      return;
    }

    CommonDialogs.showToastMessage('Tekan sekali lagi untuk keluar');
    setState(() {
      _canPop = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _canPop = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop && _currentPage == 0,
      onPopInvoked: _onBackPressed,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: _onPageSelected,
          unselectedLabelStyle: CommonTypography.textTitleSmall,
          selectedLabelStyle: CommonTypography.textTitleSmall,
          unselectedItemColor: CommonColors.black,
          selectedItemColor: CommonColors.deepCerulean,
          items: [
            BottomNavigationBarItem(
              icon: CommonIcons.getIcon(
                'ic_dashboard.svg',
                height: 24,
                color: _currentPage == 0 ? CommonColors.deepCerulean : null,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: CommonIcons.getIcon(
                'ic_search.svg',
                height: 24,
                color: _currentPage == 1 ? CommonColors.deepCerulean : null,
              ),
              label: 'Pencarian',
            ),
            BottomNavigationBarItem(
              icon: CommonIcons.getIcon(
                'ic_profile.svg',
                height: 24,
                color: _currentPage == 2 ? CommonColors.deepCerulean : null,
              ),
              label: 'Akun',
            ),
          ],
        ),
        body: _pages[_currentPage],
      ),
    );
  }

  void _onPageSelected(int index) {
    if (_controller.currentUser.value == null && index != 0) {
      Navigator.of(context).pushNamed(AuthLoginPage.route).then((_) {
        _controller.getUser();
      });

      return;
    }

    setState(() {
      _currentPage = index;
    });
  }
}
