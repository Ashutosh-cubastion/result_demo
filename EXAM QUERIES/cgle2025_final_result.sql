create table tier1_qualified_cgl25
(REGID character varying,
 ROLL character varying,
 NAME character varying,
 FATHERNAME character varying,
 MOTHERNAME character varying,
 T1Q_JSO character varying,
 T1Q_SI	character varying,
 T1Q_OTHER character varying
);----131059

create table candidates as
(select a.*,b.roll as rollno,b.t1q_jso,b.t1q_si,b.t1q_other from "cgl2025Applications" a, tier1_qualified_cgl25 b where a."registrationNo"=b.regid);


alter table candidates add column cat1 character varying;
alter table candidates add column cat2 character varying;
alter table candidates add column cat3 character varying;
alter table candidates add column service_period character varying;
alter table candidates add column exsm_length character varying;
alter table candidates add column exs_reservation character varying;
alter table candidates add column agerelax_code character varying;

do
$$
begin

update candidates set cat1='9' where category='UR';--25776
update candidates set cat1='1' where category='SC';--25827
update candidates set cat1='2' where category='ST';--11852
update candidates set cat1='6' where category='OBC';--46876
update candidates set cat1='0' where category='EWS';--20728

end
$$

update candidates set cat2='3' where "isEsm"=true;--3556

do
$$
begin

update candidates set cat3='5' where "typeOfPwbd"='HH';--1552
update candidates set cat3='4' where "typeOfPwbd"='OH';--1678
update candidates set cat3='8' where "typeOfPwbd"='Others';--1489
update candidates set cat3='7' where "typeOfPwbd"='VH';--1612

end
$$

update candidates set gender='1' where gender='Female';--21186
update candidates set gender='2' where gender='Male';--109873

update candidates set exsm_length=substring("lengthOfService",1,2)  where cat2='3';
update candidates set exsm_length=trim(exsm_length) where cat2='3' ;

update candidates set exs_reservation='Yes' where cat2='3' ;---3556
update candidates set exs_reservation='No' where cat2='3' and "isCivilPost"=true;---155

alter table candidates add constraint pk_regno primary key ("registrationNo");
create index idx_1 on candidates (rollno);

update candidates set agerelax_code="arcCode";

select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='1' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='2' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='3' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='4' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='5' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='6' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='8' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='9' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='10' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code from candidates where agerelax_code='11' group by cat1,cat2,cat3,agerelax_Code;
select distinct cat1,cat2,cat3,agerelax_Code,gender from candidates where agerelax_code='12' group by cat1,cat2,cat3,agerelax_Code,gender;
select distinct cat1,cat2,cat3,agerelax_Code,gender from candidates where agerelax_code='13' group by cat1,cat2,cat3,agerelax_Code,gender;

select * from candidates where dob<='1998-08-02' and agerelax_code is null and cat2='3';--12

update candidates 
set agerelax_code='6',
remarks='Age Relaxation Given'
where dob<='1998-08-02' and agerelax_code is null and cat2='3';--12

select * from candidates where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('9','0');--215
select * from candidates where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('6');--179
select * from candidates where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('1','2');--52

update candidates 
set agerelax_code='3',
remarks='Age Relaxation Given'
where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('9','0');--215

update candidates 
set agerelax_code='4',
remarks='Age Relaxation Given'
where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('6');--179

update candidates 
set agerelax_code='5',
remarks='Age Relaxation Given'
where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('1','2');--52

select * from candidates where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is null;--12828
select * from candidates where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('9','0');---9389
select * from candidates where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('6');--1597
select * from candidates where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('1','2');--1842


update candidates 
set agerelax_code='2',
remarks='Age Relaxation Given'
where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('6');--1597

update candidates 
set agerelax_code='1',
remarks='Age Relaxation Given'
where dob<='1998-08-02' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('1','2');--1842

alter table candidates add column dob_flag_18_27 character varying;
alter table candidates add column dob_flag_20_30 character varying;
alter table candidates add column dob_flag_18_30 character varying;
alter table candidates add column dob_flag_18_32 character varying;
alter table candidates add column dob_flag_it_18_30 character varying;

select * from sp_get_dob_flag('CGL',3);---4.41 mins

pg_dump -U postgres -h 10.246.126.173 -p 5432 -t master_table -F c -f C:\Users\Public\master_table.dump alloc_cgle2025_allocation_final
pg_restore -U postgres -h localhost -p 5432 -d postgres -t master_table C:\Users\Public\master_table.dump

select count(*) from candidates limit 10;

alter table candidates add constraint pk_reg primary key ("registrationNo");

select * from master_table;

alter table master_table add constraint pk_serial primary key (serial);

create index idx_1 on candidates (rollno);

alter table candidates add column catsel_dob_18_27 character varying;
alter table candidates add column catsel_dob_20_30 character varying;
alter table candidates add column catsel_dob_18_30 character varying;
alter table candidates add column catsel_dob_18_32 character varying;
alter table candidates add column catsel_dob_it_18_30 character varying;

select * from sp_get_catseldob_flag('CGL',8);
select * from sp_get_catseldob_flag('CGL',9);
select * from sp_get_catseldob_flag('CGL',10);
select * from sp_get_catseldob_flag('CGL',11);
select * from sp_get_catseldob_flag('CGL',12);


CREATE TABLE IF NOT EXISTS public.vacancy_raw
(
	srno integer,
    postcode character varying COLLATE pg_catalog."default",
    nameofdepartment character varying COLLATE pg_catalog."default",
    postname character varying COLLATE pg_catalog."default",
    paylevel character varying COLLATE pg_catalog."default",
    postclassification character varying COLLATE pg_catalog."default",
    ur integer,
    sc integer,
    st integer,
    obc integer,
    ews integer,
    total integer,
    esm integer,
    oh integer,
    hh integer,
    vh integer,
    other integer,
    colorblind character varying COLLATE pg_catalog."default",
    agelimit character varying COLLATE pg_catalog."default",
    cpt_dest character varying COLLATE pg_catalog."default"
);


