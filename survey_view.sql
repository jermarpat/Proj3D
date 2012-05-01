--survey_view.sql
drop sequence if exists user_surveys_id_seq cascade;
create sequence user_surveys_id_seq;
drop table if exists user_surveys cascade;
create table user_surveys(
   user_id integer references users(id),
   survey_id integer references surveys(id)
   );
      
create or replace view user_survey_view as
   select users.id as uid, users.division, users.username,
      users.department, surveys.id as sid, surveys.survey_name
      from users join user_surveys on users.id=user_surveys.user_id
      inner join surveys on user_surveys.survey_id=surveys.id;

insert into user_surveys (survey_id, user_id) values
   (1,2);
insert into user_surveys (survey_id, user_id) values
   (2,2);      
insert into user_surveys (survey_id, user_id) values
   (3,3);
   
select * from user_survey_view where division='div1';
select * from user_survey_view where division='deptA';
select * from user_survey_view where division='deptB';
