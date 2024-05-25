import 'dart:convert';

// DataGridModel sampleDataModelFromJson(String str) => DataGridModel.fromJson(json.decode(str));

// String sampleDataModelToJson(DataGridModel data) => json.encode(data.toJson());

class ApiDataGridModel {
    Data? data;

  // Data? value;

    ApiDataGridModel({
        this.data,
    });

    factory ApiDataGridModel.fromJson(Map<String, dynamic> json) => ApiDataGridModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    DpiRateList? dpiRateList;

    Data({
        this.dpiRateList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dpiRateList: json["DpiRate_List"] == null ? null : DpiRateList.fromJson(json["DpiRate_List"]),
    );

    Map<String, dynamic> toJson() => {
        "DpiRate_List": dpiRateList?.toJson(),
    };
}

class DpiRateList {
    List<ListElement>? list;
    int? totalCount;

    DpiRateList({
        this.list,
        this.totalCount,
    });

    factory DpiRateList.fromJson(Map<String, dynamic> json) => DpiRateList(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        totalCount: json["totalCount"],
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "totalCount": totalCount,
    };
}

class ListElement {
    String? name;
    int? rate;
    String? id;

    ListElement({
        this.name,
        this.rate,
        this.id,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["_name"],
        rate: json["_rate"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "_name": name,
        "_rate": rate,
        "_id": id,
    };
}
