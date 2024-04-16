import 'dart:async';

import 'package:elderselettricomobile/domain/model/auto_complete_prediction.dart';
import 'package:elderselettricomobile/domain/model/trip.dart';
import 'package:elderselettricomobile/presentation/common/alert_bottom_sheet.dart';
import 'package:elderselettricomobile/presentation/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/values/icons.dart';
import '../../domain/model/place_search_history.dart';
import '../../core/values/colors.dart';
import 'viewmodels/search_location_viewmodel.dart';

class SearchDestinationPage extends StatefulWidget {
  const SearchDestinationPage({this.currentAdress});

  final String? currentAdress;

  @override
  State<SearchDestinationPage> createState() => _SearchDestinationPageState();
}

class _SearchDestinationPageState extends State<SearchDestinationPage> {
  final _searchController = TextEditingController();
  Timer? _searchTimer;

  @override
  void initState() {
    final viewmodel = context.read<SearchLocationViewModel>();
    viewmodel.currentAddress = widget.currentAdress;
    viewmodel.startCurrentLocationStream();
    viewmodel.getPlaceSearchHistory();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchLocationViewModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 56,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: SvgPicture.asset('assets/icons/button_back.svg'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your location',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: darkGrey200,
              ),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                AppIcons.svg(
                  'marker_pin',
                  color: greenColor3,
                  width: 16,
                  height: 16,
                ),
                SizedBox(width: 4),
                Expanded(
                  child: viewModel.currentAddress != null
                      ? Text(
                          viewModel.currentAddress!,
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      : currentAddressShimmer(),
                )
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Where are you heading?',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Choose your destination',
                    style: GoogleFonts.montserrat(
                      color: darkGrey100,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 28),
                  searchBar(),
                  SizedBox(height: 16),
                ],
              ),
            ),
            (viewModel.placeSearchHistory.isNotEmpty &&
                    viewModel.autocompleteState.isInit)
                ? recentSearch(viewModel.placeSearchHistory)
                : Container(),
            viewModel.autocompleteState.maybeWhen(
                loading: () => autocompleteShimmer(),
                success: (itemList) {
                  return Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: itemList.length,
                        itemBuilder: (context, index) {
                          final prediction = itemList[index];
                          return autocompletePredictionTile(prediction);
                        }),
                  );
                },
                error: (e) => locationNotFound(),
                orElse: () => Container()),
            (viewModel.placeSearchHistory.isEmpty &&
                        viewModel.autocompleteState.isInit) ||
                    viewModel.autocompleteState.data?.isEmpty == true
                ? SizedBox(height: 24)
                : viewModel.autocompleteState.isSuccess
                    ? SizedBox(height: 12)
                    : Container(),
            Container(
              color: darkGrey800,
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: orangeColor1,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/marker_pin.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Explore nearby activities',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Spacer(),
                    AppIcons.svg(
                      'chevron_right',
                      color: darkGrey200,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text(
                        'Popular destination',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget locationNotFound() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 24),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: darkGrey700,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset('assets/icons/close2.svg'),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location not found',
                  style: AppTextStyle.title4,
                ),
                SizedBox(height: 3),
                Text(
                  'Please check your spelling or try to use another keyword',
                  maxLines: 2,
                  style: AppTextStyle.subtitle7,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      decoration: BoxDecoration(
        color: darkGrey800,
        border: Border.all(color: darkGrey900),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/search.svg'),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.white,
              cursorWidth: 1.5,
              controller: _searchController,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search destination',
                hintStyle: GoogleFonts.montserrat(
                  color: darkGrey100,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.only(left: 4),
              ),
              onChanged: (value) async {
                _searchTimer?.cancel();
                _searchTimer = Timer(Duration(milliseconds: 1000), () {
                  if (value.isNotEmpty && value.length > 2) {
                    context
                        .read<SearchLocationViewModel>()
                        .placeAutoComplete(value);
                  } else {
                    context.read<SearchLocationViewModel>().clearAutocomplete();
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget currentAddressShimmer() {
    return Shimmer.fromColors(
      child: Card(
        color: shimmerColor2,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          height: 10,
          width: double.infinity,
        ),
      ),
      baseColor: shimmerColor2,
      highlightColor: Colors.grey[300]!,
    );
  }

  Widget recentSearch(List<PlaceSearchHistory> itemList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recently searched',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: deleteRecentSearch,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    'Clear all',
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              final prediction = itemList[index];
              return recentSearchTile(prediction, index);
            }),
      ],
    );
  }

  void deleteRecentSearch() {
    showConfirmationAlertDialog(context,
        title: 'Delete recent search?',
        message:
            "This can't be undone and you'll remove all your recent searches",
        onConfirm: () {
      Navigator.of(context).pop();
      context.read<SearchLocationViewModel>().deleteSearchHistory();
    });
  }

  Widget autocompleteShimmer() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 50),
      margin: EdgeInsets.only(bottom: 12),
      child: Shimmer.fromColors(
        baseColor: shimmerColor,
        highlightColor: Colors.grey[300]!,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: shimmerColor,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: shimmerColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Container(
                      height: 10,
                      width: double.infinity,
                    ),
                  ),
                  Card(
                    color: shimmerColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const SizedBox(height: 10, width: 120),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget recentSearchTile(PlaceSearchHistory item, int pos) {
    double? distance = null;
    if (item.distance != null) distance = item.distance! / 1000;

    final viewModel = context.read<SearchLocationViewModel>();
    return Material(
      color: surfaceColor,
      child: InkWell(
        onTap: () async {
          if (viewModel.currentPosition == null) {
            await viewModel.getLastKnownPosition();
          }

          _popRoute(viewModel, item.id);
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.mainText,
                          style: AppTextStyle.title4,
                        ),
                        SizedBox(height: 4),
                        Text(
                          autoCompleteSecondaryText(
                              item.secondaryText, distance),
                          maxLines: 2,
                          style: AppTextStyle.subtitle7,
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      viewModel.deleteSearchHistoryById(item.id, pos);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: AppIcons.svg(
                        'close',
                        color: darkGrey400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: darkGrey600,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _popRoute(
      SearchLocationViewModel viewModel, String description) async {
    final destLatLong = await viewModel.getDestinationLatlong(description);

    Navigator.pop(
        context,
        Trip(
          currentAddress: viewModel.currentAddress,
          destination: description,
          currentLat: viewModel.currentPosition?.latitude ?? 0.0,
          currentLong: viewModel.currentPosition?.longitude ?? 0.0,
          destLat: destLatLong.value1,
          destLong: destLatLong.value2,
        ));
  }

  Widget autocompletePredictionTile(AutocompletePrediction prediction) {
    double? distance = null;
    if (prediction.distanceMeters != null)
      distance = prediction.distanceMeters! / 1000;

    return Material(
      color: surfaceColor,
      child: InkWell(
        onTap: () async {
          final viewModel = context.read<SearchLocationViewModel>();

          viewModel.savePlaceSearchHistory(
            id: prediction.description ?? '',
            mainText: prediction.structuredFormatting?.mainText ?? '',
            secondaryText: prediction.structuredFormatting?.secondaryText,
            distance: prediction.distanceMeters,
          );

          _popRoute(viewModel, prediction.description ?? '');
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 11, horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: darkGrey700,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset('assets/icons/building_yard.svg'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prediction.structuredFormatting?.mainText ?? '-',
                      style: AppTextStyle.title4,
                    ),
                    SizedBox(height: 3),
                    Text(
                      autoCompleteSecondaryText(
                          prediction.structuredFormatting?.secondaryText,
                          distance),
                      maxLines: 2,
                      style: AppTextStyle.subtitle7,
                    )
                  ],
                ),
              ),
              SizedBox(width: 8),
              AppIcons.svg(
                'chevron_right',
                color: darkGrey400,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String autoCompleteSecondaryText(String? secondaryText, double? distance) {
    return '${distance != null ? '${distance.toStringAsFixed(2)} km • ' : ''}${secondaryText ?? '-'}';
  }
}
