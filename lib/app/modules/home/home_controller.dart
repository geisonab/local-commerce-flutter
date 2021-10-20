import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  Stream<QuerySnapshot> empresas;

  getEmpresas(){
    empresas = Firestore.instance.collection('empresas').orderBy("nome").snapshots();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
