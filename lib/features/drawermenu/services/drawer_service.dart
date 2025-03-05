import 'dart:convert';

import 'package:alpha/models/timeLine_model.dart';
import 'package:http/http.dart' as http;

class DrawerService {
  Future<TimeLineModel?> getTimeLine({
    required String userId,
    required String date,
  })
  async{
    try{
       var headers = {
        'Cookie': 'etcpro_ci_session=dc9hnide5tjsctq0j5itto27spkjgvou'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://demo.etcweb.in/api/getTimeLine'));
      request.fields.addAll({
        'userid': '1',
        'date': '19-11-2023'
      });
      
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if(response.statusCode == 200){
        String responseBody = await response.stream.bytesToString();
        print("Data fetched");
        return TimeLineModel.fromJson(json.decode(responseBody));
        }else{
          print('Failed to fetch timeline: ${response.statusCode}');
          return null;
        }
      }catch(e){
      print('Exception: $e');
      return null;
    }
  } 
}