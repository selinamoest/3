import 'package:flutter/material.dart';
import 'package:ima/home_screen.dart';

void main() {
  runApp(UserInfoApp());
}

class UserInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gebe hier deine Daten ein',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        "/homepage": (context) => HomeScreen(),
      },
    );
  }
}

class UserInfoForm extends StatefulWidget {
  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte Passwort eingeben';
    }
    if (value.length < 8) {
      return 'Passwort muss mindestens 8 Zeichen lang sein';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Passwort muss mindestens eine Zahl enthalten';
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Passwort muss mindestens ein Sonderzeichen enthalten';
    }
    return null;
  }

  void _sendPasswordResetEmail() {
    // Dummy function to simulate sending an email
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Eine E-Mail zum Zurücksetzen des Passworts wurde gesendet.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte Email-Adresse eingeben';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Bitte gültige Email-Adresse eingeben';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Passwort'),
                obscureText: true,
                validator: _validatePassword,
              ),
              SizedBox(height: 8),
              Text(
                'Passwort muss mindestens 8 Zeichen lang sein, eine Zahl und ein Sonderzeichen enthalten.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Daten werden verarbeitet')),
                    );
                  }
                },
                child: Text('OK'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text('Kein Konto?'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: _sendPasswordResetEmail,
                child: Text('Passwort vergessen?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _licenseNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte Passwort eingeben';
    }
    if (value.length < 8) {
      return 'Passwort muss mindestens 8 Zeichen lang sein';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Passwort muss mindestens eine Zahl enthalten';
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Passwort muss mindestens ein Sonderzeichen enthalten';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte Passwort wiederholen';
    }
    if (value != _passwordController.text) {
      return 'Passwörter stimmen nicht überein';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrieren'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte Vor- und Nachname eingeben';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _licenseNumberController,
                decoration: InputDecoration(labelText: 'Führerschein Nummer'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte Führerschein Nummer eingeben';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte Email-Adresse eingeben';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Bitte gültige Email-Adresse eingeben';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Telefonnummer'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte Telefonnummer eingeben';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Passwort'),
                obscureText: true,
                validator: _validatePassword,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Passwort wiederholen'),
                obscureText: true,
                validator: _validateConfirmPassword,
              ),
              SizedBox(height: 8),
              Text(
                'Passwort muss mindestens 8 Zeichen lang sein, eine Zahl und ein Sonderzeichen enthalten.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registrierungsdaten werden verarbeitet')),
                    );
                  }
                },
                child: Text('Registrieren'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
