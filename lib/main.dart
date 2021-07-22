import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.lightGreen[200]),

      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

Future<DataModel> submitData() {
  
}





var _scaffoldKey = new GlobalKey<ScaffoldState>();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: Colors.green,
      body: Center(
        child: RaisedButton(
          child: Text('Add Entries to admin'),
          onPressed: () async {
            List<MedEntry> meds = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SOF(),
              ),
            );
            if (meds != null) meds.forEach(print);
          },
        ),
      ),

    );
  }
}



class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var nameTECs = <TextEditingController>[];
  var compTECs = <TextEditingController>[];
  var usageTECs = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var nameController = TextEditingController();
    var compController = TextEditingController();
    var usageController = TextEditingController();
    nameTECs.add(nameController);
    compTECs.add(compController);
    usageTECs.add(usageController);
    return Card(
      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Text('Medicine ${cards.length + 1}'),
          TextField(

              controller: nameController,
              decoration: InputDecoration(labelText: 'Medicine Name')),
         // SizedBox(height:15),
          TextField(

              style: TextStyle(

                  fontSize: 15.0,
                  height: 5.0,

                  color: Colors.black
              ),
              controller: compController,
              decoration: InputDecoration(labelText: 'Composition')),
          //SizedBox(height:15),
          TextField(

            style: TextStyle(
                fontSize: 20.0,
                height: 5.0,
                color: Colors.black
            ),

              controller: usageController,
              decoration: InputDecoration(labelText: 'Usage')),
      //SizedBox(height: 16,),

        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  /*_onDone() {
    List<MedEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTECs[i].text;
      var comp = compTECs[i].text;
      var usage = usageTECs[i].text;
      entries.add(MedEntry(name, comp, usage));
    }
    Navigator.pop(context, entries);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Admin Portal-Genera'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Text('Add New Medicine'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.done), onPressed: (){_showDialog();}, backgroundColor: Colors.green),

    );
  }
}
void _showDialog() {
  // flutter defined function
  showDialog(
    context: _scaffoldKey.currentContext,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Medicine entry status:",textAlign: TextAlign.center,style: TextStyle(color: Colors.green[800])),
        content: new Text("MEDICINES SUCCESSFULLY SAVED INTO DATABASE!",textAlign: TextAlign.center),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("OK",style: TextStyle(color: Colors.green[800])),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}





class MedEntry {
  final String name;
  final String comp;
  final String usage;

  MedEntry(this.name, this.comp, this.usage);
  @override
  String toString() {
    return 'Medicine: name= $name, composition= $comp, usage= $usage';
  }
}