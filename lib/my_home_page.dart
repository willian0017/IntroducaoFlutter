import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _incrementando = true;
  int _contador = 0;
  List<int> _historico = [];
  int _somaTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Meu Flutter',
              style: TextStyle(color: Colors.white))),
      drawer: buildDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Você apertou:',
                style: TextStyle(fontSize: 50.0, fontStyle: FontStyle.italic)),
            const SizedBox(height: 20.0),
            Text(
              '$_contador''x',
              style: TextStyle(fontSize:65.0),
            ),
            const SizedBox(height: 20.0),
            Text('Histórico:',
              style: TextStyle(fontSize:32.0, fontStyle: FontStyle.italic, color: Colors.blueGrey)),
              Text(_historico.join(', '),
                style: TextStyle(fontSize:25.0, fontStyle: FontStyle.italic, color: Colors.blueGrey),
            ),
            Text(
                'Total: $_somaTotal',
                style: TextStyle(fontSize: 40.0, fontStyle: FontStyle.italic)),
            const SizedBox(height: 20.0),
            // Icon(Icons.build_circle_sharp, size: 65.0, color: Colors.blueGrey),
            // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', width: 300.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incOuDec,
        tooltip: _incrementando ? 'Incrimentar' : 'Decrementar',
        child: Icon (_incrementando ? Icons.add : Icons.remove),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: const Text(
              'Alternando contador',
              style: TextStyle(color: Colors.white, fontSize: 24,),
            ),
          ),
          ListTile(leading: const Icon(Icons.clear), title: const Text('Zerar contador'), onTap: _zerar,),
          ListTile(leading: const Icon(Icons.swap_calls), title: const Text('Inverter contador'), onTap: _inverter,),
          ListTile(leading: const Icon(Icons.memory), title: const Text('Memorizar contador'), onTap: _memorizar,),
          ListTile(leading: const Icon(Icons.add), title: const Text('Somar contador'), onTap: _somar,),
        ],
      ),);
  }


  void _incOuDec() {
    Navigator.of(context).pop();
    setState(() {
      if(_incrementando){
        _contador++;
      } else {
        _contador--;
      }
    });
  }

  void _zerar(){
    Navigator.of(context).pop();
    setState(() {
      _contador = 0;
      _historico.clear();
      _somaTotal = 0;
    });
  }

  void _inverter(){
    Navigator.of(context).pop();
    setState(() {
      _incrementando = !_incrementando;
    });
  }

  void _memorizar(){
    Navigator.of(context).pop();
    setState(() {
      _historico.add(_contador);
    });
  }

  void _somar(){
    Navigator.of(context).pop();
    setState(() {
      if(_historico.isEmpty){
        _historico = 0 as List<int>;
      } else {
        _somaTotal = _historico.reduce((a, b) => a + b);
      }
    });
  }
}