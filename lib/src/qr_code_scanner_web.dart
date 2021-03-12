import 'package:flutter/widgets.dart';
import 'qr_code_scanner_web_impl.dart';

///
/// QrCodeCameraWeb
class QrCodeCameraWeb extends StatelessWidget {
  final void Function(String qrValue) qrCodeCallback;
  final Widget child;
  final BoxFit fit;
  final Widget Function(BuildContext context, Object error) onError;

  QrCodeCameraWeb({
    Key key,
    @required this.qrCodeCallback,
    this.child,
    this.fit = BoxFit.cover,
    this.onError,
  })  : assert(qrCodeCallback != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrCodeCameraWebImpl(
      key: key,
      qrCodeCallback: qrCodeCallback,
      child: child,
      fit: fit,
      onError: onError,
    );
  }
}
