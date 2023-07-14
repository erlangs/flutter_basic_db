// import 'package:flutter/foundation.dart';
// import 'package:flutter_basic_db/model/person_model.dart';
// import 'package:sembast/sembast.dart';
// import 'package:tekartik_common_utils/common_utils_import.dart';
//
// DbPerson snapshotToPerson(RecordSnapshot snapshot) {
//   return DbPerson()
//     ..fromMap(snapshot.value as Map)
//     ..id = snapshot.key as int;
// }
//
// class DbPersons extends ListBase<DbPerson> {
//   final List<RecordSnapshot<int, Map<String, Object?>>> list;
//   late List<DbPerson?> _cachePersons;
//
//   DbPersons(this.list) {
//     _cachePersons = List.generate(list.length, (index) => null);
//   }
//
//   @override
//   DbPerson operator [](int index) {
//     return _cachePersons[index] ??= snapshotToPerson(list[index]);
//   }
//
//   @override
//   int get length => list.length;
//
//   @override
//   void operator []=(int index, DbPerson? value) => throw 'read-only';
//
//   @override
//   set length(int newLength) => throw 'read-only';
// }
//
// class DbPersonProvider {
//   static final String personStoreName = 'persons';
//   Database? db;
//
//   final personsStore = intMapStoreFactory.store(personStoreName);
//
//   DbPersonProvider(this.db);
//
//   Future<DbPerson?> getPerson(int id) async {
//     var map = await personsStore.record(id).get(db!);
//     // devPrint('getPerson: ${map}');
//     if (map != null) {
//       return DbPerson()
//         ..fromMap(map)
//         ..id = id;
//     }
//     return null;
//   }
//
//   Future savePerson(DbPerson updatedPerson) async {
//     if (updatedPerson.id != null) {
//       await personsStore.record(updatedPerson.id!).put(db!, updatedPerson.toMap());
//     } else {
//       updatedPerson.id = await personsStore.add(db!, updatedPerson.toMap());
//     }
//   }
//
//   Future deletePerson(int? id) async {
//     if (id != null) {
//       await personsStore.record(id).delete(db!);
//     }
//   }
//
//   var personsTransformer = StreamTransformer<
//       List<RecordSnapshot<int, Map<String, Object?>>>,
//       List<DbPerson>>.fromHandlers(handleData: (snapshotList, sink) {
//     sink.add(DbPersons(snapshotList));
//   });
//
//   var personTransformer = StreamTransformer<
//       RecordSnapshot<int, Map<String, Object?>>?,
//       DbPerson?>.fromHandlers(handleData: (snapshot, sink) {
//     sink.add(snapshot == null ? null : snapshotToPerson(snapshot));
//   });
//
//   /// Listen for changes on any person
//   Stream<List<DbPerson>> onPersons() {
//     return personsStore
//         .query(finder: Finder(sortOrders: [SortOrder('date', false)]))
//         .onSnapshots(db!)
//         .transform(personsTransformer);
//   }
//
//   /// Listed for changes on a given person
//   Stream<DbPerson?> onPerson(int id) {
//     return personsStore.record(id).onSnapshot(db!).transform(personTransformer);
//   }
//
//   Future clearAllPersons() async {
//     await personsStore.delete(db!);
//   }


// Future<DbPerson?> filterPerson(Filter filter) async {
//   Stream<List<DbPerson>> stream = personsStore
//       .query(finder: Finder(
//       filter: filter,
//       sortOrders: [SortOrder('date', false)]))
//       .onSnapshots(db!)
//       .transform(personsTransformer);
//   List<DbPerson> findList = await stream.first;
//   if(findList.isNotEmpty) {
//     return findList.first;
//   }
//   return null;
// }
//
// void test() async {
//   DbPerson? person = await filterPerson(Filter.equals('id', '9a13043e24f44ea5a5fe6f24350b36fe'));
//
//   Stream<List<DbPerson>> personsStream = personsStore
//       .query(finder: Finder(
//       filter: Filter.equals('name', '谢霆锋'),
//       sortOrders: [SortOrder('date', false)]))
//       .onSnapshots(db!)
//       .transform(personsTransformer);
//   List<DbPerson> findList = await personsStream.first;
//   for(DbPerson dbPerson in findList) {
//     deletePerson(dbPerson.id);
//   }
//
//   print("person_provider_test");
//   savePerson(DbPerson()
//     ..name.v = "test"
//     ..personId.v = "111"
//   );
//   var first = await onPersons().first;
//   print("person_provider_test");
// }
// }
