import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  final int tab;
  const TabPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page $tab'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page(tab: tab),
                  ));
            },
            child: const Text('Goto Page')),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int tab;
  const Page({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab $tab'),
      ),
      body: Center(
        child: Text('tab $tab'),
      ),
    );
  }
}
