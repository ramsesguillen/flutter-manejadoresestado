///[]
import 'package:flutter/material.dart';


///[]


///[]
class Pagina2Page extends StatelessWidget {

///[]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer usuario', style: TextStyle( color: Colors.white) ),
              color: Colors.blue,
              onPressed: () {},
            ),

            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle( color: Colors.white) ),
              color: Colors.blue,
              onPressed: () {},
            ),

            MaterialButton(
              child: Text('Añadir Profesión', style: TextStyle( color: Colors.white) ),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        )
      ),
    );
  }
}
