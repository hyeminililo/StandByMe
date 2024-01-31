class Member {
  String memberName ;
 // Role role ; // Role class가 필요한데, 이게 서버랑 통신을 했으면 바로 따로 role에 대한 클래스를 선언하지 않아도 되는지 궁금
  String email;
  String name;
  String picture;

  Member(this.memberName,
      //this.role,
      this.email, this.name, this.picture);

}