import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TripModel{
  String?tripId;
  String?userid;
  String?driverid;
  Timestamp?fromDate;
  Timestamp?toDate;
  String?fromPlace;
  String?toPlace;
  String?imageOfDriver;
  String?DriverName;
  String? distance;
  String? tripDescription;
  String?tripCost;
  TripModel({this.tripId, this.userid,this.driverid,this.fromDate,this.toDate,this.fromPlace,this.toPlace, this.imageOfDriver, this.DriverName,
  this.distance,
    this.tripDescription, this.tripCost

  });
  TripModel.fromFirebase( Map<String , dynamic> fromfirebase){
    tripId= fromfirebase['tripId'];
    userid= fromfirebase['userid'];
    driverid= fromfirebase['driverid'];
    fromDate= fromfirebase['fromDate'];
    toDate= fromfirebase['toDate'];
    fromPlace= fromfirebase['fromPlace'];
    toPlace= fromfirebase['toPlace'];
    imageOfDriver = fromfirebase['imageOfDriver'];
    DriverName = fromfirebase['DriverName'];
    distance= fromfirebase['distance'];
    tripDescription = fromfirebase['tripDescription'];
tripCost = fromfirebase['tripCost'];
  }
    Map<String, dynamic> toFirebase(){
      return{
        'tripId' : tripId,
        'userid' : userid,
        'driverid':driverid,
      'fromDate':fromDate,
        'toDate':toDate,
        'fromPlace':fromPlace,
        'toPlace':toPlace,
        'imageOfDriver':imageOfDriver,
        'DriverName':DriverName,
        'distance':distance,
        'tripDescription':tripDescription,
        'tripCost':tripCost


      };
    }

  }

