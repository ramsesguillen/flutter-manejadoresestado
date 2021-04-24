import 'package:bloc/bloc.dart';
import 'package:manejadores_estado/models/usuarios.dart';
import 'package:meta/meta.dart';

part 'usuario_state.dart';


/// El que se encarga de hacer peticiones, el que cambia el estado
class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());


  void seleccionarUsuario( Usuario user ) {
    emit( UsuarioActivo(user) );
    /// al emitir se cambia a un nuevo estado - Se emite un nuevo estado
    /// Este estado es que tiene las propiedes que utilizares mas adelante
  }

  void cambiarEdad( int edad ) {
    final currentState = state;
    if( currentState is UsuarioActivo ) {
      final newUser = currentState.usuario.copyWith( edad: edad );
      emit( UsuarioActivo( newUser ) );
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if( currentState is UsuarioActivo ) {
      final List<String> profesiones = [
        ...currentState.usuario.profesiones,
        'Profesión: ${ currentState.usuario.profesiones.length + 1 }'
      ];
      final newUser = currentState.usuario.copyWith( profesiones:  profesiones);
      emit( UsuarioActivo( newUser ) );
    }
  }

  void borrarUsuario() {
    emit( UsuarioInitial() );
  }
}
