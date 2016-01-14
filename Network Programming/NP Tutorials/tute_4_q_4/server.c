#include"student.h"
#include"student_xdr.c"
#include<stdio.h>
#include<stdlib.h>

int student_proc_1_svc(student *inp,struct svc_req *rqstp)
{
    static int result;
    result=5;
    return(result);
}