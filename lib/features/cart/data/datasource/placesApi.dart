import 'package:dio/dio.dart';
import 'package:ecommerce_user/core/utilities/endpoints.dart';
import 'package:ecommerce_user/features/cart/data/models/palcedetail_model.dart';
import 'package:ecommerce_user/features/cart/models/suggession_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class PlacesDataSource {
  Future<List<Suggestion>> fetchSuggestions(
    String query,
    BuildContext context,
  );
  Future<PlaceDetail> getPlaceDetailFromId(
    String placeId,
    BuildContext context,
  );
}

class PlacesDatasourceImpl implements PlacesDataSource {
  static String sessionToken = '';
  static String apiKey = dotenv.env['MAP_API_KEY']!;
  final dio = Dio();

  @override
  Future<List<Suggestion>> fetchSuggestions(
      String query, BuildContext context) async {
    final response = await dio.get(
        '$placesAutocompeleteUrlPath?input=$query&sessiontoken=$sessionToken&types=establishment&language=ar|en&key=$apiKey');

    return PlacesModel.fromJson(response.data).suggestions;
  }

  @override
  Future<PlaceDetail> getPlaceDetailFromId(
      String placeId, BuildContext context) async {
    final response = await dio.get(
        '$placesUrlPath?place_id=$placeId&fields=geometry&key=$apiKey&sessiontoken=$sessionToken');

    return PlaceDetail.fromJson(response.data);
  }
}