namespace hr.management;

using {cuid, managed} from '@sap/cds/common';

entity Employees : cuid,managed{

  employeeId : String(10);
  firstname : String(50);
  lastname : String(50);
  email : String(20);
  phone : String(10);

  department : String(20);
  jobTitle : String(20);
  manager : String(20);

  joiningDate : Date;
  location : String(20);
  employmentType : String(20);

  onboardingStatus : String(50);

   cases           : Composition of many HRCases
                        on cases.employee = $self;

    onboardingTasks : Composition of many OnboardingTasks
                        on onboardingTasks.employee = $self;
}


entity HRCases : cuid, managed {
  casenumber : String(30);
  title : String(30);
  description : String(30);

  priority :String(30);
  status : String(30);
  category : String(30);

  dueDate : Date;

  assignedTo : String(50);
  employee : Association to Employees;

  comments :  Composition of many CaseComments
                    on comments.case = $self;
  
}

entity OnboardingTasks : cuid, managed{
 title: String(100);
 description: String(100);

 status : String(100);
 dueDate : Date;

 assignedTo : String(100);
 employee : Association to Employees;

}

entity CaseComments : cuid, managed{
  comment : String(100);
  author : String(100);

  ![case] : Association to HRCases;
}

