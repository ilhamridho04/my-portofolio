import 'package:get/get.dart';

class ProjectController  extends GetxController{
  RxList<bool> hovers =[
    false,
  ].obs;


  onHover(int index,bool value){
    hovers[index]=value;
  }
}