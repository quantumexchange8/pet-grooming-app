
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/petOrganizationLocation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconly/iconly.dart';
import 'package:latlong2/latlong.dart' as ll;

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  double ? radius;

  List<DropdownMenuItem<double>> _buildDropDownRadius(BuildContext context){
    return [
      DropdownMenuItem(
        value: 1000,
        child: Text('1km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 2000,
        child: Text('2km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 3000,
        child: Text('3km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 4000,
        child: Text('4km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 5000,
        child: Text('5km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 6000,
        child: Text('6km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 7000,
        child: Text('7km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 8000,
        child: Text('8km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 9000,
        child: Text('9km', style: bodyXLSemibold),
      ),
      DropdownMenuItem(
        value: 10000,
        child: Text('10km', style: bodyXLSemibold),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo/paw_small.png'),
        title: Text(context.tr('Maps'), style: heading4Bold),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(IconlyLight.search),
          ),
        ],
      ),

      body: Stack(
        children: [

          //map
          FlutterMap(
            options: const MapOptions(
              initialZoom: 13,
              initialCenter: ll.LatLng(3.140853, 101.693207), //eg: kl //need to access user's location
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),

              MarkerLayer(
                markers: _buildCustomMarkers(),
                /* [
                  Marker(
                    point: const ll.LatLng(3.140853, 101.693207), 
                    child: Icon(IconlyBold.location, color: primaryOrange.shade900, size: 50),
                  ),
                ], */
              ),

              CircleLayer(
                circles: [
                  CircleMarker(
                    point: const ll.LatLng(3.140853, 101.693207), //need to based on user location
                    radius: radius ?? 0, 
                    color: primaryOrange.shade900.withOpacity(0.15),
                    borderColor: primaryOrange.shade900,
                    borderStrokeWidth: 2.5,
                    useRadiusInMeter: true,
                  ),
                ],
              ),
              
            ],
          ),
          
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.background,
                  width: 12,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<double>(
                  value: radius,
                  hint: Row(
                    children: [
                      Icon(IconlyLight.location, color: Theme.of(context).colorScheme.primary, size: 17),
                      const SizedBox(width: 10),
                      Text(context.tr('Radius Area'), style: bodyXLRegular.copyWith(color: grey.shade500)),
                    ],
                  ),

                  icon: const Icon(IconlyLight.arrow_down_2, size: 18),
                  items: _buildDropDownRadius(context), 
                  selectedItemBuilder: (BuildContext context){
                    return _buildDropDownRadius(context).map((e){
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(IconlyLight.location, color: Theme.of(context).colorScheme.primary, size: 17),
                            const SizedBox(width: 10),
                            Text(
                                '${e.value!~/1000}km', 
                                style: bodyXLRegular.copyWith(color: grey.shade500),
                            ),
                          ],
                        ),
                      );
                    }).toList();
                  },
                  onChanged: (value){
                    setState(() {
                      radius = value;
                    });
                  },
                ),
              ),   
            ),
          ),
          

        ],
      ),

    );
  }

//pins design

List<Marker> _buildCustomMarkers() {
  return locationPinData.map((location) {
    return Marker(
      point: ll.LatLng(location.latitude, location.longtitude),
      width: 60, height: 60,
      child: Container(
        width: 150,
        height: 150, 
        padding: const EdgeInsets.only(bottom: 9, right: 13, left: 13),
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/pin_logo.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        child: Container(
          width: 15, height: 15,
          decoration: BoxDecoration( 
            shape: BoxShape.circle,
            image: DecorationImage(
              image: location.imageUrlOnMap != null
                     ? AssetImage(location.imageUrlOnMap!):const AssetImage('assets/logo/no_image.png'),
            ),
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),),
          /* child: location.imageUrlOnMap != null
                  ? Image.asset(location.imageUrlOnMap!,height: 24,width: 24,)
                  :Image.asset('assets/logo/no_image.png',height: 24,width: 24, fit: BoxFit.cover), */
        ),
      ),
      
    );
  }).toList();
}



}