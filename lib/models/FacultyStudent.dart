class FacultyStudent{

  String name,roll,address,phone,className;
  String dob;
  List<dynamic> Remarks=[];
  List<dynamic> Homework=[];
  List<dynamic> Assignment=[];
  List<dynamic> Result=[];
  Map<String,double> Attendance;

  FacultyStudent({ required this.Result,required this.Attendance,this.className='',this.name='',this.phone='',this.address='',required this.roll,required this.Assignment,required this.Homework,required this.Remarks,required this.dob});

}