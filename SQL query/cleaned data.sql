CREATE TABLE dirty_customers (
  id INT,
  name VARCHAR(100),
  gender VARCHAR(10),
   phone varchar(800),
  email VARCHAR(100)
  
);

drop table dirty_customers

INSERT INTO dirty_customers (id , name , gender , phone , email)
VALUES                                        
 (1      ,   ' John@'  ,  'Male'   , 9876532100   ,  'john.doe@gmail.com' ) ,   
(2       ,   'priya#'  ,  ' X'     ,  4645423102 ,  'priya@domain.com'   ) ,  
( 3      ,   ' GAYAN  ',  'Male'   , NULL         ,          '   '        ) ,                     
( 4      ,   'ramesh ' ,  'male'   , 8023342312   ,  'ramesh.123@gmail.com'),
( 5      ,   'neha  '  ,  ' F '    , 1234567889       ,  'neha#mail.com '      ),                        
( 6      ,    ''       ,  'NULL '  , 9898989806   ,           ' '          ),                  
( 7      ,   'S\\@rah ' ,  'female', 0123474556        ,  'sarah@@example.com'  ),                        
( 8      ,   'mohit-'  ,  'MALE'   ,     null         ,  'mohit\\@domain '      ),                  
( 9      ,   'Tom '    ,  'Male'   , 84989889895   ,  'tom@gmail.com '      );
select *  from dirty_customers;






SELECT
  name AS original_name,
  UPPER(NULLIF(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(name, '@', ''), '#', ''), '-', ''))), '')) AS cleaned_name,

  gender AS original_gender,
  CASE 
    WHEN LOWER(LTRIM(RTRIM(gender))) IN ('male', 'm') THEN 'Male'
    WHEN LOWER(LTRIM(RTRIM(gender))) IN ('female', 'f') THEN 'Female'
    ELSE NULL
  END AS cleaned_gender,

  phone AS original_phone,
  CASE 
    WHEN TRY_CAST(phone AS BIGINT) IS NOT NULL THEN phone
    ELSE NULL
  END AS cleaned_phone,

  email AS original_email,
  CASE 
    WHEN CHARINDEX('@', LTRIM(RTRIM(email))) > 0 AND CHARINDEX('.', email) > 0 
      THEN LOWER(LTRIM(RTRIM(email)))
    ELSE NULL
  END AS cleaned_email

FROM dirty_customers;