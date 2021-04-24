///[]
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estado/bloc/usuario/usuario_cubit.dart';
import 'package:manejadores_estado/models/usuarios.dart';


///[]


///[]
class Pagina1Page extends StatelessWidget {

///[]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            },
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) {

      switch ( state.runtimeType ) {
        case UsuarioInitial:
          return Center(child: Text('No hay usuario seleccionado'));
          break;
        case UsuarioActivo:
          return InformacionUsuario( ( state as UsuarioActivo ).usuario );
          break;
        default:
          return Center(child: Text('Estado no reconocido'));
      }
      // if ( state is UsuarioInitial ) {
      //   return Center(child: Text('No hay usuario seleccionado'));
      // } else if ( state is UsuarioActivo ) {
      //   return InformacionUsuario( state.usuario );
      // } else {
      //   return Center(child: Text('Estado no reconocido'));
      // }
    });
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario( this.usuario );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile( title: Text('Nombre: ${ usuario.nombre }')),
          ListTile( title: Text('Edad: ${ usuario.edad }')),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ...usuario.profesiones.map(( profesion ) =>
            ListTile( title: Text(profesion) ),
          )
        ],
      )
    );
  }
}
