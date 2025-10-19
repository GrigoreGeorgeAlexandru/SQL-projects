select * from employees;

set linesize 110

select e.last_name,e.first_name,e.employee_id
from employees e,works_on w,project p
group by e.employee_id
having e.employee_id=w.employee_id
and p.project_id=w.project_id
and p.delivery_date>p.deadline
and count(p.project_id)>=2;

select last_name
from employees e
where department_id not in (select department_id
                        from employees
                        where employee_id in (select project_manager
                                                from project
                                                )
                        );

select avg(salary)

from employees

group by department_id
having avg(salary)>3000;

SELECT last_name,first_name,salary,employee_id
FROM employees
WHERE employee_id in  (SELECT project_manager
                         FROM project
                        GROUP BY project_manager
                        HAVING count(project_id)=2);

SELECT distinct last_name,first_name
FROM employees e,works_on w
WHERE e.employee_id=w.employee_id
AND project_id in (SELECT project_id
                    FROM project
                    WHERE project_manager=102);




