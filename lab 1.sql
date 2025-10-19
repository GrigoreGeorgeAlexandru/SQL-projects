select city,country_name , count(employee_id) 
from locations l join countries c on (c.country_id=l.country_id) 
join departments d on (d.location_id=l.location_id)  
join employees e on (e.department_id=d.department_id)  
group by city,country_name ; 

select * from (select last_name,salary
                FROM employees
                order by salary desc   )
                
  where rownum<=5;
                
  
 select count(count(employee_id))
 from job_history
 group by employee_id
  having count(job_id)>=2;
  
  select department_name,country_name
  from departments d join locations l using(location_id)
   join countries using (country_id)
   join employees using(department_id)
group by department_name,country_name
          having count(*)=(select max(count(*))      
       from employees
       group by department_id);
                
          select count(count(manager_id))
          from employees
          group by manager_id
         having manager_id is not null;
                
                select avg(nvl(commission_pct,0))
                from employees;
                
                
                SELECT TO_CHAR(sysdate, 'YYYY/MM/DD') FROM   dual;
                
                
                select table_name
from user_tables;
                
                
                
                
           