class todolist {
  int? id;
  String? actName, actDesc, deadLine;

  todolist({this.id, this.actName, this.actDesc, this.deadLine});

  factory todolist.fromJson(Map<String, dynamic> json) {
    return todolist(
        id: json['id'],
        actName: json['actName'],
        actDesc: json['actDecs'],
        deadLine: json['deadLine']);
  }
}
