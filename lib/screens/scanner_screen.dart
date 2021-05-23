import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/screens/home_screen.dart';
import 'package:super_easy_permissions/super_easy_permissions.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ScannerScreen extends StatefulWidget {
  static String tableId;
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  var _reader;
  Permissions permission = Permissions.camera;

  void scan() async {
    try {
      final reader = await BarcodeScanner.scan();
      if (!mounted) {
        return;
      }
      setState(() {
        _reader = reader;
      });
    } on PlatformException catch (error) {
      if (error.code == BarcodeScanner.cameraAccessDenied) {
        requestPermission();
      }
    } on FormatException catch (error) {
      setState(() {
        _reader = "user returned with scanning";
      });
    }
    ScannerScreen.tableId = _reader.rawContent;
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  requestPermission() async {
    int result = await SuperEasyPermissions.getPermissionResult(permission);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Welcome'),
            if (_reader == String) Text(_reader),
            FlatButton(
              onPressed: () {
                scan();
              },
              child: Text(
                'Scan',
                style: TextStyle(color: Colors.white),
              ),
              color: HexColor('#FC4041'),
            ),
          ],
        ),
      ),
    );
  }
}
