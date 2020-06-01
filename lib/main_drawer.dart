import 'package:flutter/material.dart';

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
          ListTile(
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
          )
        ],
      ),
    );
  }
}
