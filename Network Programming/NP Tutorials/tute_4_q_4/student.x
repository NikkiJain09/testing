struct student
{
int enrollment_no;
string name<10>;
int age;
string address<100>;
student *next;
};

program STUDENT_PROG{
	version STUDENT_VERS{
		int STUDENT_PROC(student *)=1;
		}=1;
		}=0x31230000;
