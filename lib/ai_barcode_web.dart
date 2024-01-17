library ai_barcode_web;

import 'dart:async';

import 'package:ai_barcode_platform_interface/ai_barcode_platform_interface.dart';
import 'package:ai_barcode_web/src/qr_code_scanner_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:qr_flutter/qr_flutter.dart';

///
/// AiBarcodeWebPlugin
class AiBarcodeWebPlugin {
  /// Registers this class as the default instance of [AiBarcodeWebPlugin].
  static void registerWith(Registrar registrar) {
    // Registers plugins
    AiBarcodeScannerWebPlugin.registerWith(registrar);
    AiBarcodeCreatorWebPlugin.registerWith(registrar);
  }
}

/// AiBarcodeScannerWebPlugin
class AiBarcodeScannerWebPlugin extends AiBarcodeScannerPlatform {
  ///
  /// VideoElement
//  static html.VideoElement _videoElement = html.VideoElement();

  /// Registers this class as the default instance of [AiBarcodeWebPlugin].
  static void registerWith(Registrar registrar) {
    AiBarcodeScannerPlatform.instance = AiBarcodeScannerWebPlugin();
//
//    // ignore: undefined_prefixed_name
//    ui.platformViewRegistry
//        .registerViewFactory(AiBarcodePlatform.viewIdOfScanner, (int viewId) {
//      return _videoElement;
//    });
  }

//  @override
//  Widget buildScannerView(BuildContext context) {
//    Future.delayed(Duration(seconds: 2))
//        .then((value) => onPlatformScannerViewCreated(0));
//    return HtmlElementView(
//      key: UniqueKey(),
//      viewType: AiBarcodePlatform.viewIdOfScanner,
//    );
//  }
  @override
  Widget buildScannerView(BuildContext context) {
    return QrCodeCameraWeb(
      qrCodeCallback: (String result) {
        notifyResultListenerCallback(result);
      },
    );
  }

  @override
  startCamera() async {
    //start camera
//    html.window.navigator
//        .getUserMedia(video: true)
//        .then((html.MediaStream mediaStream) {
//      _videoElement.srcObject = mediaStream;
//      return mediaStream;
//    });
  }

  @override
  Future<String> startCameraPreview() async {
    //start camera preview
//    _videoElement.play();
    return Future.delayed(Duration(seconds: 10))
        .then((value) => "after 10 second ,web code result doing!");
  }

  @override
  stopCameraPreview() async {
    //stop camera preview
//    _videoElement.pause();
  }

  @override
  stopCamera() async {
    //stop camera and release camera
//    _videoElement.srcObject.getTracks().forEach((element) {
//      element.stop();
//    });
  }

  @override
  toggleFlash() async {}

  @override
  closeFlash() async {}

  @override
  openFlash() async {}
}

/// AiBarcodeCreatorWebPlugin
class AiBarcodeCreatorWebPlugin extends AiBarcodeCreatorPlatform {
  ///
  /// VideoElement
//  static html.VideoElement _videoElement = html.VideoElement();

  /// Registers this class as the default instance of [AiBarcodeCreatorWebPlugin].
  static void registerWith(Registrar registrar) {
    AiBarcodeCreatorPlatform.instance = AiBarcodeCreatorWebPlugin();
//
//    // ignore: undefined_prefixed_name
//    ui.platformViewRegistry
//        .registerViewFactory(AiBarcodePlatform.viewIdOfCreator, (int viewId) {
//      return _videoElement;
//    });
  }

  @override
  Widget buildCreatorView(BuildContext context) {
    QrImageView qrImage = QrImageView(
      data: AiBarcodeCreatorPlatform.instance.initialValueOfCreator,
      version: QrVersions.auto,
      size: 200.0,
    );

    return qrImage;
  }

  @override
  updateQRCodeValue(String value) {
    AiBarcodeCreatorPlatform.instance.initialValueOfCreator = value;
    notifyListeners();
  }
}
