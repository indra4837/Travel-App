import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  get onTap => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text("Indra"),
        accountEmail: Text("123@gmail.com"),
        currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://instagram.fsin9-2.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s640x640/87489405_193012298680233_343163006116085058_n.jpg?_nc_ht=instagram.fsin9-2.fna.fbcdn.net&_nc_cat=109&_nc_ohc=Qz1hOFpe2N8AX_LYcz2&oh=1f4e45b2778db7a4ac64f0d92739496c&oe=5F15ADEA")),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text("Indra"),
        subtitle: Text("Mechanical Engineer"),
        trailing: IconButton(
          icon: Icon(Icons.edit,),
          onPressed: (){}, 
        ),
      ),
      ListTile(
        leading: Icon(Icons.email),
        title: Text("Email"),
        subtitle: Text("123@gmail.com"),
        trailing: IconButton(
          icon: Icon(Icons.edit,),
          onPressed: (){}, 
        ),
      )
    ]));
  }
}
