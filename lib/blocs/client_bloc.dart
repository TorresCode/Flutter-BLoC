import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud/blocs/client_events.dart';
import 'package:crud/blocs/client_state.dart';
import 'package:crud/models/client.dart';
import 'package:crud/repositories/clients_repository.dart';

class ClientBloc extends Bloc<ClientEvents, ClientState> {
  final _clientRepo = ClientsRepository();

  /*final StreamController<ClientEvents> _inputClientController = StreamController<ClientEvents>();
  final StreamController<ClientState> _outputClientController = StreamController<ClientState>();

  Sink<ClientEvents> get inputClient => _inputClientController.sink;
  Stream<ClientState> get stream => _outputClientController.stream;*/

  ClientBloc() : super(ClientInitialState()) {
    //_inputClientController.stream.listen((_mapEventToState));
    on<LoadClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepo.loadClients())),
    );

    on<AddClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepo.addClient(event.client))),
    );

    on<RemoveClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepo.removeClient(event.client))),
    );
  }

  /*_mapEventToState(ClientEvents event) {
    List<Client> clients = [];
    if(event is LoadClientEvent) {
      clients = _clientRepo.loadClients();
    } else if(event is AddClientEvent) {
      clients = _clientRepo.addClient(event.client);
    } else if(event is RemoveClientEvent) {
      clients = _clientRepo.removeClient(event.client);
    }

    _outputClientController.add(ClientSuccessState(clients: clients));
  }*/
}