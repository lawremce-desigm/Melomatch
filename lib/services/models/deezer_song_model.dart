// To parse this JSON data, do
//
//     final deezersongmodel = deezersongmodelFromJson(jsonString);

import 'dart:convert';

Deezersongmodel deezersongmodelFromJson(String str) =>
    Deezersongmodel.fromJson(json.decode(str));

String deezersongmodelToJson(Deezersongmodel data) =>
    json.encode(data.toJson());

class Deezersongmodel {
  String id;
  Title title;
  String upc;
  String link;
  String share;
  String cover;
  String coverSmall;
  String coverMedium;
  String coverBig;
  String coverXl;
  Md5Image md5Image;
  int genreId;
  Genres genres;
  String label;
  int nbTracks;
  int duration;
  int fans;
  DateTime releaseDate;
  RecordTypeEnum recordType;
  bool available;
  String tracklist;
  bool explicitLyrics;
  int explicitContentLyrics;
  int explicitContentCover;
  List<Contributor> contributors;
  DeezersongmodelArtist artist;
  RecordTypeEnum type;
  Tracks tracks;

  Deezersongmodel({
    required this.id,
    required this.title,
    required this.upc,
    required this.link,
    required this.share,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.genreId,
    required this.genres,
    required this.label,
    required this.nbTracks,
    required this.duration,
    required this.fans,
    required this.releaseDate,
    required this.recordType,
    required this.available,
    required this.tracklist,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.contributors,
    required this.artist,
    required this.type,
    required this.tracks,
  });

  factory Deezersongmodel.fromJson(Map<String, dynamic> json) =>
      Deezersongmodel(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        upc: json["upc"],
        link: json["link"],
        share: json["share"],
        cover: json["cover"],
        coverSmall: json["cover_small"],
        coverMedium: json["cover_medium"],
        coverBig: json["cover_big"],
        coverXl: json["cover_xl"],
        md5Image: md5ImageValues.map[json["md5_image"]]!,
        genreId: json["genre_id"],
        genres: Genres.fromJson(json["genres"]),
        label: json["label"],
        nbTracks: json["nb_tracks"],
        duration: json["duration"],
        fans: json["fans"],
        releaseDate: DateTime.parse(json["release_date"]),
        recordType: recordTypeEnumValues.map[json["record_type"]]!,
        available: json["available"],
        tracklist: json["tracklist"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        contributors: List<Contributor>.from(
            json["contributors"].map((x) => Contributor.fromJson(x))),
        artist: DeezersongmodelArtist.fromJson(json["artist"]),
        type: recordTypeEnumValues.map[json["type"]]!,
        tracks: Tracks.fromJson(json["tracks"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "upc": upc,
        "link": link,
        "share": share,
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "md5_image": md5ImageValues.reverse[md5Image],
        "genre_id": genreId,
        "genres": genres.toJson(),
        "label": label,
        "nb_tracks": nbTracks,
        "duration": duration,
        "fans": fans,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "record_type": recordTypeEnumValues.reverse[recordType],
        "available": available,
        "tracklist": tracklist,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "contributors": List<dynamic>.from(contributors.map((x) => x.toJson())),
        "artist": artist.toJson(),
        "type": recordTypeEnumValues.reverse[type],
        "tracks": tracks.toJson(),
      };
}

class DeezersongmodelArtist {
  String id;
  Name name;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  String tracklist;
  ArtistType type;

  DeezersongmodelArtist({
    required this.id,
    required this.name,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.tracklist,
    required this.type,
  });

  factory DeezersongmodelArtist.fromJson(Map<String, dynamic> json) =>
      DeezersongmodelArtist(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        tracklist: json["tracklist"],
        type: artistTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "tracklist": tracklist,
        "type": artistTypeValues.reverse[type],
      };
}

enum Name { DAFT_PUNK }

final nameValues = EnumValues({"Daft Punk": Name.DAFT_PUNK});

enum ArtistType { ARTIST }

final artistTypeValues = EnumValues({"artist": ArtistType.ARTIST});

class Contributor {
  int id;
  Name name;
  String link;
  String share;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  bool radio;
  String tracklist;
  ArtistType type;
  String role;

  Contributor({
    required this.id,
    required this.name,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.radio,
    required this.tracklist,
    required this.type,
    required this.role,
  });

  factory Contributor.fromJson(Map<String, dynamic> json) => Contributor(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        link: json["link"],
        share: json["share"],
        picture: json["picture"],
        pictureSmall: json["picture_small"],
        pictureMedium: json["picture_medium"],
        pictureBig: json["picture_big"],
        pictureXl: json["picture_xl"],
        radio: json["radio"],
        tracklist: json["tracklist"],
        type: artistTypeValues.map[json["type"]]!,
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "link": link,
        "share": share,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "radio": radio,
        "tracklist": tracklist,
        "type": artistTypeValues.reverse[type],
        "role": role,
      };
}

class Genres {
  List<GenresDatum> data;

  Genres({
    required this.data,
  });

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        data: List<GenresDatum>.from(
            json["data"].map((x) => GenresDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GenresDatum {
  int id;
  String name;
  String picture;
  String type;

  GenresDatum({
    required this.id,
    required this.name,
    required this.picture,
    required this.type,
  });

  factory GenresDatum.fromJson(Map<String, dynamic> json) => GenresDatum(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picture": picture,
        "type": type,
      };
}

enum Md5Image { THE_2_E018122_CB56986277102_D2041_A592_C8 }

final md5ImageValues = EnumValues({
  "2e018122cb56986277102d2041a592c8":
      Md5Image.THE_2_E018122_CB56986277102_D2041_A592_C8
});

enum RecordTypeEnum { ALBUM }

final recordTypeEnumValues = EnumValues({"album": RecordTypeEnum.ALBUM});

enum Title { DISCOVERY }

final titleValues = EnumValues({"Discovery": Title.DISCOVERY});

class Tracks {
  List<TracksDatum> data;

  Tracks({
    required this.data,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        data: List<TracksDatum>.from(
            json["data"].map((x) => TracksDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TracksDatum {
  String id;
  bool readable;
  String title;
  String titleShort;
  String titleVersion;
  String link;
  String duration;
  String rank;
  bool explicitLyrics;
  int explicitContentLyrics;
  int explicitContentCover;
  String preview;
  Md5Image md5Image;
  DatumArtist artist;
  Album album;
  DatumType type;

  TracksDatum({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.link,
    required this.duration,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.artist,
    required this.album,
    required this.type,
  });

  factory TracksDatum.fromJson(Map<String, dynamic> json) => TracksDatum(
        id: json["id"],
        readable: json["readable"],
        title: json["title"],
        titleShort: json["title_short"],
        titleVersion: json["title_version"],
        link: json["link"],
        duration: json["duration"],
        rank: json["rank"],
        explicitLyrics: json["explicit_lyrics"],
        explicitContentLyrics: json["explicit_content_lyrics"],
        explicitContentCover: json["explicit_content_cover"],
        preview: json["preview"],
        md5Image: md5ImageValues.map[json["md5_image"]]!,
        artist: DatumArtist.fromJson(json["artist"]),
        album: Album.fromJson(json["album"]),
        type: datumTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "readable": readable,
        "title": title,
        "title_short": titleShort,
        "title_version": titleVersion,
        "link": link,
        "duration": duration,
        "rank": rank,
        "explicit_lyrics": explicitLyrics,
        "explicit_content_lyrics": explicitContentLyrics,
        "explicit_content_cover": explicitContentCover,
        "preview": preview,
        "md5_image": md5ImageValues.reverse[md5Image],
        "artist": artist.toJson(),
        "album": album.toJson(),
        "type": datumTypeValues.reverse[type],
      };
}

class Album {
  String id;
  Title title;
  String cover;
  String coverSmall;
  String coverMedium;
  String coverBig;
  String coverXl;
  Md5Image md5Image;
  String tracklist;
  RecordTypeEnum type;

  Album({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.tracklist,
    required this.type,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        cover: json["cover"],
        coverSmall: json["cover_small"],
        coverMedium: json["cover_medium"],
        coverBig: json["cover_big"],
        coverXl: json["cover_xl"],
        md5Image: md5ImageValues.map[json["md5_image"]]!,
        tracklist: json["tracklist"],
        type: recordTypeEnumValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "cover": cover,
        "cover_small": coverSmall,
        "cover_medium": coverMedium,
        "cover_big": coverBig,
        "cover_xl": coverXl,
        "md5_image": md5ImageValues.reverse[md5Image],
        "tracklist": tracklist,
        "type": recordTypeEnumValues.reverse[type],
      };
}

class DatumArtist {
  String id;
  Name name;
  String tracklist;
  ArtistType type;

  DatumArtist({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.type,
  });

  factory DatumArtist.fromJson(Map<String, dynamic> json) => DatumArtist(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        tracklist: json["tracklist"],
        type: artistTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "tracklist": tracklist,
        "type": artistTypeValues.reverse[type],
      };
}

enum DatumType { TRACK }

final datumTypeValues = EnumValues({"track": DatumType.TRACK});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
