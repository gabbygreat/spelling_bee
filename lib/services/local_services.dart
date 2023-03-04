import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  static final LocalStorage instance = LocalStorage._init();
  static BoxCollection? _collection;
  LocalStorage._init();

  Future<BoxCollection> get collection async {
    Directory directory = await getApplicationDocumentsDirectory();

    if (_collection != null) return _collection!;
    _collection = await BoxCollection.open(
      'Questions',
      {'spelling', 'missing'},
      path: directory.path,
    );
    return _collection!;
  }

  Future<void> createSpelling() async {
    if ((await getSpelling() == null)) {
      final colIns = await instance.collection;
      final spellingBox = await colIns.openBox<Map>('spelling');
      await spellingBox.put(
        'questions',
        {
          '1': 'Public',
          '2': 'Host',
          '3': 'Friend',
          '4': 'Proceed',
          '5': 'Trust',
          '6': 'Handle',
          '7': 'Positive',
        },
      );
    }
  }

  Future<void> deleteAllSpelling() async {
    final colIns = await instance.collection;
    final spellingBox = await colIns.openBox<Map>('spelling');
    spellingBox.clear();
  }

  Future<Map<dynamic, dynamic>?> getSpelling() async {
    final colIns = await instance.collection;
    final spellingBox = await colIns.openBox<Map>('spelling');
    return await spellingBox.get('questions');
  }

  Future<bool> isLastSpelling(int pos) async {
    final colIns = await instance.collection;
    final spellingBox = await colIns.openBox<Map>('spelling');
    return pos >= (await spellingBox.get('questions'))!.length;
  }
}
