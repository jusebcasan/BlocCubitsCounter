import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuevo Usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de Usuario',
            onChanged: (value) {
              registerCubit.usernameChanged(value);
            },
            errorMessage: username.errorMessage,
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correo Electronico',
            onChanged: (value) {
              registerCubit.emailChanged(value);
            },
            errorMessage: email.errorMessage,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
            },
            errorMessage: password.errorMessage,
          ),
          SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            label: Text("Crear Usuario"),
            icon: Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
