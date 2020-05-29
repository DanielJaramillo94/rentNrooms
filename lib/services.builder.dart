import 'package:flutter/material.dart';

class ServicesBuilder extends StatelessWidget {
  ServicesBuilder({
    Key key,
    @required this.servicesList,
  }) : super(key: key);

  final List<String> servicesList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getServiceWidgetsList(servicesList),
      ),
    );
  }
}

IconData getServiceIcon(String service) {
  Map<String, IconData> serviceIcon = {
    'wifi': Icons.wifi,
    'aire': Icons.ac_unit,
    'parking': Icons.local_parking,
    'cocina': Icons.kitchen,
    'piscina': Icons.pool,
    'gimnasio': Icons.fitness_center,
    'televisión': Icons.personal_video,
    'desayuno': Icons.free_breakfast,
  };
  IconData defaultIcon = Icons.done;

  String serviceName = service.trim().toLowerCase();
  return (serviceIcon[serviceName] != null) ? serviceIcon[serviceName] : defaultIcon;
}

List<Widget> getServiceWidgetsList(List<String> servicesList) {
  List<ServiceElement> serviceListWidgets = new List();
  servicesList.forEach(
    (service) {
      serviceListWidgets.add(ServiceElement(
          serviceName: service, serviceIconData: getServiceIcon(service)));
    },
  );
  return serviceListWidgets;
}

class ServiceElement extends StatelessWidget {
  ServiceElement({
    Key key,
    @required this.serviceName,
    @required this.serviceIconData,
  }) : super(key: key);

  final String serviceName;
  final IconData serviceIconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(30.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                serviceIconData,
                color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
            ),
          ),
        ),
        Text(
          serviceName,
          style: TextStyle(
              fontSize: 10,
              fontFamily: 'Cocogoose',
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(0, 0, 0, 0.6)),
        )
      ],
    );
  }
}
