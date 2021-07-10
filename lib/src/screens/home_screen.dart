import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:splitbill_client/src/screens/debts/debts_screen.dart';
import 'package:splitbill_client/src/screens/events/events_screen.dart';

class HomeScreen extends HookWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = useState(0);

    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(currentPageIndex),
      body: _buildPageFromIndex(currentPageIndex.value),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(currentPageIndex) {
    return BottomNavigationBar(
      // Sets color for label *and* icon
      selectedItemColor: Colors.blue,

      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,

      currentIndex: currentPageIndex.value,
      onTap: (int index) => currentPageIndex.value = index,

      items: const [
        BottomNavigationBarItem(
          label: "Events",
          icon: Icon(Icons.calendar_today_outlined),
        ),
        BottomNavigationBarItem(
          label: "Debts",
          icon: Icon(Icons.account_balance),
        ),
      ],
    );
  }

  Widget _buildPageFromIndex(int currentPageIndex) {
    if (currentPageIndex == 0) {
      return EventsScreen();
    }

    if (currentPageIndex == 1) {
      return DebtsScreen();
    }

    throw Exception("Yo, WTF?");
  }
}
