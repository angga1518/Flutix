part of 'services.dart';

class FlutixTransactionServices {
  static CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');

  static Future<void> saveTransaction(
      FlutixTransaction flutixTransaction) async {
    await transactionCollection.doc().set({
      'userID': flutixTransaction.userID,
      'title': flutixTransaction.title,
      'subtitle': flutixTransaction.subtitle,
      'time': flutixTransaction.time.millisecondsSinceEpoch,
      'amount': flutixTransaction.amount,
      'picture': flutixTransaction.picture
    });
  }

  static Future<List<FlutixTransaction>> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.get();

    Iterable<QueryDocumentSnapshot> documents =
        snapshot.docs.where((document) => document.data()['userID'] == userID);

    return documents
        .map((e) => FlutixTransaction(
            userID: e.data()['userID'],
            title: e.data()['title'],
            subtitle: e.data()['subtitle'],
            time: DateTime.fromMillisecondsSinceEpoch(e.data()['time']),
            amount: e.data()['amount'],
            picture: e.data()['picture']))
        .toList();
  }
}
