drop table if exists surveys;
create table surveys (  
   question text,
   num_1 integer,
   num_2 integer,
   num_3 integer,
   num_4 integer,
   num_5 integer,
   survey_id serial
);

insert into surveys (question,num_1,num_2,num_3,num_4,num_5)
   values ('one',5,4,1,0,0);
insert into surveys (question,num_1,num_2,num_3,num_4,num_5)
   values ('two',3,2,3,2,0);
insert into surveys (question,num_1,num_2,num_3,num_4,num_5)
   values ('three',0,4,2,3,1);
insert into surveys (question,num_1,num_2,num_3,num_4,num_5)
   values ('four',2,0,5,3,0);
insert into surveys (question,num_1,num_2,num_3,num_4,num_5)
   values ('five',1,1,1,4,3);
