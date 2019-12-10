import "package:flutter/material.dart";


void main() {
  runApp(MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

TextEditingController weightController = TextEditingController();
TextEditingController heightController = TextEditingController();

String _infoText = "Informe os Dados";





class _HomeState extends State<Home> {

  void resetFields(){

    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe os Dados";
    });

  }

  void _calculate(){

    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double imc = (weight / ((height/100) * 2));

    setState(() {

      if(imc < 18.5){
        _infoText = "Abaixo do peso ${imc.toStringAsPrecision(4)}";
      }else if(imc >= 18.5 && imc < 24.9){
        _infoText = "Peso Ideal ${imc.toStringAsPrecision(4)}";
      }else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente Acima do Peso ${imc.toStringAsPrecision(4)}";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau I ${imc.toStringAsPrecision(4)}";
      }else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade Grau II ${imc.toStringAsPrecision(4)}";
      }else if(imc >= 40){
        _infoText = "Obesidade Grau III ${imc.toStringAsPrecision(4)}";
      }
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: resetFields)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.perm_identity,
              size: 125.0,
              color: Colors.deepPurpleAccent,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: ("Peso (Kg)"),
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 25,
              ),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: ("Altura (Cm)"),
                labelStyle: TextStyle(color: Colors.deepPurpleAccent),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 25,
              ),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calculate,
                  child: Text("Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  textColor: Colors.white,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
