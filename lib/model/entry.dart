class Entry{
  int id;
  String comment;
  int userID;
  int topicID;
  int like;
  int unLike;
  DateTime createDate;

  Entry(this.id, this.comment, this.userID, this.topicID, this.like,
      this.unLike, this.createDate);
}