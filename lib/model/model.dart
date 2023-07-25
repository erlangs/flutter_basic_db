import 'package:flutter_basic_db/db/db.dart';

class DbNote extends DbIntIdRecord {
  final title = CvField<String>('title');
  final content = CvField<String>('content');
  final date = CvField<int>('date');

  @override
  List<CvField> get fields => [title, content, date];
}
