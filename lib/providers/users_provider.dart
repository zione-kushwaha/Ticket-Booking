import 'package:flutter/material.dart';
import 'package:ticket_booking/models/Users.dart';

class users_provider with ChangeNotifier{
  List<TripMember>_user=[];
  
  // creating a getter to get the users
  List<TripMember> get user {
    return[..._user];}

//creating a function to all list of the record 
void addListRecord(List<TripMember> tripMember){
   tripMember.forEach((element) {_user.add(element);});
}
//function to get the length of the record
int getlength(){
  return _user.length;
}
}