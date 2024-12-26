select
    *
from {{ ref('employees_salary' )}}
having salary < 1


