///[]
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estado/bloc/usuario/usuario_cubit.dart';
import 'package:manejadores_estado/models/usuarios.dart';

///[]


///[]
class Pagina2Page extends StatelessWidget {

///[]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer usuario', style: TextStyle( color: Colors.white) ),
              color: Colors.blue,
              onPressed: () {
                final user = new Usuario(
                  nombre: 'Laura',
                  edad: 23,
                  profesiones: ['Dancer', 'Model']
                );
                context.read<UsuarioCubit>().seleccionarUsuario(user);
              },
            ),

            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle( color: Colors.white) ),
              color: Colors.blue,
              onPressed: () {
                context.read<UsuarioCubit>().cambiarEdad(18);
              },
            ),

            MaterialButton(
              child: Text('Añadir Profesión', style: TextStyle( color: Colors.white) ),
              color: Colors.blue,
              onPressed: () {
                context.read<UsuarioCubit>().agregarProfesion();
              },
            ),
          ],
        )
      ),
    );
  }
}
