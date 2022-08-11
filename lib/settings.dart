import 'package:flutter/material.dart';
import 'package:kiosk_consumer_app/services/loginservice.dart';
import 'package:kiosk_consumer_app/widgets/pageheadersection.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController urlController = TextEditingController(text: 'http://');
  TextEditingController appIdController = TextEditingController();
  TextEditingController appSecretController = TextEditingController();
  TextEditingController terminalController = TextEditingController();
  ReusableObjectClass reusableObjectClass = ReusableObjectClass();

  @override
  void initState(){
    super.initState();
    loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 55.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(MediaQuery.of(context).size.width > 700 ? "assets/minttablet.png" : "assets/mintphone.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80.0,),
                    Image.asset("assets/aaaa.png", height: 150, width: 300, fit: BoxFit.fitWidth,),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.043),
                    TextFormField(
                      controller: urlController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid Url';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        labelText: 'Url',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                    TextFormField(
                      controller: appIdController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid APP ID';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'APP ID',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                    TextFormField(
                      controller: appSecretController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid APP Secret';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'APP Secret',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                    TextFormField(
                      controller: terminalController,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid Terminal';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Terminal',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Container(
                      height: 50.0,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey ,
                              blurRadius: 2.0,
                              offset: Offset(0.0,0.0)
                          ),
                        ],
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveSettings();
                            Navigator.pop(context);
                            reusableObjectClass.showToast(context,Icons.check,Colors.green,"Data Saved..!");
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('Data Saved..!')),);

                          }
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(  colors: [
                                Color(int.parse('FF01941b',radix: 16)),
                                Color(int.parse('FF03b332',radix: 16)),
                              ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(22.0)
                          ),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "SAVE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80.0,),
                  ],
                ),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }

  saveSettings() {
    SettingsData data = SettingsData(
        url : urlController.text,
        appID: appIdController.text,
        appSecret: appSecretController.text,
        terminal:terminalController.text
    );
    data.save();
  }
  loadSettings() async {
    SettingsData savedData = SettingsData();
    await savedData.load();
    setState(() {
      urlController.text = savedData.url;
      appIdController.text = savedData.appID;
      appSecretController.text = savedData.appSecret;
      terminalController.text = savedData.terminal;
    });
  }
}