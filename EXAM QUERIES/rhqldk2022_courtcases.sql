create table candidates_bkp_19092024_8courtcase as (select * from candidates_bkp_05072023);
create table vacancy_bkp_19092024_8courtcase as (select * from vacancy_table_bkp_05072023);

alter table candidates add column merit_original integer;

update candidates set merit_original=merit;

update candidates
set merit=null;

select * from candidates
where reg_no in ('40002224413','40002086708','40002720437','40002487969','40002384260','40004295459','40005110521','40005110074')


update candidates
set rejection_provision=null,
remarks='re-considered as per email from UnderSecretary to EDP'
where reg_no in ('40002224413','40002086708','40002720437','40002487969','40002384260','40004295459','40005110521','40005110074');---87 updates

create table master_table_bkp as (select * from master_table);

select * from sp_get_cut_off_catsel('RHQ2022_LDK',1);
select * from sp_get_cut_off_catsel('RHQ2022_LDK',2);
select * from sp_get_cut_off_catsel('RHQ2022_LDK',3);

select * from sp_get_merit('RHQ2022_LDK',4);---merit updated successfully for 129 candidates
select * from sp_get_merit('RHQ2022_LDK',5);---merit updated successfully for 507 candidates
select * from sp_get_merit('RHQ2022_LDK',6);---merit updated successfully for 3866 candidates


select * from candidates order by merit_original ;

select * from sp_get_dob_flag('RHQ2022_LDK',12);
select * from sp_get_catseldob_flag('RHQ2022_LDK',24);
select * from sp_get_catsel('RHQ2022_LDK',36);

update candidates
set allocated_post=null,
allocated_category=null,
allocated_eq=null,
age_limit=null;

update vacancy_table
set allocated =null,
left_vacancy=null;

update vacancy_table
set
min_marks=null,
min_marks_parta=null,
min_marks_partb=null,
min_marks_cand_dob=null;


Dear Sir/Madam,

As discussed, we have checked the additional results for Selection Post Ladakh 2022 and found that the mentioned 8 candidates were considered in the result processing .
And below are their allocation status.

However, the candidates were not considered in original result processing. So, as per direction from the Hon'ble High Court of J&K and Ladakh we have treated their candidature as "Accepted" 
and considered them for revising the original result. Please find the allocation details of those candidates attached.

In addition to that,the revised original result is also attached for your reference.