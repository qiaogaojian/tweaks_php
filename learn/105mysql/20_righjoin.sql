select boy.hid,boy.bname,girl.gname
from boy right join girl
on boy.hid = girl.hid;