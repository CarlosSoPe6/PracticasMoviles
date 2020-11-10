import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noticias/models/noticia.dart';
import 'package:path/path.dart' as Path;

part 'creadas_event.dart';
part 'creadas_state.dart';

class CreadasBloc extends Bloc<CreadasEvent, CreadasState> {
  CreadasBloc() : super(CreadasInitial());

  @override
  Stream<CreadasState> mapEventToState(
    CreadasEvent event,
  ) async* {
    if (event is FetchNewsEvent) {
      var noticias = await _getAllNoticias();
      yield FetchedNewsState(noticias: noticias);
    } else if (event is CreateNewEvent) {
      var elemento = event.noticia;
      File image = await _chooseImage();
      String urlToImage = await _uploadPicture(image);
      await _saveNoticia(elemento, urlToImage);
      yield CreatedNewState();
      var noticias = await _getAllNoticias();
      yield FetchedNewsState(noticias: noticias);
    }
  }

  Future<File> _chooseImage({bool camera: true}) async {
    final picker = ImagePicker();
    final PickedFile chooseImage = await picker.getImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    return File(chooseImage.path);
  }

  Future<String> _uploadPicture(File image) async {
    String imagePath = image.path;
    // referencia al storage de firebase
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child("noticias/${Path.basename(imagePath)}");

    // subir el archivo a firebase
    StorageUploadTask uploadTask = reference.putFile(image);
    await uploadTask.onComplete;

    // recuperar la url del archivo que acabamos de subir
    dynamic imageURL = await reference.getDownloadURL();
    return imageURL;
  }

  Future _saveNoticia(Noticia elemento, String urlToImage) async {
    await FirebaseFirestore.instance.collection("apuntes").doc().set({
      'source': elemento.source,
      'author': elemento.author,
      'title': elemento.title,
      'description': elemento.description,
      'url': elemento.url,
      'urlToImage': urlToImage,
      'publishedAt': DateTime.now().toIso8601String(),
      'content': elemento.content,
    });
  }

  Future<List<Noticia>> _getAllNoticias() async {
    var apuntes = await FirebaseFirestore.instance.collection("apuntes").get();
    var noticiasList = apuntes.docs
        .map(
          (elemento) => Noticia(
            source: elemento['source'],
            author: elemento['author'],
            title: elemento['title'],
            description: elemento['description'],
            url: elemento['url'],
            urlToImage: elemento['urlToImage'],
            publishedAt: elemento['publishedAt'],
            content: elemento['content'],
          ),
        )
        .toList();
    return noticiasList;
  }
}
