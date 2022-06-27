use hoadon;
create table khachhang(
IDkh int primary key auto_increment,
hoten varchar(250),
sdt int ,
ngsing date,
ds int, 
ndk int
);

create table nhanvien(
IDnv int primary key auto_increment,
hotennv varchar(250),
ngvl date,
sdtnv int
);

create table sanpham(
IDsp int primary key auto_increment,
tensp varchar(250),
dvt int,
ncsx varchar(250),
gia int
);

create table hoadon(
IDhd int primary key auto_increment,
idkh int,
idnv int,
ngay date,
giatri int,
foreign key(idkh) references khachhang(idkh),
 foreign key(idnv) references nhanvien(idnv)
);

create table hdct(
idhd int,
idsp int,
primary key(idhd,idsp),
sl int ,
foreign key(idsp) references sanpham(idsp)
);

-- 1
select count(idsp) as 'so luong san pham duoc ban 2006' from hdct 
join hoadon hd on hd.idhd = hdct.idhd
where year(ngay) = 2006;

-- 2
select max(giatri) as 'gia tri hoa don lon nhat' , min(giatri) as 'gia tri hoa don thap nhat' 
from hoadon;  

-- 3
select avg(gia) as 'gia tri trung binh san pham duoc ban 2006' from hdct 
join hoadon hd on hd.idhd = hdct.idhd
join sanpham sp on sp.idsp = hdct.idsp
where year(ngay) = 2006;

-- 4
select giatri from hoadon 
where year(ngay) = 2006;

-- 5
select max(giatri) from hoadon
where year(ngay) = 2006;

-- 6
 select hoten from khachhang kh
 join hoadon hd on hd.idkh = kh.idkh
 where year(ngay) = 2006 and giatri = (select max(giatri) from hoadon);
 
 -- 7
 select kh.idkh , hoten from khachhang kh
order by ds desc limit 3;
 
--  8
select idsp , tensp from sanpham
order by gia desc limit 3;

-- 9
select idsp , tensp from sanpham
where ncsx = 'thailan'
order by gia desc limit 3;

-- 10
select idsp , tensp from sanpham
where ncsx = 'trungquoc'
order by gia desc limit 3;

-- 11

 select kh.idkh , hoten from khachhang kh
order by ds desc limit 3;

-- 12
select count(idsp) 'tổng số san phâm cua trung quốc' from sanpham
where ncsx = 'trungquoc';

--  13
select ncsx ,count(idsp) 'tong san pham' from sanpham
group by ncsx;

-- 14
select ncsx , max(gia), min(gia), avg(gia) from sanpham
group by ncsx;

-- 15
select ngay , sum(giatri) from hoadon
group by ngay ;


-- 17
select ngay ,sum(giatri) from hoadon
where year(ngay) = 2006
group by month(ngay);

-- 18
select idhd from hdct 
group by idhd
having count(idhd) >3;
