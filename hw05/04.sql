select * from users;

select name
from users u where date_format(birthday_at, '%M') IN ('may', 'august');