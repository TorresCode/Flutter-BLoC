import 'dart:core';

import 'package:crud/models/client.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(nome: 'Torres'),
      Client(nome: 'Flutter'),
      Client(nome: 'Laravel'),
      Client(nome: 'Rest API'),
      Client(nome: 'VueJS')
    ]);
    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);

    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);

    return _clients;
  }

  /*List<Client> updateClient(Client client) {
    _clients.up(client);
    return _clients;
  }*/


}