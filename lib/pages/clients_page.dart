import 'dart:math';

import 'package:crud/blocs/client_bloc.dart';
import 'package:crud/blocs/client_events.dart';
import 'package:crud/blocs/client_state.dart';
import 'package:crud/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  // final clientsList = [];
  late final ClientBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return ['Firebase', 'Docker', 'AWS', 'GitHub'].elementAt(rand.nextInt(4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('CRD BLoC'),
        actions: [
          IconButton(
            onPressed: () {
              bloc.add(AddClientEvent(client: Client(nome: randomName())));
            }, 
            icon: const Icon(Icons.person_add)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: BlocBuilder<ClientBloc ,ClientState>(
          bloc: bloc,
          builder: (context,  state) {
            if(state is ClientInitialState) {
              return const Center(child: CircularProgressIndicator(),);
            } else if(state is ClientSuccessState) {
                final clientsList = state.clients;
            
              return ListView.separated(
                itemCount: clientsList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      child: Text(clientsList[index].nome.substring(0, 1)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  title: Text(clientsList[index].nome),
                  trailing: IconButton(
                    onPressed: () {
                      bloc.add(RemoveClientEvent(client: clientsList[index]));
                    }, 
                    icon: const Icon(Icons.remove) 
                  ),
                ) , 
                separatorBuilder: (_, __) => const Divider(), 
              );
            }
            return Container();
          }
        ),
      ),
    );
  }
}