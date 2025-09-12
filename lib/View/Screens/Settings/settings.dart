import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF1766A0),
      ),
      body: const Center(
        child: Text('Settings Screen', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:flutter/services.dart';
//
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends State<SettingsScreen> {
//   final LocalAuthentication auth = LocalAuthentication();
//   bool _canCheckBiometrics = false;
//   bool _isDeviceSupported = false;
//   List<BiometricType> _availableBiometrics = [];
//   bool _hasFingerprint = false;
//   bool _loading = true;
//   String _error = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _checkBiometrics();
//   }
//
//   Future<void> _checkBiometrics() async {
//     try {
//       _canCheckBiometrics = await auth.canCheckBiometrics;
//       _isDeviceSupported = await auth.isDeviceSupported();
//       _availableBiometrics = await auth.getAvailableBiometrics();
//       _hasFingerprint = _availableBiometrics.contains(BiometricType.strong) || _availableBiometrics.contains(BiometricType.weak);
//     } catch (e) {
//       _error = e.toString();
//     }
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   Future<void> _openSecuritySettings() async {
//     const platform = MethodChannel('com.senaeya/settings');
//     try {
//       await platform.invokeMethod('openSecuritySettings');
//     } catch (e) {
//       setState(() {
//         _error = 'Could not open settings: '
//             + e.toString();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: const Color(0xFF1766A0),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             tooltip: 'Refresh',
//             onPressed: () {
//               setState(() {
//                 _loading = true;
//                 _error = '';
//               });
//               _checkBiometrics();
//             },
//           ),
//         ],
//       ),
//       body: _loading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   if (_error.isNotEmpty)
//                     Text(_error, style: const TextStyle(color: Colors.red)),
//                   if (!_canCheckBiometrics || !_isDeviceSupported)
//                     const Text('Biometric authentication is not supported on this device.', style: TextStyle(fontSize: 18)),
//                   if (_canCheckBiometrics && _isDeviceSupported && !_hasFingerprint)
//                     Column(
//                       children: [
//                         const Text('No fingerprint enrolled.', style: TextStyle(fontSize: 18)),
//                         const SizedBox(height: 16),
//                         ElevatedButton.icon(
//                           icon: const Icon(Icons.settings),
//                           label: const Text('Open Security Settings'),
//                           onPressed: _openSecuritySettings,
//                         ),
//                         const SizedBox(height: 8),
//                         const Text('Please add a fingerprint in your device settings to use biometric login.', textAlign: TextAlign.center),
//                       ],
//                     ),
//                   if (_canCheckBiometrics && _isDeviceSupported && _hasFingerprint)
//                     const Text('Fingerprint is enrolled. You can use biometric login.', style: TextStyle(fontSize: 18, color: Colors.green)),
//                 ],
//               ),
//             ),
//     );
//   }
// }


