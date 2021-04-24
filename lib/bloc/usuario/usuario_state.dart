part of 'usuario_cubit.dart';



/// Loss posibles estado
@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {

  // propiedades del estado inicial
  final existeUsuario = false;


  // @override
  // String toString() {
  //   return 'UsuarioInicial: existeUsuario: false';
  // }
}


class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}