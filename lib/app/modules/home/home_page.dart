import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:local_commerce/app/modules/home/Components/custom_drawer.dart';
import 'package:local_commerce/app/modules/home/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Comércio Local"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Stream<QuerySnapshot> _empresas;
  @override
  void initState() {
    super.initState();
    Modular.get<HomeController>().getEmpresas();
    _empresas = Modular.get<HomeController>().empresas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: CustomDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _empresas,
        builder: (context,snapshot) {
          if(snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(children: <Widget>[
            Flexible(
              flex: 2,
              child: MapaEmpresas(documents: snapshot.data.documents,initialposition: LatLng(-21.87, -47.49)),
            ),
            Flexible(
              flex: 3,
              child: ListaEmpresas(documents: snapshot.data.documents,),
            ),
            ],
          );
        },
      ),
    );
  }
}

class ListaEmpresas extends StatelessWidget {
  const ListaEmpresas({Key key,@required this.documents}) : super(key: key);

  final documents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (builder, index){
        final document = documents[index];
        return ListTile(
          title: Text(document["nome"]),
          subtitle: Text(document["endereco"] != null ? document["endereco"] : ""),
        );
      },
    );
  }
}

class MapaEmpresas extends StatelessWidget {
  const MapaEmpresas({Key key, this.documents, this.initialposition}) : super(key: key);

  final List<DocumentSnapshot> documents;
  final LatLng initialposition;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: initialposition,
        zoom: 14,
      ),
    );
  }
}