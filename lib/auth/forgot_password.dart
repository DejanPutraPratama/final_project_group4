import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Hello Storbagers!',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const Text(
//                 "Let's sustaining our environment together!",
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   errorText: 'Email have not been registered',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SendOTPScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green[800],
//                 ),
//                 child: const Text('Next'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SendOTPScreen extends StatelessWidget {
//   const SendOTPScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Verification email is sent',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const Text(
//                 "Please verify that's you",
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: 'OTP code',
//                   errorText: 'The OTP does not match',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green[800],
//                 ),
//                 child: const Text('Next'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ResetPasswordScreen extends StatelessWidget {
//   const ResetPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Reset Password',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const Text(
//                 'Make yourself a new password',
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   errorText: 'Confirm password is not same with the password',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement password reset functionality here
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green[800],
//                 ),
//                 child: const Text('Next'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }