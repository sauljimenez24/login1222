import 'package:flutter/material.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({Key? key}) : super(key: key);

  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Bienvenido, $email!")),
      );
    }
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  void _forgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text("Función de recuperación de contraseña no implementada")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar Sesión"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              height: 100,
              child: Image.asset('assets/logo.png', fit: BoxFit.contain),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration:
                          InputDecoration(labelText: "Correo Electrónico"),
                      validator: (value) => value!.isEmpty
                          ? "Ingrese su correo electrónico"
                          : null,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: "Contraseña"),
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? "Ingrese su contraseña" : null,
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _forgotPassword,
                        child: Text("¿Olvidaste tu contraseña?"),
                      ),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                        onPressed: _login, child: Text("Iniciar Sesión")),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _navigateToRegister,
              child: Text("¿Eres nuevo?"),
            ),
            ElevatedButton(
              onPressed: _navigateToRegister,
              child: Text("Crear Cuenta"),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: Center(
        child: Text("Pantalla de Registro"),
      ),
    );
  }
}
