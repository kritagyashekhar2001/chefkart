class DishDetails {
  String? name;
  int? id;
  String? timeToPrepare;
  Ingredients? ingredients;

  DishDetails({this.name, this.id, this.timeToPrepare, this.ingredients});

  DishDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    timeToPrepare = json['timeToPrepare'];
    ingredients = json['ingredients'] != null
        ? Ingredients.fromJson(json['ingredients'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['timeToPrepare'] = timeToPrepare;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.toJson();
    }
    return data;
  }
}

class Ingredients {
  List<Vegetables>? vegetables;
  List<Vegetables>? spices;
  List<Appliances>? appliances;

  Ingredients({this.vegetables, this.spices, this.appliances});

  Ingredients.fromJson(Map<String, dynamic> json) {
    if (json['vegetables'] != null) {
      vegetables = <Vegetables>[];
      json['vegetables'].forEach((v) {
        vegetables!.add(Vegetables.fromJson(v));
      });
    }
    if (json['spices'] != null) {
      spices = <Vegetables>[];
      json['spices'].forEach((v) {
        spices!.add(Vegetables.fromJson(v));
      });
    }
    if (json['appliances'] != null) {
      appliances = <Appliances>[];
      json['appliances'].forEach((v) {
        appliances!.add(Appliances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vegetables != null) {
      data['vegetables'] = vegetables!.map((v) => v.toJson()).toList();
    }
    if (spices != null) {
      data['spices'] = spices!.map((v) => v.toJson()).toList();
    }
    if (appliances != null) {
      data['appliances'] = appliances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vegetables {
  String? name;
  String? quantity;

  Vegetables({this.name, this.quantity});

  Vegetables.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    return data;
  }
}

class Appliances {
  String? name;
  String? image;

  Appliances({this.name, this.image});

  Appliances.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
