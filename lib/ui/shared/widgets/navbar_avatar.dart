import 'package:flutter/material.dart';

class NavBarAvatar extends StatelessWidget {
  const NavBarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 30,
        height: 30,
        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8dY5cebG_qx0I2oRlqdDv51ZcfQkJbjwPBw&usqp=CAU'),
      ),
    );
  }
}