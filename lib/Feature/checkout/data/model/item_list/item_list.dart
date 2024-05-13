class ItemListModel {
  ItemListModel? itemList;

  ItemListModel({this.itemList});

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        itemList: json['item_list'] == null
            ? null
            : ItemListModel.fromJson(json['item_list'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'item_list': itemList?.toJson(),
      };
}
