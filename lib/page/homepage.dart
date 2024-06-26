import 'package:flutter/material.dart';
import 'package:final_project_group4/auth/auth_service.dart';
import 'redeem/redeem.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<String?>(
        future: _auth.getCurrentUserId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          String userId = snapshot.data ?? 'No ID';
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Home, UserID: $userId',
                  style: TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RedeemPage(userId: userId)),
                    );
                  },
                  child: Text('Go to Redeem Page'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
