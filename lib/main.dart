
import 'package:flutter/material.dart';

void main() {
  runApp(SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartHome Control',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, bool> devices = {
    'Living Room Lights': true,
    'Thermostat': false,
    'Security System': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4F8),
      appBar: AppBar(
        backgroundColor: Color(0xFF9C27B0),
        title: Text('SmartHome Control', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: devices.length,
        itemBuilder: (context, index) {
          String deviceName = devices.keys.elementAt(index);
          bool deviceStatus = devices[deviceName]!;

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.devices_other, color: Color(0xFF9C27B0), size: 30),
              title: Text(
                deviceName,
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: Switch(
                activeColor: Color(0xFF4CAF50),
                inactiveThumbColor: Color(0xFFF44336),
                value: deviceStatus,
                onChanged: (bool value) {
                  setState(() {
                    devices[deviceName] = value;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
