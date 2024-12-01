import 'package:crud/models/client.dart';

abstract class ClientEvents {}

class LoadClientEvent extends ClientEvents {}

class AddClientEvent extends ClientEvents {
  Client client;
  AddClientEvent({required this.client});
}

class RemoveClientEvent extends ClientEvents {
  Client client;

  RemoveClientEvent({required this.client});
}