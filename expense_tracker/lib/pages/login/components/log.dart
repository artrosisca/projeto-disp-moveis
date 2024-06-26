import 'package:expense_tracker/pages/esqueci_senha/esqueci_senha.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:expense_tracker/pages/login/components/log_error.dart';
import 'body.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final gformKey = GlobalKey<FormState>();
  final List<String> errors = [];
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: gformKey,
      child: Column(
        children: [
          insertEmail(),
          const SizedBox(height: 25,),
          insertPassword(),
          const SizedBox(height: 20,),
          Error(errors: errors),
          Row(
            children: [
              Checkbox(
                value: remember, 
                activeColor: const Color.fromARGB(255, 0, 188, 201),
                onChanged: (Value) {
                  setState(() {
                    remember = Value!;
                  });
                },
              ),
              const Text("Manter login"),
              const Spacer(),
              GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EsqueciSenha(), // Substitua por sua página de esqueceu a senha
      ),
    );
  },
  child: const Text(
    "Esqueceu a senha?",
    style: TextStyle(
      decoration: TextDecoration.underline,
    ),
  ),
)
            ],
          ),
          buttonLogin(context),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  TextFormField insertPassword() {
    return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Senha",
            hintText: "Digite sua senha.",
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: const BorderSide(color: Colors.blue),
              gapPadding: 10,
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(LineAwesomeIcons.lock, size: 30,
              ),
            ),
          ),
        );
  }

  TextFormField insertEmail() {
    return TextFormField(
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if(value == null || value.isEmpty) {
            errors.add("Por favor, digite seu email");
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Digite seu email.",
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: const BorderSide(color: Colors.blue),
              gapPadding: 10,
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(LineAwesomeIcons.envelope, size: 30,
              ),
            ),
          ),
        );
  }
}