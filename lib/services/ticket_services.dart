part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  static Future<void> saveTicket(String userId, Ticket ticket) async {
    await ticketCollection.doc().set({
      'movieID': ticket.movieDetail.id ?? "",
      'userID': userId ?? "",
      'theaterName': ticket.theater.name ?? 0,
      'time': ticket.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice
    });
  }

  static Future<List<Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();
    Iterable<QueryDocumentSnapshot> documents = snapshot.docs
        .where((document) => document.data()['userID'] == userId);

    List<Ticket> tickets = [];
    for (var document in documents) {
      MovieDetail movieDetail =
          await MovieServices.getMovieDetail(document.data()['movieID']);
      tickets.add(Ticket(
          movieDetail,
          Theater(document.data()['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(document.data()['time']),
          document.data()['bookingCode'],
          document.data()['seats'].toString().split(','),
          document.data()['name'],
          document.data()['totalPrice']));
    }

    return tickets;
  }
}
