import 'package:flutter/material.dart';

class NotificationModel {
  late String id;
  late String userId;
  late String message;
  late bool read;
  late DateTime readAt;
  late DateTime createdAt;
  late DateTime updatedAt;

  NotificationModel(
      this.id,
      this.userId,
      this.message,
      this.read,
      this.readAt,
      this.createdAt,
      this.updatedAt,
      );
  NotificationModel.noUser(
      this.id,

      this.message,
      this.read,

      this.createdAt,

      );
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      json['_id'],
      json['user'],
      json['message'],
      json['read'],
      DateTime.parse(json['readAt']),
      DateTime.parse(json['createdAt']),
      DateTime.parse(json['updatedAt']),
    );
  }

  @override
  String toString() {
    return 'NotificationModel{id: $id, userId: $userId, message: $message, read: $read, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}