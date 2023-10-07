import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teste_out/src/core/styles/font_styles.dart';
import 'package:teste_out/src/core/ui/constants/constants.dart';
import 'package:teste_out/src/core/ui/widgets/loading_widget.dart';
import 'package:teste_out/src/features/profile/edit_about_page.dart';
import 'package:teste_out/src/features/profile/profile_controller.dart';

import '../../../entities/about.dart';
import '../widgets/create_building_widget.dart';
import '../widgets/service_time_widget.dart';

class AboutTab extends StatefulWidget {
  final ProfileController controller;

  const AboutTab({
    super.key,
    required this.controller,
  });

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  var latitude = 0.0;
  var longitude = 0.0;
  Set<Marker> markers = <Marker>{};
  bool isLoading = true;

  createMarker() {
    final Marker marker = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: widget.controller.profile!.name,
        snippet: widget.controller.profile!.about.location,
      ),
    );
    setState(() {
      markers.add(marker);
    });
  }

  Future<void> getAddressCoordinates() async {
    if (widget.controller.profile?.about.location != null &&
        widget.controller.profile!.about.location.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(
          widget.controller.profile!.about.location,
        );
        if (locations.isNotEmpty) {
          latitude = locations.first.latitude;
          longitude = locations.first.longitude;
        } else {
          throw Exception("Não foi possível obter as coordenadas do endereço");
        }
      } catch (e) {
        throw Exception(e);
      }
    } else {
      throw Exception("O endereço não foi informado");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getAddressCoordinates().then((value) => createMarker());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final About about = widget.controller.profile!.about;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 24,
          right: 24,
          left: 24,
          top: 12,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                onPressed: () async {
                  var newProfile = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditAboutPage(
                        controller: widget.controller,
                      ),
                    ),
                  );
                  widget.controller.editProfile(newProfile);
                },
                child: Text(
                  'Editar seção sobre',
                  style: TextStyles.instance.textButtonLabel1,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              ServiceTimeWidget(
                controller: widget.controller,
              ),
              const SizedBox(
                height: 32,
              ),
              CreateBuildingWidget(
                controller: widget.controller,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Localização',
                style: TextStyles.instance.textSubtitle3,
              ),
              const SizedBox(
                height: 24,
              ),
              FittedBox(
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: ColorsConstants.purple,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(about.location)
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 142,
                child: isLoading
                    ? const ShowLoading()
                    : GoogleMap(
                        zoomControlsEnabled: false,
                        zoomGesturesEnabled: false,
                        markers: markers,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            latitude,
                            longitude,
                          ),
                          zoom: 16,
                        ),
                      ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Contato',
                style: TextStyles.instance.textSubtitle3,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Image.asset('assets/icons/whats.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(widget.controller.profile!.about.phone)
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Image.asset('assets/icons/email.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(widget.controller.profile!.about.email)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
