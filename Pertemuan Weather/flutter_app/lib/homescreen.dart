// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class  HomeScreen extends StatefulWidget {
//  @override
//  _YourWidgetName createState() => _YourWidgetName();
// }
// class _YourWidgetName extends State< HomeScreen> {
//  @override
//  Widget build(BuildContext context) {
//  return Container();
//  }
//  getCurrentLocation() async {
//  var p = await Geolocator.getCurrentPosition(
//  desiredAccuracy: LocationAccuracy.low,
//  forceAndroidLocationManager: true,
//  );
//  if (p != null) {
//  print('Lat:${p.latitude}, Long:${p.longitude}');
 
//  } else {
//  print('Data unavailable');
//  }
//  }

// }


// // Step 1: Getting Current location co-ordinates
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCurrentLocation();
//   }

//   Future<void> getCurrentLocation() async {
//     try {
//       var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//         forceAndroidLocationManager: true,
//       );
//       if (position != null) {
//         print('Lat: ${position.latitude}, Long: ${position.longitude}');
//       } else {
//         print('Data unavailable');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//       )
//     );
//   }
// }


// STEP 3: Getting weather data of Current location
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart' as k;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//   }

//   Future<void> getCurrentLocation() async {
//     try {
//       var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//         forceAndroidLocationManager: true,
//       );
//       if (position != null) {
//         print('Lat: ${position.latitude}, Long: ${position.longitude}');
//         fetchWeather(position.latitude, position.longitude);
//       } else {
//         print('Data unavailable');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> fetchWeather(double lat, double lon) async {
//     final url = '${k.domain}lat=$lat&lon=$lon&appid=${k.apiKey}&units=metric';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('Weather: ${data['weather'][0]['description']}');
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather App'),
//         ),
//         body: Center(
//           child: Text('Mengambil Cuaca...'),
//         ),
//       ),
//     );
//   }
// }

// // API call by latitude longitude format
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart' as k;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//   }

//   getCurrentLocation() async {
//     try {
//       var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//         forceAndroidLocationManager: true,
//       );
//       if (position != null) {
//         print('Lat: ${position.latitude}, Long: ${position.longitude}');
//         fetchWeather(position.latitude, position.longitude);
//       } else {
//         print('Data unavailable');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> fetchWeather(double lat, double lon) async {
//     final url = '${k.domain}lat=$lat&lon=$lon&appid=${k.apiKey}&units=metric';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         // Menampilkan data JSON lengkap di konsol
//         print(jsonEncode(data)); // Untuk melihat JSON 
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     } 
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather App'),
//         ),
//         body: Center(
//           child: Text('Mengambil Cuaca...'),
//         ),
//       ),
//     );
//   }
// }

// // API call by city name format

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart'; // Import file constants.dart
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String weatherInfo = "Mengambil data cuaca...";

//   Future<void> getCityWeather() async {
//     final url = Uri.parse(weatherUrl); // Mengambil URL dari constants.dart
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print(jsonEncode(data)); // Menampilkan data JSON lengkap di konsol
//       } else {
        
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() {
//         weatherInfo = "Error: $e";
//       });
//       print('Error: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCityWeather(); // Panggil fungsi untuk mendapatkan data cuaca
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather App'),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               weatherInfo,
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // STEP 5: Completing the Build
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart'; // Import file constants.dart
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

//   Future<void> getCityWeather() async {
//     final url = Uri.parse(weatherUrl); // Mengambil URL dari constants.dart
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print(jsonEncode(data)); // Menampilkan data JSON lengkap di konsol
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() {
//          "Error: $e";
//       });
//       print('Error: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCityWeather(); // Panggil fungsi untuk mendapatkan data cuaca
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
        
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text("Mengambil data cuaca...",
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.white, // Mengatur warna teks menjadi putih
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Menyediakan beberapa variabel untuk menyimpan nilai suhu, 
// //tekanan, kelembaban, tutupan awan, nama kota dan status data

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart'; // Import file constants.dart
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';

//   Future<void> getCityWeather() async {
//     final url = Uri.parse(weatherUrl); // Mengambil URL dari constants.dart
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           temp = data['main']['temp']; // Suhu
//           press = data['main']['pressure']; // Tekanan
//           hum = data['main']['humidity']; // Kelembapan
//           cover = data['clouds']['all']; // Tutupan awan
//           cityname = data['name']; // Nama kota
//           isLoaded = true; // Menandakan data sudah siap
//         });
//         print(jsonEncode(data)); // Menampilkan data JSON lengkap di konsol
//       } else {
//         setState(() {
//           isLoaded = false;
//         });
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() {
//         isLoaded = false;
//       });
//       print('Error: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCityWeather(); // Panggil fungsi untuk mendapatkan data cuaca
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: isLoaded
//                   ? Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Kota: $cityname",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Suhu: ${temp.toStringAsFixed(1)}°C",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tekanan: ${press} hPa",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Kelembapan: ${hum}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tutupan Awan: ${cover}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     )
//                   : Text(
//                       "Mengambil data cuaca...",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // menambahkan widget Visibilitas sebagai anak dari widget Kontainer
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart'; // Import file constants.dart
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';

//   Future<void> getCityWeather() async {
//     final url = Uri.parse(weatherUrl); // Mengambil URL dari constants.dart
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           temp = data['main']['temp']; // Suhu
//           press = data['main']['pressure']; // Tekanan
//           hum = data['main']['humidity']; // Kelembapan
//           cover = data['clouds']['all']; // Tutupan awan
//           cityname = data['name']; // Nama kota
//           isLoaded = true; // Menandakan data sudah siap
//         });
//         print(jsonEncode(data)); // Menampilkan data JSON lengkap di konsol
//       } else {
//         setState(() {
//           isLoaded = false;
//         });
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() {
//         isLoaded = false;
//       });
//       print('Error: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCityWeather(); // Panggil fungsi untuk mendapatkan data cuaca
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Visibility(
//                 visible: isLoaded,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Kota: $cityname",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Suhu: ${temp.toStringAsFixed(1)}°C",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Tekanan: ${press} hPa",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Kelembapan: ${hum}%",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Tutupan Awan: ${cover}%",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 replacement: Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // menambahkan fungsi updateUI
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart'; // Import file constants.dart
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';

//   Future<void> getCityWeather() async {
//     final url = Uri.parse(weatherUrl); // Mengambil URL dari constants.dart
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         updateUI(data); // Memperbarui variabel dengan data JSON
//         print(jsonEncode(data)); // Menampilkan data JSON lengkap di konsol
//       } else {
//         setState(() {
//           isLoaded = false;
//         });
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() {
//         isLoaded = false;
//       });
//       print('Error: $e');
//     }
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celsius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCityWeather(); // Panggil fungsi untuk mendapatkan data cuaca
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Visibility(
//                 visible: isLoaded,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Kota: $cityname",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Suhu: ${temp.toStringAsFixed(1)}°C",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Tekanan: ${press} hPa",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Kelembapan: ${hum}%",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Tutupan Awan: ${cover}%",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 replacement: Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // mengintegrasikan fungsi getCurrentCityWeather
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:weatherappclima/constants.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';

//   Future<void> getCityWeather() async {
//     final url = Uri.parse(weatherUrl); // Mengambil URL dari constants.dart
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         updateUI(data); // Memperbarui variabel dengan data JSON
//         print(jsonEncode(data)); // Menampilkan data JSON lengkap di konsol
//       } else {
//         setState(() {
//           isLoaded = false;
//         });
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() {
//         isLoaded = false;
//       });
//       print('Error: $e');
//     }
//   }

//   Future<void> getCurrentCityWeather() async {
//     final url = Uri.parse(weatherUrl); // URL untuk API
//     try {
//       final response = await http.get(url); // Permintaan HTTP
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body); // Dekode respons JSON
//         updateUI(data); // Perbarui UI dengan data JSON
//         setState(() {
//           isLoaded = true; // Tandai data telah dimuat
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celsius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCurrentCityWeather(); // Panggil fungsi saat widget diinisialisasi
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Visibility(
//                 visible: isLoaded,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Kota: $cityname",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Suhu: ${temp.toStringAsFixed(1)}°C",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Tekanan: ${press} hPa",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Kelembapan: ${hum}%",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Tutupan Awan: ${cover}%",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 replacement: Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
 
// // menambahkan fungsi getCityWeather dengan parameter cityname
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:weatherappclima/constants.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';

//   Future<void> getCityWeather(String cityname) async {
//     final url =
//         Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey'); // URL dengan parameter nama kota
//     try {
//       final response = await http.get(url); // Permintaan HTTP
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body); // Dekode respons JSON
//         updateUI(data); // Perbarui UI dengan data JSON
//         setState(() {
//           isLoaded = true; // Tandai data telah dimuat
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//         setState(() {
//           isLoaded = false;
//         });
//       }
//     } catch (e) {
//       print("Error: $e");
//       setState(() {
//         isLoaded = false;
//       });
//     }
//   }

//   Future<void> getCurrentCityWeather() async {
//     final url = Uri.parse(weatherUrl); // URL default dari constants.dart
//     try {
//       final response = await http.get(url); // Permintaan HTTP
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body); // Dekode respons JSON
//         updateUI(data); // Perbarui UI dengan data JSON
//         setState(() {
//           isLoaded = true; // Tandai data telah dimuat
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celsius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCurrentCityWeather(); // Panggil fungsi saat widget diinisialisasi
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController cityController = TextEditingController();

//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(
//                     controller: cityController,
//                     decoration: InputDecoration(
//                       hintText: "Masukkan Nama Kota",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       String cityNameInput = cityController.text.trim();
//                       if (cityNameInput.isNotEmpty) {
//                         getCityWeather(cityNameInput); // Panggil API dengan nama kota
//                       }
//                     },
//                     child: Text("Cari Cuaca"),
//                   ),
//                   SizedBox(height: 32),
//                   Visibility(
//                     visible: isLoaded,
//                     child: Column(
//                       children: [
//                         Text(
//                           "Kota: $cityname",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Suhu: ${temp.toStringAsFixed(1)}°C",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tekanan: ${press} hPa",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Kelembapan: ${hum}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tutupan Awan: ${cover}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     replacement: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// integrasi TextFormField ke dalam widget Visibility, 
// TextFormField akan digunakan untuk memasukkan nama kota.

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:weatherappclima/constants.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';
//   TextEditingController controller = TextEditingController();

//   Future<void> getCityWeather(String cityname) async {
//     final url =
//         Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey'); // URL dengan parameter nama kota
//     try {
//       final response = await http.get(url); // Permintaan HTTP
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body); // Dekode respons JSON
//         updateUI(data); // Perbarui UI dengan data JSON
//         setState(() {
//           isLoaded = true; // Tandai data telah dimuat
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//         setState(() {
//           isLoaded = false;
//         });
//       }
//     } catch (e) {
//       print("Error: $e");
//       setState(() {
//         isLoaded = false;
//       });
//     }
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celsius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.85,
//                     height: MediaQuery.of(context).size.height * 0.09,
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.3),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                     ),
//                     child: Center(
//                       child: TextFormField(
//                         onFieldSubmitted: (String s) {
//                           setState(() {
//                             cityname = s;
//                             getCityWeather(s);
//                             isLoaded = false;
//                             controller.clear();
//                           });
//                         },
//                         controller: controller,
//                         cursorColor: Colors.white,
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                         decoration: InputDecoration(
//                           hintText: 'Search city',
//                           hintStyle: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white.withOpacity(0.7),
//                             fontWeight: FontWeight.w600,
//                           ),
//                           prefixIcon: Icon(
//                             Icons.search_rounded,
//                             size: 25,
//                             color: Colors.white.withOpacity(0.7),
//                           ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   Visibility(
//                     visible: isLoaded,
//                     child: Column(
//                       children: [
//                         Text(
//                           "Kota: $cityname",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Suhu: ${temp.toStringAsFixed(1)}°C",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tekanan: ${press} hPa",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Kelembapan: ${hum}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tutupan Awan: ${cover}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     replacement: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // membuang TextEditingController dalam method dispose
// // SizedBox untuk menambahkan ruang yang diperlukan di antara komponen-komponen.
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:weatherappclima/constants.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';
//   TextEditingController controller = TextEditingController();

//   Future<void> getCityWeather(String cityname) async {
//     final url =
//         Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey'); // URL dengan parameter nama kota
//     try {
//       final response = await http.get(url); // Permintaan HTTP
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body); // Dekode respons JSON
//         updateUI(data); // Perbarui UI dengan data JSON
//         setState(() {
//           isLoaded = true; // Tandai data telah dimuat
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//         setState(() {
//           isLoaded = false;
//         });
//       }
//     } catch (e) {
//       print("Error: $e");
//       setState(() {
//         isLoaded = false;
//       });
//     }
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celsius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // Bersihkan pengontrol untuk menghemat memori
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.85,
//                     height: MediaQuery.of(context).size.height * 0.09,
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.3),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                     ),
//                     child: Center(
//                       child: TextFormField(
//                         onFieldSubmitted: (String s) {
//                           setState(() {
//                             cityname = s;
//                             getCityWeather(s);
//                             isLoaded = false;
//                             controller.clear();
//                           });
//                         },
//                         controller: controller,
//                         cursorColor: Colors.white,
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                         decoration: InputDecoration(
//                           hintText: 'Search city',
//                           hintStyle: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white.withOpacity(0.7),
//                             fontWeight: FontWeight.w600,
//                           ),
//                           prefixIcon: Icon(
//                             Icons.search_rounded,
//                             size: 25,
//                             color: Colors.white.withOpacity(0.7),
//                           ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30), // Menambahkan ruang antar komponen
//                   Visibility(
//                     visible: isLoaded,
//                     child: Column(
//                       children: [
//                         Text(
//                           "Kota: $cityname",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Suhu: ${temp.toStringAsFixed(1)}°C",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tekanan: ${press} hPa",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Kelembapan: ${hum}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tutupan Awan: ${cover}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     replacement: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// // implementasi Row yang terdiri dari Icon dan Text
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:weatherappclima/constants.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';
//   TextEditingController controller = TextEditingController();

//   Future<void> getCityWeather(String cityname) async {
//     final url =
//         Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey'); // URL dengan parameter nama kota
//     try {
//       final response = await http.get(url); // Permintaan HTTP
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body); // Dekode respons JSON
//         updateUI(data); // Perbarui UI dengan data JSON
//         setState(() {
//           isLoaded = true; // Tandai data telah dimuat
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//         setState(() {
//           isLoaded = false;
//         });
//       }
//     } catch (e) {
//       print("Error: $e");
//       setState(() {
//         isLoaded = false;
//       });
//     }
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celsius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // Bersihkan pengontrol untuk menghemat memori
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.85,
//                     height: MediaQuery.of(context).size.height * 0.09,
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.3),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                     ),
//                     child: Center(
//                       child: TextFormField(
//                         onFieldSubmitted: (String s) {
//                           setState(() {
//                             cityname = s;
//                             getCityWeather(s);
//                             isLoaded = false;
//                             controller.clear();
//                           });
//                         },
//                         controller: controller,
//                         cursorColor: Colors.white,
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                         decoration: InputDecoration(
//                           hintText: 'Search city',
//                           hintStyle: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white.withOpacity(0.7),
//                             fontWeight: FontWeight.w600,
//                           ),
//                           prefixIcon: Icon(
//                             Icons.search_rounded,
//                             size: 25,
//                             color: Colors.white.withOpacity(0.7),
//                           ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30), // Menambahkan ruang antar komponen
//                   Visibility(
//                     visible: isLoaded,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Icon(
//                                 Icons.pin_drop,
//                                 color: Colors.red,
//                                 size: 40,
//                               ),
//                               SizedBox(width: 8), // Memberikan jarak antara ikon dan teks
//                               Text(
//                                 cityname,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20), // Memberikan jarak tambahan
//                         Text(
//                           "Suhu: ${temp.toStringAsFixed(1)}°C",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tekanan: ${press} hPa",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Kelembapan: ${hum}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Tutupan Awan: ${cover}%",
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     replacement: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // menampilkan informasi cuaca seperti suhu, dengan gambar ikon.
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:weatherappclima/constants.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';
//   TextEditingController controller = TextEditingController();

//   Future<void> getCityWeather(String cityname) async {
//     final url =
//         Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey'); // URL dengan parameter nama kota
//     try {
//       final response = await http.get(url); // Permintaan HTTP
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body); // Dekode respons JSON
//         updateUI(data); // Perbarui UI dengan data JSON
//         setState(() {
//           isLoaded = true; // Tandai data telah dimuat
//         });
//       } else {
//         print("Error: ${response.statusCode}");
//         setState(() {
//           isLoaded = false;
//         });
//       }
//     } catch (e) {
//       print("Error: $e");
//       setState(() {
//         isLoaded = false;
//       });
//     }
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celsius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // Bersihkan pengontrol untuk menghemat memori
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF8FF43F), // Warna awal gradasi (#8ff43f)
//                 Color(0xFF16A085), // Warna akhir gradasi (#16A085)
//               ],
//             ),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Input kota
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.85,
//                     height: MediaQuery.of(context).size.height * 0.09,
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.3),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(20),
//                       ),
//                     ),
//                     child: Center(
//                       child: TextFormField(
//                         onFieldSubmitted: (String s) {
//                           setState(() {
//                             cityname = s;
//                             getCityWeather(s);
//                             isLoaded = false;
//                             controller.clear();
//                           });
//                         },
//                         controller: controller,
//                         cursorColor: Colors.white,
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                         decoration: InputDecoration(
//                           hintText: 'Search city',
//                           hintStyle: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white.withOpacity(0.7),
//                             fontWeight: FontWeight.w600,
//                           ),
//                           prefixIcon: Icon(
//                             Icons.search_rounded,
//                             size: 25,
//                             color: Colors.white.withOpacity(0.7),
//                           ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30), // Ruang antar komponen
//                   // Kartu dengan informasi cuaca
//                   Visibility(
//                     visible: isLoaded,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Icon(
//                                 Icons.pin_drop,
//                                 color: Colors.red,
//                                 size: 40,
//                               ),
//                               SizedBox(width: 8), // Jarak ikon dan teks
//                               Text(
//                                 cityname,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20), // Ruang tambahan
//                         // Kartu suhu
//                         Container(
//                           width: double.infinity,
//                           height: MediaQuery.of(context).size.height * 0.12,
//                           margin: EdgeInsets.symmetric(vertical: 10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(15),
//                             ),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.shade900,
//                                 offset: Offset(1, 2),
//                                 blurRadius: 3,
//                                 spreadRadius: 1,
//                               )
//                             ],
//                           ),
//                           child: Row(
//                             children: [
//                               Image(
//                                 image: AssetImage('images/thermometer.png'),
//                                 width: MediaQuery.of(context).size.width * 0.09,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Temperature: ${temp.toInt()} ºC',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     replacement: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// tambahkan tekanan, kelembapan, tutupan awan
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weatherappclima/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded = false;
  num temp = 0;
  num press = 0;
  num hum = 0;
  num cover = 0;
  String cityname = '';
  TextEditingController controller = TextEditingController();

  Future<void> getCityWeather(String cityname) async {
    final url =
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey&units=metric');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        updateUI(data);
        setState(() {
          isLoaded = true;
        });
      } else {
        print("Error: ${response.statusCode}");
        setState(() {
          isLoaded = false;
          this.cityname = cityname; // Tetap tampilkan nama kota
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoaded = false;
        this.cityname = cityname; // Tetap tampilkan nama kota meskipun ada kesalahan
      });
    }
  }

  void updateUI(var decodedData) {
    setState(() {
      if (decodedData == null) {
        temp = 0;
        press = 0;
        hum = 0;
        cover = 0;
        cityname = '';
        isLoaded = false;
      } else {
        temp = decodedData['main']['temp'];
        press = decodedData['main']['pressure'];
        hum = decodedData['main']['humidity'];
        cover = decodedData['clouds']['all'];
        cityname = decodedData['name'];
        isLoaded = true;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Agar layout menyesuaikan dengan keyboard
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF8FF43F),
                Color(0xFF16A085),
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView( // Tambahkan scroll agar tidak overflow
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Input kota
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.09,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: TextFormField(
                          onFieldSubmitted: (String s) {
                            setState(() {
                              cityname = s;
                              getCityWeather(s);
                              isLoaded = false;
                              controller.clear();
                            });
                          },
                          controller: controller,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Search city',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w600,
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              size: 25,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Tampilkan nama kota
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pin_drop,
                            color: Colors.red,
                            size: 40,
                          ),
                          SizedBox(width: 8),
                          Text(
                            cityname,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Kartu cuaca
                    Visibility(
                      visible: isLoaded,
                      child: Column(
                        children: [
                          // Kartu Suhu
                          buildWeatherCard(
                            'Temperature',
                            '${temp.toInt()} ºC',
                            'images/thermometer.png',
                          ),
                          // Kartu Tekanan
                          buildWeatherCard(
                            'Pressure',
                            '${press.toInt()} hPa',
                            'images/barometer.png',
                          ),
                          // Kartu Kelembapan
                          buildWeatherCard(
                            'Humidity',
                            '${hum.toInt()} %',
                            'images/humidity.png',
                          ),
                          // Kartu Tutupan Awan
                          buildWeatherCard(
                            'Cloud Cover',
                            '${cover.toInt()} %',
                            'images/cloud cover.png',
                          ),
                        ],
                      ),
                      replacement: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWeatherCard(String title, String value, String imagePath) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.10, // Sesuaikan tinggi kartu
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            offset: Offset(1, 2),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(imagePath),
              width: MediaQuery.of(context).size.width * 0.09,
            ),
          ),
          SizedBox(width: 10),
          Text(
            '$title: $value',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}



