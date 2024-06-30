import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:new_york_times/core/constants/api_constants.dart';
import 'package:new_york_times/core/network/dio_factory.dart';
import 'package:new_york_times/features/home_articles/data/data_source/remote/remote_data_source.dart';
import 'package:new_york_times/features/home_articles/data/models/home_articles_response_model.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    dio = DioFactory.getDio();
    dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    remoteDataSource = RemoteDataSource(dio);
  });

  group('get current weather', () {
    test('should return weather model when the response code is 200', () async {
      dioAdapter.onGet(
        APIConstants.homeArticlesEndPoint,
        (server) => server.reply(201, {
          "status": "OK",
          "copyright": "Copyright (c) 2024 The New York Times Company. All Rights Reserved.",
          "section": "home",
          "last_updated": "2024-06-30T14:10:10-04:00",
          "num_results": 23,
          "results": [
            {
              "section": "us",
              "subsection": "politics",
              "title":
                  "48 Hours to Fix a 90-Minute Mess: Inside the Biden Camp’s Post-Debate Frenzy",
              "abstract":
                  "With countless calls and a rush of campaign events, the president’s team began a damage-control effort to pressure and plead with anxious Democratic lawmakers, surrogates, activists and donors.",
              "url":
                  "https://www.nytimes.com/2024/06/30/us/politics/biden-campaign-debate-scramble.html",
              "uri": "nyt://article/2c887175-02ae-58a2-9874-6a5f35b72a82",
              "byline": "By Lisa Lerer, Shane Goldmacher and Katie Rogers",
              "item_type": "Article",
              "updated_date": "2024-06-30T13:08:04-04:00",
              "created_date": "2024-06-30T05:01:59-04:00",
              "published_date": "2024-06-30T05:01:59-04:00",
              "material_type_facet": "",
              "kicker": "",
              "des_facet": [
                "United States Politics and Government",
                "Presidential Election of 2024",
                "Debates (Political)"
              ],
              "org_facet": ["Democratic Party"],
              "per_facet": ["Biden, Joseph R Jr"],
              "geo_facet": [],
              "multimedia": [
                {
                  "url":
                      "https://static01.nyt.com/images/2024/06/30/multimedia/30pol-inside-biden-01-qhcz/30pol-inside-biden-01-qhcz-superJumbo.jpg",
                  "format": "Super Jumbo",
                  "height": 1365,
                  "width": 2048,
                  "type": "image",
                  "subtype": "photo",
                  "caption":
                      "President Biden, with his wife, Jill, arriving in New York on Saturday for a campaign reception. His campaign has been in a battle mode to reassure donors and supporters.",
                  "copyright": "Haiyun Jiang for The New York Times"
                },
                {
                  "url":
                      "https://static01.nyt.com/images/2024/06/30/multimedia/30pol-inside-biden-01-qhcz/30pol-inside-biden-01-qhcz-threeByTwoSmallAt2X.jpg",
                  "format": "threeByTwoSmallAt2X",
                  "height": 400,
                  "width": 600,
                  "type": "image",
                  "subtype": "photo",
                  "caption":
                      "President Biden, with his wife, Jill, arriving in New York on Saturday for a campaign reception. His campaign has been in a battle mode to reassure donors and supporters.",
                  "copyright": "Haiyun Jiang for The New York Times"
                },
                {
                  "url":
                      "https://static01.nyt.com/images/2024/06/30/multimedia/30pol-inside-biden-01-qhcz/30pol-inside-biden-01-qhcz-thumbLarge.jpg",
                  "format": "Large Thumbnail",
                  "height": 150,
                  "width": 150,
                  "type": "image",
                  "subtype": "photo",
                  "caption":
                      "President Biden, with his wife, Jill, arriving in New York on Saturday for a campaign reception. His campaign has been in a battle mode to reassure donors and supporters.",
                  "copyright": "Haiyun Jiang for The New York Times"
                }
              ],
              "short_url": ""
            }
          ]
        }),
      );

      var response = await remoteDataSource.getHomeArticles();
      expect(response, isA<HomeArticlesResponseModel>());
    });
  });
}
