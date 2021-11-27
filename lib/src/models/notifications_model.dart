// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

List<Notification> notificationFromJson(String str) => List<Notification>.from(json.decode(str).map((x) => Notification.fromJson(x)));

String notificationToJson(List<Notification> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notification {
    Notification({
        this.id,
        this.actorObjectId,
        this.actorText,
        this.actorUrlText,
        this.verb,
        this.description,
        this.nfType,
        this.targetObjectId,
        this.targetText,
        this.targetUrlText,
        this.objObjectId,
        this.objText,
        this.objUrlText,
        this.extra,
        this.created,
        this.read,
        this.deleted,
        this.recipient,
        this.actorContentType,
        this.targetContentType,
        this.objContentType,
    });

    int? id;
    int? actorObjectId;
    String? actorText;
    String? actorUrlText;
    String? verb;
    String? description;
    String? nfType;
    int? targetObjectId;
    String? targetText;
    String? targetUrlText;
    int? objObjectId;
    String? objText;
    String? objUrlText;
    String? extra;
    DateTime? created;
    bool? read;
    bool? deleted;
    int? recipient;
    int? actorContentType;
    int? targetContentType;
    int? objContentType;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        actorObjectId: json["actor_object_id"],
        actorText: json["actor_text"],
        actorUrlText: json["actor_url_text"],
        verb: json["verb"],
        description: json["description"],
        nfType: json["nf_type"],
        targetObjectId: json["target_object_id"],
        targetText: json["target_text"],
        targetUrlText: json["target_url_text"],
        objObjectId: json["obj_object_id"],
        objText: json["obj_text"],
        objUrlText: json["obj_url_text"],
        extra: json["extra"],
        created: DateTime.parse(json["created"]),
        read: json["read"],
        deleted: json["deleted"],
        recipient: json["recipient"],
        actorContentType: json["actor_content_type"],
        targetContentType: json["target_content_type"],
        objContentType: json["obj_content_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "actor_object_id": actorObjectId,
        "actor_text": actorText,
        "actor_url_text": actorUrlText,
        "verb": verb,
        "description": description,
        "nf_type": nfType,
        "target_object_id": targetObjectId,
        "target_text": targetText,
        "target_url_text": targetUrlText,
        "obj_object_id": objObjectId,
        "obj_text": objText,
        "obj_url_text": objUrlText,
        "extra": extra,
        "created": created!.toIso8601String(),
        "read": read,
        "deleted": deleted,
        "recipient": recipient,
        "actor_content_type": actorContentType,
        "target_content_type": targetContentType,
        "obj_content_type": objContentType,
    };
}
