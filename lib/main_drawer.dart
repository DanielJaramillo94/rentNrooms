import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/auth.service.dart';
import 'package:rent_n_rooms/models/user.model.dart';

class MainDrawer extends StatelessWidget {
  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  final urlProfileImg =
      'https://pm1.narvii.com/6585/aaacc591c202729ea383c83da205c283a4a8b960_hq.jpg';
  final email = 'rentnrooms@gmail.com';
  final name = 'Fulatino Rent Rooms';

  @override
  Widget build(BuildContext context) {
  final authService = Provider.of<AuthService>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top:30, right: 10, left: 10, bottom: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [mainColorLighter, mainColor],
              ),
            ),
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(urlProfileImg),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(email,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'Cocogoose',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              Text(name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: 'Cocogoose',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
          ListTile(
            leading: Icon(
              Icons.book,
              size: 25,
            ),
            title: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/bookings_list');
              },
              child: Text('Mis reservas',
                  style: TextStyle(
                    fontFamily: 'Cocogoose',
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(77, 77, 77, 1),
                  )),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 25,
            ),
            title: Text('Cuenta',
                style: TextStyle(
                  fontFamily: 'Cocogoose',
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: Color.fromRGBO(77, 77, 77, 1),
                )),
          ),
          InkWell(
            onTap: () async {
              await authService.signInWithGoogle();
            },
            child: ListTile(
              leading: Icon(
                Icons.whatshot,
                size: 25,
              ),
              title: Text('Google Login',
                  style: TextStyle(
                    fontFamily: 'Cocogoose',
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(77, 77, 77, 1),
                  )),
            ),
          ),
          InkWell(
            onTap: () async {
              await authService.signOut();
            },
            child: ListTile(
              leading: Icon(
                Icons.arrow_back,
                size: 25,
              ),
              title: Text('Cerrar sesión',
                  style: TextStyle(
                    fontFamily: 'Cocogoose',
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(77, 77, 77, 1),
                  )),
            ),
          ),
          InkWell(
            onTap: () {
            },
            child: ListTile(
              leading: Icon(
                Icons.accessibility_new,
                size: 25,
              ),
              title: Text('Change name',
                  style: TextStyle(
                    fontFamily: 'Cocogoose',
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(77, 77, 77, 1),
                  )),
            ),
          ),
          UserInfo()
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User>(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.active) { //string is active and has already receaved the first event
          final user = snapshot.data;
          return user != null ?
          InkWell(
            onTap: () {
            },
            child: ListTile(
              leading: Icon(
                Icons.accessibility_new,
                size: 25,
              ),
              title: Text(user.getName(),
                  style: TextStyle(
                    fontFamily: 'Cocogoose',
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(77, 77, 77, 1),
                  )),
            ),
          )
          :
          InkWell(
            onTap: () {
            },
            child: ListTile(
              leading: Icon(
                Icons.accessibility_new,
                size: 25,
              ),
              title: Text('No name yet',
                  style: TextStyle(
                    fontFamily: 'Cocogoose',
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(77, 77, 77, 1),
                  )),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },);
  }
}