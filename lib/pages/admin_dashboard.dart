import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slam_admin/pages/register_student.dart';

import 'home_fragment.dart';
import 'reports_fragment.dart';
import 'track_students_fragment.dart';
import 'sos_alerts_fragment.dart';
import 'student_search_fragment.dart';

enum SideBarItem {
  home(
      value: 'Home',
      icon: Icons.home,
      // icon: Image.asset('assets/images/home-side.png'),
      body: HomeFragment()),
  reports(value: 'Reports', icon: Icons.report, body: ReportsFragment()),
  track(
      value: 'Track', icon: Icons.track_changes, body: TrackStudentsFragment()),
  alerts(value: 'Alerts', icon: Icons.dangerous, body: SosAlertsFragment()),
  studentSearch(
      value: 'Search', icon: Icons.search, body: StudentSearchFragment()),
  registerStudent(
      value: 'Register Student',
      icon: Icons.account_balance,
      body: RegistrationForm()),
  logout(value: 'Logout', icon: Icons.logout, body: HomeFragment());

  const SideBarItem(
      {required this.value, required this.icon, required this.body});
  final String value;
  final IconData icon;
  final Widget body;
}

final sideBarItemProvider =
    StateProvider<SideBarItem>((ref) => SideBarItem.home);

class AdminDashboard extends ConsumerStatefulWidget {
  const AdminDashboard({super.key});

  @override
  AdminDashboardState createState() => AdminDashboardState();
}

class AdminDashboardState extends ConsumerState<AdminDashboard> {
  String selectedRoute = '/home';
  SideBarItem getSideBarItem(AdminMenuItem item) {
    for (var value in SideBarItem.values) {
      if (item.route == value.name) {
        return value;
      }
    }
    return SideBarItem.home;
  }

  @override
  Widget build(BuildContext context) {
    final sideBarItem = ref.watch(sideBarItemProvider);
    final sideBarkey = ValueKey(Random().nextInt(1000000));
    const String stringParam = 'String parameter';
    const int intParam = 1000000;
    const double padding = 12.0;
    return AdminScaffold(
      sideBar: SideBar(
        key: sideBarkey,
        backgroundColor: const Color.fromARGB(255, 32, 89, 137),
        textStyle: const TextStyle(color: Colors.white),
        activeBackgroundColor: Colors.white54,
        activeTextStyle: const TextStyle(color: Colors.white),
        items: SideBarItem.values
            .map((e) =>
                AdminMenuItem(title: e.value, icon: e.icon, route: e.name))
            .toList(),
        selectedRoute: sideBarItem.name,
        onSelected: (item) => ref
            .read(sideBarItemProvider.notifier)
            .update((state) => getSideBarItem(item)),
        header: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 24, 115, 190),
                Color.fromARGB(255, 32, 89, 137),
                Color.fromARGB(255, 13, 60, 98),
              ],
            ),
          ),
          height: 150,
          // color: Colors.blue[800],
          child: const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SLAM',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                    SizedBox(width: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Student Location and',
                          style: TextStyle(fontSize: 9, color: Colors.white),
                        ),
                        Text(
                          'Apprehension Model',
                          style: TextStyle(fontSize: 9, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  'Administrator panel',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Divider(),
              )
            ],
          )),
        ),
        footer: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 24, 115, 190),
                Color.fromARGB(255, 32, 89, 137),
                Color.fromARGB(255, 13, 60, 98),
              ],
            ),
          ),
          height: 50,
          // color: Colors.blue[800],
          child: const Center(
            child: Text(
              '© 2024 SLAM',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
      body: ProviderScope(child: sideBarItem.body),
    );
  }
}
