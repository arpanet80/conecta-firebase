import 'package:firebaseconecta/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioCard extends StatelessWidget {
  final Usuario usuario;
  const UsuarioCard(this.usuario);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/datosUsuario', arguments: usuario);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Stack(
              children: [
                if (usuario.imagen != "")
                  CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white30,
                      child: ClipRRect(
                        child: Image.network(usuario.imagen),
                        borderRadius: BorderRadius.circular(50.0),
                      ))
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usuario.nombre,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        "Edad: " + usuario.edad.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 4),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        "Activo: " + usuario.activo.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
