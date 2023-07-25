import 'package:cv/cv.dart';

export 'package:cv/cv.dart';

/// Base record implementation.
abstract class DbIntIdRecord extends CvModelBase {
  /// Record id.
  int? id;
}

/// Base record implementation.
abstract class DbStringIdRecord extends CvModelBase {
  /// Record id.
  String? id;
}