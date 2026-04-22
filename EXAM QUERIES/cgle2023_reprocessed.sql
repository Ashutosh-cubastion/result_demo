Select * into candidates_final_bkp from candidates;
Select * into vacancy_final_bkp from vacancy_table;

update candidates
set cutoff_flag_jso  =null ,
    cutoff_flag_f  =null ,
    cutoff_flag_all  =null ,
    cutoff_flag_cpt  =null ,
    cutoff_flag_dest  =null ,
    catsel_cpt_20_30  =null ,
    catsel_cpt_18_30  =null ,
    catsel_dest_18_27  =null ,
    catsel_f_18_30  =null ,
    catsel_jso_18_32  =null ,
    catsel_si_18_30  =null ,
    catsel_all_18_27  =null ,
    catsel_all_20_30  =null ,
    catsel_all_18_30  =null ,
    catsel_all_it_18_30 =null,
	cutoff_flag_si =null;
	
alter table cut_off_table add column session1 numeric;
alter table cut_off_table add column session2 numeric;

delete from cut_off_table;

psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_cgle2023_allocation_final
\copy cut_off_table from 'C:\Users\Public\cut_off_modified.csv' csv header;	

select * from sp_get_cut_off('CGL',14);----14,15,16,17,18,35

select * from sp_get_catsel('CGL',);---19,20,21,22,23,24,25,26,27,28

select * from candidates where cat2='3' and education_details not like 'Graduation';

update candidates
set	catsel_cpt_20_30  =null ,
    catsel_cpt_18_30  =null ,
    catsel_f_18_30  =null ,
    catsel_jso_18_32  =null ,
    catsel_si_18_30  =null ,
    catsel_all_20_30  =null ,
    catsel_all_18_30  =null where cat2='3' and education_details not like 'Graduation';
	
	
dest exempted but marks good	
3206036235 ---0.27030

8201038694----1.75680

update candidates
set catsel_si_18_30 = null where merit_r is not null and t1q_si is null;---741

update candidates
set catsel_jso_18_32 = null where merit_r is not null and t1q_jso is null;---506


UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_f=null, allocated_post_f=null, allocated_against_ur_f=null, allocated_preference_position_f=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
	
update vacancy_table
set allocated ='0',
current=initial_vacancy;

update vacancy_table
set allocated_oh ='0',
allocated_hh ='0',
allocated_vh ='0',
allocated_ph_others ='0',
allocated_esm ='0';

update vacancy_table
set left_vacancy =current;

update candidates
set is_catsel_available ='true' where 
((catsel_all_18_27 is not null and catsel_all_18_27<>'') or
(catsel_all_20_30 is not null and catsel_all_20_30<>'') or
(catsel_all_18_30 is not null and catsel_all_18_30<>'') or
(catsel_all_it_18_30 is not null and catsel_all_it_18_30<>''));

update candidates
set post_preference = post_preference_original;

select * from vacancy_table order by post_code,category_code;

select sum(initial_vacancy),sum(current),sum(allocated) from vacancy_table;---8380,8380,0

select count(allocated_post) from candidates;---0


select * from sp_get_allocation_r('CGL',30); ---allocation_r updated for 230 candidates

select * from sp_get_allocation_all('CGL',31);----allocated_all updated successfully for 8148 candidates

Select * into candidates_bkp1 from candidates;
Select * into vacancy_bkp1 from vacancy_table;	

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',32);

select * from vacancy_table order by post_code,category_code;

UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_f=null, allocated_post_f=null, allocated_against_ur_f=null, allocated_preference_position_f=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
	

----------------------------------------------------------------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',30); ---allocation_r updated for 200 candidates

select * from sp_get_allocation_all('CGL',31);----allocated_all updated successfully for 7669 candidates

Select * into candidates_bkp2 from candidates;
Select * into vacancy_bkp2 from vacancy_table;	

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',32);

select * from vacancy_table order by post_code,category_code;

UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_f=null, allocated_post_f=null, allocated_against_ur_f=null, allocated_preference_position_f=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
	
----------------------------------------------------------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',30); ---allocation_r updated for 197 candidates

select * from sp_get_allocation_all('CGL',31);----allocated_all updated successfully for 7669 candidates

Select * into candidates_bkp3 from candidates;
Select * into vacancy_bkp3 from vacancy_table;	

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',32);

--------------------------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',30); ---allocation_r updated for 194 candidates

select * from sp_get_allocation_all('CGL',31);----allocated_all updated successfully for 7667 candidates

select * from sp_copy_post_preference();

Select * into candidates_bkp4 from candidates;
Select * into vacancy_bkp4 from vacancy_table;	

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',32);

-------------------------------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',30); ---allocation_r updated for 194 candidates

select * from sp_get_allocation_all('CGL',31);----allocated_all updated successfully for 7667 candidates

select * from sp_copy_post_preference();

Select * into candidates_bkp5 from candidates;
Select * into vacancy_bkp5 from vacancy_table;	

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',32);

--------------------------------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',30); ---allocation_r updated for 194 candidates

select * from sp_get_allocation_all('CGL',31);----allocated_all updated successfully for 7667 candidates

select * from sp_copy_post_preference();

Select * into candidates_bkp from candidates;
Select * into vacancy_bkp4 from vacancy_table;	

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

"2002012269"
"8601034562"---all wale posts removed r<all
"2405054217"
"4410009160"
"3001006297"
"2201290402"

select * from sp_adjust_vacancy('CGL',32);

----------------------------------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',30); ---allocation_r updated for 194 candidates

select * from sp_get_allocation_all('CGL',31);----allocated_all updated successfully for 7665 candidates

select * from sp_copy_post_preference();

Select * into candidates_bkp from candidates;
Select * into vacancy_bkp4 from vacancy_table;	

select sum(initial_vacancy),sum(current),sum(allocated) from vacancy_table;---8380,7863,7861

select count(allocated_post) from candidates;---7861

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select sum(initial_vacancy),sum(current),sum(allocated) from vacancy_table;---8380,7863,7859

select count(allocated_post) from candidates;---7859


update vacancy_table
set lowest_total =null,
lowest_additional_paper =null,
lowest_t2p1s1 =null,
lowest_dob =null,
max_merit =null;
