class Treemodel {
  var nameTh, nameEng, detail, water, image, sun, weather;
  Treemodel(
    this.detail,
    this.image,
    this.nameEng,
    this.nameTh,
    this.water,
    this.sun,
    this.weather,
  );
  Treemodel.formMap(Map<dynamic, dynamic> map) {
    nameTh = map['nameTh'];
    nameEng = map['nameEng'];
    image = map['image'];
    water = map['water'];
    sun = map['sun'];
    weather = map['weather'];
    detail = map['detail'];
  }
}
