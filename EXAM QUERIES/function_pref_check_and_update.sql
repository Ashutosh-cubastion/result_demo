-- FUNCTION: public.function_pref_check_and_update()

-- DROP FUNCTION IF EXISTS public.function_pref_check_and_update();

CREATE OR REPLACE FUNCTION public.function_pref_check_and_update(
	)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
declare 
pref_record record;

Begin

select 
--count(1) filter (where allocated_preference_position_f=1 and allocated_post_f in ('A01','A02')) as aao_1st_position,
count(1) filter( where allocated_preference_position_r=1 and allocated_post_r in ('C01','C02')) as jso_1st_position,
count(1) filter (where allocated_preference_position_all=1 and allocated_post_all is not null) as all_1st_position,
count(1) filter (where  allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<>1
     and allocated_preference_position_all<>1 and allocated_preference_position_r>allocated_preference_position_all) as "r>all",
--count(1) filter (where allocated_category_all is not null and allocated_category_f is not null and allocated_preference_position_f<>1
    -- and allocated_preference_position_all<>1 and allocated_preference_position_f>allocated_preference_position_all) as "f>all",
--count(1) filter (where allocated_category_all is not null and allocated_category_f is not null and allocated_Category_r is null 
	--and allocated_preference_position_f<allocated_preference_position_all and allocated_preference_position_f<>1 and allocated_preference_position_all<>1) as "f<all",
count(1) filter (where allocated_category_all is not null and allocated_category_r is not null  
	and allocated_preference_position_r<allocated_preference_position_all and allocated_preference_position_r<>1 and allocated_preference_position_all<>1) as "r<all" 
from candidates into pref_record;

---- updaqte preference -----

------ 1st postition A01, A02---------
 --update candidates set post_preference ='A01' where allocated_preference_position_f=1 and allocated_post_f='A01';
 --update candidates set post_preference ='A02' where allocated_preference_position_f=1 and allocated_post_f='A02';
 
 ------ 1 st position C34 -----------------
 update candidates set post_preference ='C01' where allocated_preference_position_r=1 and allocated_post_r='C01';
 update candidates set post_preference ='C02' where allocated_preference_position_r=1 and allocated_post_r='C02';

 ------- 1st position all ----------------
  --update candidates set post_preference=replace(post_preference,'A01,','') where allocated_preference_position_all=1 and allocated_post_all is not null;
  --update candidates set post_preference=replace(post_preference,',A01','') where allocated_preference_position_all=1 and allocated_post_all is not null;
  --update candidates set post_preference=replace(post_preference,'A02,','') where allocated_preference_position_all=1 and allocated_post_all is not null;
  --update candidates set post_preference=replace(post_preference,',A02','') where allocated_preference_position_all=1 and allocated_post_all is not null;
  update candidates set post_preference=replace(post_preference,'C01,','') where allocated_preference_position_all=1 and allocated_post_all is not null;
  update candidates set post_preference=replace(post_preference,',C01','') where allocated_preference_position_all=1 and allocated_post_all is not null;
  update candidates set post_preference=replace(post_preference,'C02,','') where allocated_preference_position_all=1 and allocated_post_all is not null;
  update candidates set post_preference=replace(post_preference,',C02','') where allocated_preference_position_all=1 and allocated_post_all is not null;
      
 ---------- r>all --------------------------
   
  update candidates set post_preference=replace(post_preference,'C01,','') where rollno in (select rollno from candidates where  allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<>1
  and allocated_preference_position_all<>1 and allocated_preference_position_r>allocated_preference_position_all);
	 
  update candidates set post_preference=replace(post_preference,',C01','') where rollno in (select rollno from candidates where  allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<>1
  and allocated_preference_position_all<>1 and allocated_preference_position_r>allocated_preference_position_all);
    
  update candidates set post_preference=replace(post_preference,'C02,','') where rollno in (select rollno from candidates where  allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<>1
  and allocated_preference_position_all<>1 and allocated_preference_position_r>allocated_preference_position_all);
	 
  update candidates set post_preference=replace(post_preference,',C02','') where rollno in (select rollno from candidates where  allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<>1
  and allocated_preference_position_all<>1 and allocated_preference_position_r>allocated_preference_position_all);
     
------------ f > all ----------------------------------------

-- update candidates set post_preference=replace(post_preference,',A01','') where rollno in ( select rollno from candidates where  allocated_category_all is not null and allocated_category_f is not null and allocated_preference_position_f<>1
 --and allocated_preference_position_all<>1 and allocated_preference_position_f>allocated_preference_position_all);

 --update candidates set post_preference=replace(post_preference,'A01,','') where rollno in ( select rollno from candidates where  allocated_category_all is not null and allocated_category_f is not null and allocated_preference_position_f<>1
 --and allocated_preference_position_all<>1 and allocated_preference_position_f>allocated_preference_position_all);
 
-- update candidates set post_preference=replace(post_preference,',A02','') where rollno in ( select rollno from candidates where  allocated_category_all is not null and allocated_category_f is not null and allocated_preference_position_f<>1
 --and allocated_preference_position_all<>1 and allocated_preference_position_f>allocated_preference_position_all);

-- update candidates set post_preference=replace(post_preference,'A02,','') where rollno in ( select rollno from candidates where  allocated_category_all is not null and allocated_category_f is not null and allocated_preference_position_f<>1
 --and allocated_preference_position_all<>1 and allocated_preference_position_f>allocated_preference_position_all);
 
 ---------- f < all -------------------------------------------
 --update candidates set post_preference=replace(post_preference,allocated_post_all,'') where rollno in (select rollno from candidates where allocated_category_all is not null and allocated_category_f is not null and allocated_Category_r is null and allocated_preference_position_f<allocated_preference_position_all
 --and allocated_preference_position_f<>1 and allocated_preference_position_all<>1);
 
 ----------- r < all -------------------------------------------
 update candidates set post_preference=replace(post_preference,allocated_post_all,'') where rollno in (select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
 and allocated_preference_position_r<>1 and allocated_preference_position_all<>1);
 

return 'Preference updated';

end;
$BODY$;

ALTER FUNCTION public.function_pref_check_and_update()
    OWNER TO postgres;
