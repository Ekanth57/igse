import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igse/loginSignup/signup.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class QrScan extends StatefulWidget {

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: .2.sw,
            width: 1.sw,
          ),
          Container(
            width: .8.sw,
            height: .8.sw,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MobileScanner(
                  fit: BoxFit.fill,
                  controller: cameraController,
                  onDetect: (barcode, args) async {
                    cameraController.stop();
                    final String code = barcode.rawValue!;
                    debugPrint('Barcode found! $code');
                    // ignore: unnecessary_null_comparison
                    if (barcode == null) {
                      print('nothing return.');
                    } else {
                       Navigator.pop(context,code);
                    }
                  }),
            ),
          ),
          SizedBox(
            height: .2.sw,
            width: 1.sw,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: cameraController.torchState,
                    builder: (context, state, child) {
                      switch (state as TorchState) {
                        case TorchState.off:
                          return const Icon(Icons.flash_off,
                              color: Colors.grey);
                        case TorchState.on:
                          return const Icon(Icons.flash_on,
                              color: Colors.yellow);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => cameraController.toggleTorch(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: Colors.white,
                  icon: ValueListenableBuilder(
                    valueListenable: cameraController.cameraFacingState,
                    builder: (context, state, child) {
                      switch (state as CameraFacing) {
                        case CameraFacing.front:
                          return const Icon(Icons.camera_front);
                        case CameraFacing.back:
                          return const Icon(Icons.camera_rear);
                      }
                    },
                  ),
                  iconSize: 32.0,
                  onPressed: () => cameraController.switchCamera(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
