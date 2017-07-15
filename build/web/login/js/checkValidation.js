function check(s)
{
    var name=document.register.name;
    var course=document.register.course;
    var branch=document.register.branch;
    var rollno=document.register.rollno;
    var email=document.register.email;
    var tel=document.register.tel;
    var uname=document.register.username;
    var npass=document.register.npass;
    var cpass=document.register.cpass;
    var cap=document.register.captcha;
    var flag=0;
    
if(validate_email(email))  
{  
   if(validate_tel(tel))
   { 

       if(validate_username(uname,5,12))
       {

           if(validate_pass(npass,cpass))
           {

               if(validate_name(name))
               {

                   if(validate_course(course)) 
                   {

                     if(validate_branch(branch))   
                     {

                          if(validate_rollno(rollno))
                          {
                              if(validate_cap(cap,s))
                              {
                     
                                  flag=1;
                              }
                          }
                     }
                   }
                   
               }
           }
       }
   }
} 
if(flag==0)
   return false;
else
    return true;
}  

//validation for email
function validate_email(uemail)  
{  
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
if(uemail.value.match(mailformat))  
{     
return true;  
}  
else  
{  
alert("You have entered an invalid email address!");  
uemail.focus();  
return false;  
}  
}  
  
  
// validation for telephone  
function validate_tel(utel)
{
    
var numbers = /^[0-9]+$/;  
var len = utel.value.length;
if(utel.value.match(numbers))  
{  
    if(len!=10)
    {
        alert("You have entered an invalid mobile no");
        utel.focus();
        return false;
    }
return true;  
}  
else  
{     
alert('Telehone must have numeric characters only');  
utel.focus();  
return false;  
}  
}
 
 
//validation for password 
function validate_pass(npass,cpass)
{
    var n = npass.value;
    var c = cpass.value;
    if(n==c && npass.value.length!=0 && cpass.value.length!=0)
      return true;
    else
    {
        alert("passwords should not be empty and must match");
        return false;
    }
    
}


//validate username
function validate_username(uname,mx,my)
{ 
var len1 = uname.value.length;  
if (len1 == 0 || len1 >= my || len1 < mx)  
{  
alert("Username should not be empty or length be between "+mx+" to "+my);  
uname.focus();  
return false;  
}  
return true;  
}  

function validate_name(name)
{
    var len2=name.value.length;
    if(len2!=0)
    {
        return true;
    }
    else
    {
        alert("name should not be empty");
        name.focus();
        return false;
    }
}
function validate_course(course)
{
    var len3=course.value.length;
    if(len3!=0)
    {
        return true;
    }
    else
    {
        alert("course field should not be empty");
        course.focus();
        return false;
    }
}

function validate_branch(branch)
{
    var len4=branch.value.length;
    if(len4!=0)
    {
        return true;
    }
    else
    {
        alert("branch field should not be empty");
        branch.focus();
        return false;
    }
}


function validate_rollno(rollno)
{
    var len5=rollno.value.length;
    if(len5!=0)
    {
        return true;
    }
    else
    {
        alert("rollno field should not be empty");
        rollno.focus();
        return false;
    }
}

function validate_cap(cap,s){
    var c=cap.value;
    var count=cap.value.length;
  
    if(count!=0 && c==s)
    {
        return true;
    }
    else
    {
        alert("Please enter captcha code correctly");
        cap.focus();
        return false;
    }
    
    
}