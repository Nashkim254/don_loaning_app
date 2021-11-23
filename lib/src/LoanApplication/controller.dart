import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class RequestLoan extends GetxController{
var isLoading = false.obs;
File? file;
  Future openFile({required String url,String? fileName})async{
    isLoading(true);
  final file =   await downLoadFile(url,fileName!);
  if(file ==null)return;
  print(file.path);
  OpenFile.open(file.path);
  isLoading(false);
  update();
  }

  Future<File?> downLoadFile(String url,String name)async{
      final appStorage = await getApplicationDocumentsDirectory();
    final  file = File('${appStorage.path}/$name');
    try{
    final response = await dio.Dio().get(
url,
options: dio.Options(
  responseType: dio.ResponseType.bytes,
  followRedirects: false,
  receiveTimeout: 0,
)
    );
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  }catch(e){
    return null;
  }
}
//upload file
Future getFile()async{
  FilePickerResult? result =  await FilePicker.platform.pickFiles(allowMultiple: false);
if(result == null) return;
file = File(result.files.single.path!);
update();
}


void uploadFile(filePath)async{
 await getFile();
String fileName = basename(filePath.path);
try {
 var requestBody = {
'amount': 10000,
'filled_form': await dio.MultipartFile.fromFileSync(filePath.path,filename: fileName),
 };
 dio.Response response = await dio.Dio().post("https://api.luchian.co.ke/customer/request-loan/",data:requestBody );
  print("File upload response: $response");
} catch (e) {
  print("Exception occurered $e");
}
update();
}
}