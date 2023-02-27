import 'dart:async';

import 'package:Field_Monitoring/models/dashboard/dashboard.dart';
import 'package:Field_Monitoring/models/incident/incident.dart';
import 'package:Field_Monitoring/stores/incident/assigned_incident/assigned_incident_store.dart';
import 'package:Field_Monitoring/stores/incident/created_incident/created_incident_store.dart';
import 'package:Field_Monitoring/stores/incident/supervised_incident/supervised_incident_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_place_picker_mb/providers/place_provider.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import '../../constants/strings.dart';
import '../../models/incident/incident_filter.dart';
import '../../stores/language/language_store.dart';
import '../../ui/constants/colors.dart';
import 'dart:io' show Platform;

import 'incident-map-marker.dart';
import 'incident_item_details.dart';

class IncidentsMap extends StatefulWidget {

  @override
  _IncidentsMapState createState() => _IncidentsMapState();
}

class _IncidentsMapState extends State<IncidentsMap> {
  Future<PlaceProvider>? _futureProvider;
  late GoogleMapController mapController;
  final Set<Marker> markers = new Set();
   List<DashboardWidgets> userPermissions=[];
  late LanguageStore _languageStore;

  // static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);

  _IncidentsMapState();

  @override
  void initState() {
    _futureProvider = _initPlaceProvider();

    super.initState();
  }

  Future<PlaceProvider> _initPlaceProvider() async {
    final headers = await GoogleApiHeaders().getHeaders();
    final provider = PlaceProvider(
      Platform.isAndroid ? Strings.androidApiKey : Strings.iosApiKey,
      null,
      null,
      headers,
    );
    provider.sessionToken = Uuid().v4();
    provider.desiredAccuracy = LocationAccuracy.high;
    provider.setMapType(MapType.normal);

    return provider;
  }

  PlaceProvider? placeProvider;

  Widget _buildMapWithLocation() {
    return FutureBuilder(
        future: placeProvider!.updateCurrentLocation(true),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                height: 100,
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Getting location'),
                      LinearProgressIndicator(),
                    ],
                  ),
                )),
              ),
            );
          } else if (snap.connectionState == ConnectionState.done &&
              placeProvider!.currentPosition == null) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                  child: Column(
                children: [
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '${_languageStore.language.noLocationPermissionAllowed}'),
                  ),
                  TextButton(
                      onPressed: () async {
                         await placeProvider!
                            .updateCurrentLocation(true).whenComplete(() {

                           setState(()  {
                              Geolocator.getLastKnownPosition(forceAndroidLocationManager: true).then((value) {
                                placeProvider!.currentPosition=  value;
                             });

                           });
                         })

                             .onError((error, stackTrace) =>
                         Geolocator.requestPermission());

                        // if (placeProvider!.permissionGranted.toString() ==
                        //     "PermissionStatus.granted") {
                        //   setState(() {});
                        // }
                      },
                      child: Text('${_languageStore.language.givePermission}'))
                ],
              )),
            );
          } else if (snap.connectionState == ConnectionState.done &&
              placeProvider!.currentPosition != null) {
            targetLocation = LatLng(placeProvider!.currentPosition!.latitude,
                placeProvider!.currentPosition!.longitude);
            loadData(targetLocation, _currentPermission);
            return _buildMap();
          } else {
            return Center(
              child: Text('There is something wrong! ${snap.connectionState}'),
            );
          }
        });
  }

  double zoom = 15;
  late LatLng targetLocation;

  Widget _buildMap() {
    //loadData(targetLocation);
    return Material(
        child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 155,
          child: Observer(
            builder: (context) {
              return (_currentIncidentStore.loading ||
                      !_currentIncidentStore.loading)
                  ? new GoogleMap(
                      //minMaxZoomPreference: MinMaxZoomPreference(13, 17),
                      markers: getIncidentsMarkers(),
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: true,
                      // we use our own implementation that supports iOS as well, see _buildZoomButtons()
                      myLocationButtonEnabled: false,
                      compassEnabled: true,
                      mapToolbarEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: targetLocation,
                        zoom: zoom,
                      ),
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      // circles: pickArea != null && pickArea!.radius > 0 ? Set<Circle>.from([
                      //   pickArea
                      // ]) : Set<Circle>(),
                      onMapCreated: (GoogleMapController controller) {
                        placeProvider!.mapController = controller;
                        placeProvider!.setCameraPosition(null);
                        placeProvider!.pinState = PinState.Idle;

                        // When select initialPosition set to true.
                        // if (selectInitialPosition!) {
                        //   provider!.setCameraPosition(initialCameraPosition);
                        //   _searchByCameraLocation(provider);
                        // }

                        // if(onMapCreated != null) {
                        //   onMapCreated!(controller);
                        // }
                      },
                      onCameraIdle: () {
                        // if (!_incidentStore.loading)
                        //   Future.delayed(Duration(seconds: 2), () {
                        //     loadData(targetLocation);
                        //   });
                        // if (provider.isAutoCompleteSearching) {
                        //   provider.isAutoCompleteSearching = false;
                        //   provider.pinState = PinState.Idle;
                        //   provider.placeSearchingState = SearchingState.Idle;
                        //   return;
                        // }
                        //
                        // // Perform search only if the setting is to true.
                        // if (usePinPointingSearch!) {
                        //   // Search current camera location only if camera has moved (dragged) before.
                        //   if (provider.pinState == PinState.Dragging) {
                        //     // Cancel previous timer.
                        //     if (provider.debounceTimer?.isActive ?? false) {
                        //       provider.debounceTimer!.cancel();
                        //     }
                        //     provider.debounceTimer = Timer(Duration(milliseconds: debounceMilliseconds!), () {
                        //       _searchByCameraLocation(provider);
                        //     });
                        //   }
                        // }
                        //
                        // provider.pinState = PinState.Idle;
                        //
                        // if(onCameraIdle != null) {
                        //   onCameraIdle!(provider);
                        // }
                      },
                      onCameraMoveStarted: () {
                        // var ff;

                        // if(onCameraMoveStarted != null) {
                        //   onCameraMoveStarted!(provider);
                        // }
                        //
                        // provider.setPrevCameraPosition(provider.cameraPosition);
                        //
                        // // Cancel any other timer.
                        // provider.debounceTimer?.cancel();
                        //
                        // // Update state, dismiss keyboard and clear text.
                        // provider.pinState = PinState.Dragging;
                        //
                        // // Begins the search state if the hide details is enabled
                        // if (this.hidePlaceDetailsWhenDraggingPin!) {
                        //   provider.placeSearchingState = SearchingState.Searching;
                        // }
                        //
                        // onMoveStart!();
                      },
                      onCameraMove: (CameraPosition position) {
                        print('onCameraMove..............');
                        Future.delayed(
                          Duration(
                            seconds: 2,
                            milliseconds: 200,
                          ),
                          () {
                            if (!_currentIncidentStore.loading) {
                              //zoom = position.zoom;
                              loadData(targetLocation, _currentPermission);
                            }
                          },
                        );
                        // Future.delayed(Duration(seconds: 2), () {
                        //
                        //   loadData(position.target);
                        // });
                        // provider.setCameraPosition(position);
                        // if(onCameraMove != null) {
                        //   onCameraMove!(position);
                        // }
                      },
                      // gestureRecognizers make it possible to navigate the map when it's a
                      // child in a scroll view e.g ListView, SingleChildScrollView...
                      gestureRecognizers: Set()
                        ..add(Factory<EagerGestureRecognizer>(
                            () => EagerGestureRecognizer())),
                    )
                  : Container();
            },
          ),
        ),
      ],
    ));
  }

  BehaviorSubject<double> _streamController = BehaviorSubject<double>();
  BehaviorSubject<DashboardWidgets> _permissionStreamController =
      BehaviorSubject<DashboardWidgets>();
  double currentDistance = 500;
  late DashboardWidgets _currentPermission;

  List<double> distanceDropdown = [500, 1000, 1500, 2000];

  @override
  Widget build(BuildContext context) {

    _streamController.stream.listen((event) {
      currentDistance = event;
      loadData(targetLocation, _currentPermission);
    });
    _permissionStreamController.stream.listen((event) {
      _currentPermission = event;
      loadData(targetLocation, event);
    });
    return FutureBuilder<PlaceProvider>(
      future: _futureProvider,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          placeProvider = snapshot.data;
          // _moveToCurrentPosition();
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<PlaceProvider>.value(
                  value: placeProvider!),
            ],
            child: Stack(children: [
              Scaffold(
                persistentFooterButtons: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(
                          Icons.pin_drop_sharp,
                          color: CustomColor.primaryColor,
                        ),
                      ),
                      Observer(
                        builder: (context) {
                          return _currentIncidentStore.loading
                              ? Container(
                                  child: Text('Loading...'),
                                )
                              : StreamBuilder<double>(
                                  stream: _streamController.stream,
                                  builder: (context, snapshot) {
                                    return DropdownButton<double>(
                                        //icon: Icon(Icons.pin_drop_sharp),
                                        // dropdownColor: CustomColor.thirdColor,
                                        value: currentDistance,
                                        items: distanceDropdown
                                            .map((distance) =>
                                                DropdownMenuItem<double>(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      if (currentDistance ==
                                                          distance) return;
                                                      _streamController
                                                          .add(distance);
                                                    },
                                                    child: Text(
                                                      '${distance.round()} Meter',
                                                      style: TextStyle(
                                                        color: CustomColor
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  value: distance,
                                                ))
                                            .toList(),
                                        onChanged: (number) {});
                                  },
                                );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Observer(
                          builder: (context) {
                            return _currentIncidentStore.loading
                                ? Container()
                                : Text(
                                    '${_currentIncidentStore.incidentList == null ? "0" : _currentIncidentStore.incidentList!.incidents!.length.toString()} ${_languageStore.language.incident}');
                          },
                        ),
                      ),
                      Observer(
                        builder: (context) {
                          print("user permissions ${userPermissions}");
                          return userPermissions.length <= 1
                              ? Container()
                              : StreamBuilder<DashboardWidgets>(
                                  stream: _permissionStreamController,
                                  builder: (context, snapshot) {
                                    return DropdownButton<DashboardWidgets>(
                                        //icon: Icon(Icons.pin_drop_sharp),
                                        // dropdownColor: CustomColor.thirdColor,
                                        value: _currentPermission,
                                        items: userPermissions
                                            .map((permission) =>
                                                DropdownMenuItem<
                                                    DashboardWidgets>(
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      permission.name,
                                                      style: TextStyle(
                                                        color: CustomColor
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  value: permission,
                                                ))
                                            .toList(),
                                        onChanged: (permission) {
                                          if (permission == _currentPermission)
                                            return;
                                          _permissionStreamController
                                              .add(permission!);
                                        });
                                  },
                                );
                        },
                      ),
                    ],
                  )
                ],
                key: ValueKey<int>(placeProvider.hashCode),
                resizeToAvoidBottomInset: true,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  actions: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              loadData(targetLocation, _currentPermission);
                            },
                            child: Text('Refresh')),
                        //TextButton(onPressed: () {}, child: Text('Load More')),
                      ],
                    ),
                  ],
                  // key: appBarKey,
                  automaticallyImplyLeading: false,
                  iconTheme: Theme.of(context).iconTheme,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  titleSpacing: 0.0,
                  title: Observer(
                    builder: (context) {
                      return _currentIncidentStore.loading
                          ? Container(
                              height: 70,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Refreshing..',
                                  style: TextStyle(
                                    color: CustomColor.primaryColor,
                                  ),
                                ),
                              )),
                            )
                          : Container();
                    },
                  ),
                ),
                body: _buildMapWithLocation(),
              ),

              // _buildIntroModal(context),
            ]),
          );
        }

        final children = <Widget>[];
        if (snapshot.hasError) {
          children.addAll([
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ]);
        } else {
          children.add(Text('Getting place...'));
        }

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("خريطة بلاغاتي"),
    //       backgroundColor: CustomColor.primaryColor,
    //     ),
    //     body: GoogleMap(
    //       markers: getmarkers(showLocation),
    //       zoomGesturesEnabled: true,
    //       zoomControlsEnabled: false,
    //       // we use our own implementation that supports iOS as well, see _buildZoomButtons()
    //       myLocationButtonEnabled: false,
    //       compassEnabled: false,
    //       mapToolbarEnabled: false,
    //       initialCameraPosition: CameraPosition(
    //         target: showLocation,
    //         zoom: 10.0,
    //       ),
    //       mapType: MapType.normal,
    //       myLocationEnabled: true,
    //       // circles: pickArea != null && pickArea!.radius > 0 ? Set<Circle>.from([
    //       //   pickArea
    //       // ]) : Set<Circle>(),
    //       onMapCreated: (GoogleMapController controller) {
    //         // provider.mapController = controller;
    //         // provider.setCameraPosition(null);
    //         // provider.pinState = PinState.Idle;
    //         //
    //         // // When select initialPosition set to true.
    //         // if (selectInitialPosition!) {
    //         //   provider.setCameraPosition(initialCameraPosition);
    //         //   _searchByCameraLocation(provider);
    //         // }
    //         //
    //         // if(onMapCreated != null) {
    //         //   onMapCreated!(controller);
    //         // }
    //       },
    //       onCameraIdle: () {
    //         // if (provider.isAutoCompleteSearching) {
    //         //   provider.isAutoCompleteSearching = false;
    //         //   provider.pinState = PinState.Idle;
    //         //   provider.placeSearchingState = SearchingState.Idle;
    //         //   return;
    //         // }
    //         //
    //         // // Perform search only if the setting is to true.
    //         // if (usePinPointingSearch!) {
    //         //   // Search current camera location only if camera has moved (dragged) before.
    //         //   if (provider.pinState == PinState.Dragging) {
    //         //     // Cancel previous timer.
    //         //     if (provider.debounceTimer?.isActive ?? false) {
    //         //       provider.debounceTimer!.cancel();
    //         //     }
    //         //     provider.debounceTimer = Timer(Duration(milliseconds: debounceMilliseconds!), () {
    //         //       _searchByCameraLocation(provider);
    //         //     });
    //         //   }
    //         // }
    //         //
    //         // provider.pinState = PinState.Idle;
    //         //
    //         // if(onCameraIdle != null) {
    //         //   onCameraIdle!(provider);
    //         // }
    //       },
    //       onCameraMoveStarted: () {
    //         // if(onCameraMoveStarted != null) {
    //         //   onCameraMoveStarted!(provider);
    //         // }
    //         //
    //         // provider.setPrevCameraPosition(provider.cameraPosition);
    //         //
    //         // // Cancel any other timer.
    //         // provider.debounceTimer?.cancel();
    //         //
    //         // // Update state, dismiss keyboard and clear text.
    //         // provider.pinState = PinState.Dragging;
    //         //
    //         // // Begins the search state if the hide details is enabled
    //         // if (this.hidePlaceDetailsWhenDraggingPin!) {
    //         //   provider.placeSearchingState = SearchingState.Searching;
    //         // }
    //         //
    //         // onMoveStart!();
    //       },
    //       onCameraMove: (CameraPosition position) {
    //         // provider.setCameraPosition(position);
    //         // if(onCameraMove != null) {
    //         //   onCameraMove!(position);
    //         // }
    //       },
    //       // gestureRecognizers make it possible to navigate the map when it's a
    //       // child in a scroll view e.g ListView, SingleChildScrollView...
    //       gestureRecognizers: Set()
    //         ..add(Factory<EagerGestureRecognizer>(
    //             () => EagerGestureRecognizer())),
    //     )
    //     // IncidentListMapWidget(
    //     // //  initialMapPlace: _incidentFormStore.incident.mapPlace,
    //     //   loadMapBtnPopupText: 'open map',
    //     //   loadMapBtnContainerText: 'open container',
    //     //   onPlaceChange: (placeInfo) {
    //     //     //_incidentFormStore.incident.mapPlace = placeInfo;
    //     //   },
    //     //   showMapInDialog: false,
    //     // )
    //
    //     // GoogleMap(
    //     //   //zoomGesturesEnabled: true,
    //     //   initialCameraPosition: CameraPosition(
    //     //     target: showLocation,
    //     //     zoom: 15.0,
    //     //   ),
    //     //   // markers: getmarkers(),
    //     //   // mapType: MapType.normal,
    //     //   // onMapCreated: (controller) {
    //     //   //   // setState(() {
    //     //   //   //   mapController = controller;
    //     //   //   // });
    //     //   // },
    //     // ),
    //     );
  }

  _moveToCurrentPosition() async {
    if (placeProvider!.currentPosition != null) {
      await _moveTo(placeProvider!.currentPosition!.latitude,
          placeProvider!.currentPosition!.longitude);
    }
  }

  _moveTo(double latitude, double longitude) async {
    GoogleMapController? controller = placeProvider!.mapController;
    if (controller == null) return;

    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: zoom,
        ),
      ),
    );
  }

  CreatedIncidentStore? _createdIncidentStore;

  AssignedIncidentStore? _assignedIncidentStore;

  SupervisedIncidentStore? _supervisedIncidentStore;

  dynamic _currentIncidentStore;

  @override
  void didChangeDependencies() {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    userPermissions=arguments['userPermissions'];
    print("didChangeDependencies");
    if (userPermissions.contains(DashboardWidgets.Created)) {
      print("Created");
      _createdIncidentStore = Provider.of<CreatedIncidentStore>(context);
    }
    if (userPermissions.contains(DashboardWidgets.Assigned)) {
      _assignedIncidentStore = Provider.of<AssignedIncidentStore>(context);
      print("Assigned");
    }
    if (userPermissions.contains(DashboardWidgets.Supervised)) {
      _supervisedIncidentStore = Provider.of<SupervisedIncidentStore>(context);
      print("Supervised");
    }
    _languageStore = Provider.of<LanguageStore>(context);

    _currentPermission = userPermissions.first;
    print("argments ${_currentPermission}");
    setStore(userPermissions.first);
    super.didChangeDependencies();
  }

  void loadData(LatLng initialTarget, DashboardWidgets dashboardWidget) {
    setStore(dashboardWidget);
    if (!_currentIncidentStore.loading) {
      _currentIncidentStore.getIncidents(
        incidentFilter: IncidentFilter(
            subCategoryId: null,
            categoryId: null,
            incidentId: null,
            latlng: initialTarget,
            distance: currentDistance),
      );
    }
  }

  Set<Marker> getIncidentsMarkers() {
    List<Incident>? incdeints = _currentIncidentStore.incidentList == null
        ? <Incident>[]
        : _currentIncidentStore.incidentList!.incidents;
    debugPrint("map lang ${_languageStore.locale}");
    var list = incdeints!
        .map(
          (e) => IncidentMarker(
              incident: e,
              InfoWindowOnTap: () {
                debugPrint("map id ${e.id}");

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InidentDetailsScreen(
                          incidentId: e.id,
                          incidentStore: _currentIncidentStore,
                        )));
              },
              localLanguage: _languageStore.locale),
        )
        .toList();
    markers.addAll(list);
    markers.add(Marker(
      markerId: MarkerId('currentLocation'),
      position: targetLocation,
      icon: BitmapDescriptor.defaultMarker,
    ));

    return markers;
  }

  void setStore(DashboardWidgets value) {
    switch (value) {
      case DashboardWidgets.Created:
        _currentIncidentStore = _createdIncidentStore;
        break;
      case DashboardWidgets.Assigned:
        _currentIncidentStore = _assignedIncidentStore;
        break;
      case DashboardWidgets.Supervised:
        _currentIncidentStore = _supervisedIncidentStore;
        break;
      default:
        _currentIncidentStore = null;
        break;
    }
  }
}
