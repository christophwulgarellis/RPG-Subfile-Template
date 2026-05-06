**FREE
ctl-opt                      dftactgrp(*no) actgrp(*new);

dcl-f                        CUSTOMERSFLDSPF workstn;

// Variables
dcl-s                        customerId int(10);
dcl-s                        name varchar(50);
dcl-s                        balance packed(10:2);

dcl-s                        rrn int(5) inz(0);

// SQL Cursor
exec sql
    declare c1 cursor for
    select customer_id, name, balance
    from customers;

// Clear subfile
*in50 = *on;
write SFLCTL;
*in50 = *off;

// Open cursor
exec sql open c1;

// Load subfile
dow '1' = '1';

    exec sql
        fetch c1 into :customerId, :name, :balance;

    if sqlcode <> 0;
        leave;
    endif;

    rrn += 1;

    CUSTID   = customerId;
    CUSTNAME = name;
    CUSTBAL  = balance;

    write SFL1;

enddo;

// Close cursor
exec sql close c1;

// Display subfile
*in51 = *on;
*in52 = *on;

dow not *in03;

    exfmt SFLCTL;

enddo;

*inlr = *on;
return;