class TaskModel {
  String? id;
  String idTugas;
  String judul;
  String kategori;
  String deadline;
  String status;
  String gambar;

  TaskModel({
    this.id,
    required this.idTugas,
    required this.judul,
    required this.kategori,
    required this.deadline,
    required this.status,
    required this.gambar,
  });

  factory TaskModel.fromJson(String id, Map data) {
    return TaskModel(
      id: id,
      idTugas: data['id_tugas'],
      judul: data['judul'],
      kategori: data['kategori'],
      deadline: data['deadline'],
      status: data['status'],
      gambar: data['gambar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_tugas': idTugas,
      'judul': judul,
      'kategori': kategori,
      'deadline': deadline,
      'status': status,
      'gambar': gambar,
    };
  }
}
