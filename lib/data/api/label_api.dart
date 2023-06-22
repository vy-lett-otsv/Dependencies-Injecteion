import 'package:injection/common/network/api_config.dart';
import 'package:injection/common/network/api_helper.dart';
import 'package:injection/data/model/label_entity.dart';
import '../../common/network/dio_client.dart';

class LabelApi with ApiHelper<LabelEntity>{
  final DioClient dioClient;

  LabelApi({required this.dioClient});

  Future<List<LabelEntity>> getLabels() async {
    return await makeGetRequestList(dioClient.dio.get(ApiConfig.labelProduct), LabelEntity.fromJson);
  }
}