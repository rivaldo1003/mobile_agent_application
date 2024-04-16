import 'dart:async';

import 'package:elderselettricomobile/domain/model/direction_response.dart';
import 'package:elderselettricomobile/domain/model/place_category.dart';
import 'package:elderselettricomobile/domain/model/trip.dart';
import 'package:elderselettricomobile/presentation/maps/search_destination_page.dart';
import 'package:elderselettricomobile/presentation/maps/viewmodels/maps_viewmodel.dart';
import 'package:elderselettricomobile/presentation/maps/widgets/map_main_bottom_sheet.dart';
import 'package:elderselettricomobile/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../common/prototype_height.dart';
import 'viewmodels/estimated_trip_viewmodel.dart';
import 'viewmodels/search_location_viewmodel.dart';
import 'widgets/estimated_trip_bottom_sheet.dart';
import 'widgets/place_category_tile.dart';
import 'widgets/your_trip_bottom_sheet.dart';

class MapScreen extends StatefulWidget {
  static CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-7.312224648482071, 112.68627575347656),
    zoom: 14,
  );

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  var _mapPadding = EdgeInsets.zero;
  Completer<GoogleMapController> _mapController = Completer();

  PersistentBottomSheetController? _estimatedTripcontroller;
  PersistentBottomSheetController? _myTripController;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<MapsViewModel>();
    _setupCurrentLocation(viewModel);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setBottomSheetState(viewModel);
    });
  }

  void dispose() {
    super.dispose();
    mapController?.dispose();
  }

  void _setBottomSheetState(MapsViewModel viewModel) {
    if (viewModel.currentTrip != null && !viewModel.tripStart) {
      _showEstimatedTripBottomSheet();
    }
    if (viewModel.tripStart) {
      if (viewModel.currentTrip != null && viewModel.currentRoutes != null) {
        _moveCameraToDestination(
            viewModel.currentTrip!, viewModel.currentRoutes!);
      }
      _showMyTripBottomSheet();
    }
  }

  void _setupCurrentLocation(MapsViewModel viewModel) {
    viewModel.setupCurrentLocation().then((position) async {
      if (viewModel.tripStart) return;
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14,
      );
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  GoogleMapController? mapController;

  Future<void> onMapCreated(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/json/map_style.json');
    _mapController.complete(controller);
    controller.setMapStyle(value);
    _mapPadding = EdgeInsets.only(bottom: 180, top: 16);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarBrightness: Brightness.dark));

    final viewModel = context.watch<MapsViewModel>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: darkGrey900,
      body: WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: [
            GoogleMap(
              padding: _mapPadding,
              myLocationButtonEnabled: false,
              initialCameraPosition: MapScreen._initialCameraPosition,
              mapType: MapType.normal,
              markers: viewModel.markers,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              polylines: viewModel.polylines,
              onMapCreated: onMapCreated,
            ),
            !viewModel.tripStart
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _goToMyPlace,
                          child: Container(
                            margin: EdgeInsets.only(right: 16, bottom: 32),
                            padding: EdgeInsets.all(14),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: SvgPicture.asset('assets/icons/target.svg'),
                          ),
                        ),
                        _buildPlaceCategories(),
                        SizedBox(height: 8),
                        _buildInitialBottomSheet(),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future<void> _goToMyPlace({double zoom = 16}) async {
    final currentPosition = context.read<MapsViewModel>().currentPosition;
    if (currentPosition == null) return;
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            currentPosition.latitude,
            currentPosition.longitude,
          ),
          zoom: zoom,
        ),
      ),
    );
  }

  List<PlaceCategory> _placeCategories = [
    PlaceCategory(
        label: 'Elders Elettrico workshop', iconPath: 'wrench_screwdriver.svg'),
    PlaceCategory(label: 'Charging station', iconPath: 'circle_lightning.svg'),
  ];

  Widget _buildPlaceCategories() {
    return PrototypeHeight(
      prototype: PlaceCategoryTile(
          PlaceCategory(label: 'A', iconPath: 'apple.svg'), 0),
      child: ListView.builder(
        itemCount: _placeCategories.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = _placeCategories[index];
          return PlaceCategoryTile(item, index);
        },
      ),
    );
  }

  void _showEstimatedTripBottomSheet() {
    _estimatedTripcontroller = _scaffoldKey.currentState?.showBottomSheet<void>(
      (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => EstimatedTripViewModel(
              currentTrip: context.read<MapsViewModel>().currentTrip!),
          child: EstimatedTripBottomSheet(
            onClose: () {
              context.read<MapsViewModel>().currentTrip = null;
              _estimatedTripcontroller?.close();
            },
            onStartTrip: _onStartTrip,
          ),
        );
      },
      backgroundColor: Colors.transparent,
      enableDrag: false,
    );
  }

  Widget _buildInitialBottomSheet() {
    return MapMainBottomSheet(onSearch: () async {
      Trip? trip = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => SearchLocationViewModel(),
            child: SearchDestinationPage(),
          ),
        ),
      );
      if (trip != null) {
        context.read<MapsViewModel>().currentTrip = trip;
        _showEstimatedTripBottomSheet();
      }
    });
  }

  Future<void> _onStartTrip(Trip trip, DirectionRoutes? routes) async {
    _estimatedTripcontroller?.close();
    if (routes == null) return;
    _showMyTripBottomSheet();
    _moveCameraToDestination(trip, routes);
    context.read<MapsViewModel>().onStartTrip(trip, routes);
  }

  Future<void> _moveCameraToDestination(
      Trip trip, DirectionRoutes routes) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            trip.destLat,
            trip.destLong,
          ),
          zoom: 14,
        ),
      ),
    );

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest:
              LatLng(routes.bounds.southwest.lat, routes.bounds.southwest.lng),
          northeast:
              LatLng(routes.bounds.northeast.lat, routes.bounds.northeast.lng),
        ),
        25,
      ),
    );
  }

  void _showMyTripBottomSheet() {
    _myTripController = _scaffoldKey.currentState?.showBottomSheet<void>(
      (BuildContext context) {
        return MyTripBottomSheet(
          onCancel: () {
            context.read<MapsViewModel>().cancelTrip();
            _myTripController?.close();
          },
        );
      },
      backgroundColor: Colors.transparent,
      enableDrag: false,
    );
  }
}
