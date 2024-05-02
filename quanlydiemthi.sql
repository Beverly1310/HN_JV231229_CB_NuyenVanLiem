# Bài 1: Tạo CSDL [20 điểm]:
create schema QUANLYDIEMTHI;
use QUANLYDIEMTHI;
create table STUDENT
(
    studentId    varchar(4) primary key not null,
    studentName  varchar(100)           not null,
    birthday     date                   not null,
    gender       bit(1)                 not null,
    address      text                   not null,
    phoneNumeber varchar(45)
);
create table SUBJECT
(
    subjectId   varchar(4) primary key not null,
    subjectName varchar(45)            not null,
    priority    int(11)                not null
);
create table MARK
(
    subjectId varchar(4) not null,
    studentId varchar(4) not null,
    point     float      not null
);
alter table mark
    add constraint fk_mark_subjectid
        foreign key (subjectId) references SUBJECT (subjectId),
    add constraint fk_mark_studentid
        foreign key (studentId) references STUDENT (studentId),
    add constraint pk_mark
        primary key (subjectId, studentId);
# Bài 2: Thêm , sửa , xoá dữ liệu [35 điểm]:
# 1. Thêm dữ liệu vào các bảng như sau [15 điểm (mỗi bảng 5 điểm)]:
# - Bảng STUDENT :
insert into student(studentId, studentName, birthday, gender, address, phoneNumeber)
values ('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
       ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
       ('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
       ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
       ('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
       ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '982654268'),
       ('S007', 'Gia Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
       ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274673'),
       ('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');
# - Bảng SUBJECT
insert into subject(subjectId, subjectName, priority)
values ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hóa', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);
# - Bảng MARK:
insert into MARK(studentId, subjectId, point)
values ('S001', 'MH01', 8.5),
       ('S001', 'MH02', 7),
       ('S001', 'MH03', 9),
       ('S001', 'MH04', 9),
       ('S001', 'MH05', 5),
       ('S002', 'MH01', 9),
       ('S002', 'MH02', 8),
       ('S002', 'MH03', 6.5),
       ('S002', 'MH04', 8),
       ('S002', 'MH05', 6),
       ('S003', 'MH01', 7.5),
       ('S003', 'MH02', 6.5),
       ('S003', 'MH03', 8),
       ('S003', 'MH04', 7),
       ('S003', 'MH05', 7),
       ('S004', 'MH01', 6),
       ('S004', 'MH02', 7),
       ('S004', 'MH03', 5),
       ('S004', 'MH04', 6.5),
       ('S004', 'MH05', 8),
       ('S005', 'MH01', 5.5),
       ('S005', 'MH02', 8),
       ('S005', 'MH03', 7.5),
       ('S005', 'MH04', 8.5),
       ('S005', 'MH05', 9),
       ('S006', 'MH01', 8),
       ('S006', 'MH02', 10),
       ('S006', 'MH03', 9),
       ('S006', 'MH04', 7.5),
       ('S006', 'MH05', 6.5),
       ('S007', 'MH01', 9.5),
       ('S007', 'MH02', 9),
       ('S007', 'MH03', 6),
       ('S007', 'MH04', 9),
       ('S007', 'MH05', 4),
       ('S008', 'MH01', 10),
       ('S008', 'MH02', 8.5),
       ('S008', 'MH03', 8.5),
       ('S008', 'MH04', 6),
       ('S008', 'MH05', 9.5),
       ('S009', 'MH01', 7.5),
       ('S009', 'MH02', 7),
       ('S009', 'MH03', 9),
       ('S009', 'MH04', 5),
       ('S009', 'MH05', 10),
       ('S010', 'MH01', 6.5),
       ('S010', 'MH02', 8),
       ('S010', 'MH03', 5.5),
       ('S010', 'MH04', 4),
       ('S010', 'MH05', 7);
# 2. Cập nhật dữ liệu [10 điểm]:
# - Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
update student
set studentName = 'Đỗ Đức Mạnh'
where studentId = 'S004';
# - Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
update subject
set subjectName = 'Ngoại Ngữ',
    priority    = 1
where subjectId = 'MH05';
# - Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,
# MH05 : 9).
update mark
set point = case subjectId
                when 'MH01' then 8.5
                when 'MH02' then 7
                when 'MH03' then 5.5
                when 'MH04' then 6
                when 'MH05' then 9
    end
where studentId = 'S009';
# 3. Xoá dữ liệu[10 điểm]:
# - Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh
# này ở bảng STUDENT.
delete
from mark
where studentId = 'S010';
delete
from student
where studentId = 'S010';
# Bài 3: Truy vấn dữ liệu [25 điểm]:
# 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
select *
from student;
# 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
select subjectName 'Tên môn học', subjectId 'Mã môn học'
from subject
where priority = 1;
# 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
# năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
select studentId                    'Mã HS',
       studentName                  'Tên HS',
       year(now()) - year(birthday) Tuổi,
       case gender
           when 0 then 'Nữ'
           when 1 then 'Nam'
           end                      'Giới tính',
       address                      'Địa chỉ'
from student;
# 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
# Toán và sắp xếp theo điểm giảm dần. [4 điểm]
select studentName, subjectName, point
from student
         join quanlydiemthi.mark m on student.studentId = m.studentId
         join quanlydiemthi.subject s on s.subjectId = m.subjectId
where subjectName = 'Toán'
order by point desc;
# 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
# [4 điểm]
select case gender
           when 1 then 'Nam'
           when 0 then 'Nữ'
    end              'Giới tính'
     , count(gender) 'Số lượng'
from student
group by gender;
# 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
# để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
select student.studentId   'Mã Học Sinh',
       student.studentName 'Tên Học Sinh',
       sum(m.point)        'Điểm tổng',
       avg(m.point)        'Điểm trung bình'
from student
         join quanlydiemthi.mark m on student.studentId = m.studentId
         join quanlydiemthi.mark m2 on student.studentId = m2.studentId
group by student.studentId, student.studentName;
# Bài 4: Tạo View, Index, Procedure [20 điểm]:
# 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
# sinh, giới tính , quê quán . [3 điểm]
create view STUDENT_VIEW as
select studentId   'Mã HS',
       studentName 'Tên HS',
       case gender
           when 1 then 'Nam'
           when 0 then 'Nữ'
           end     'Giới tính',
       address
from student;
select *
from STUDENT_VIEW;
# 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
# điểm trung bình các môn học . [3 điểm]
create view AVERAGE_MARK_VIEW as
select student.studentId 'Mã HS', student.studentName 'Tên HS', avg(point) 'Điểm TB'
from student
         join quanlydiemthi.mark m on student.studentId = m.studentId
group by student.studentId, student.studentName;
select *
from AVERAGE_MARK_VIEW;
# 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create INDEX index_phonenumber on STUDENT (phoneNumeber);
# 4. Tạo các PROCEDURE sau:
# - Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
# thông tin học sinh đó. [3 điểm]
DELIMITER $$
create procedure PROC_INSERTSTUDENT(studentID_in varchar(4), studentName_in varchar(100), birthday_in date,
                                    gender_in bit(1), address_in text, phoneNumer_in varchar(45))
begin
    insert into student(studentId, studentName, birthday, gender, address, phoneNumeber)
    values (studentID_in, studentName_in, birthday_in, gender_in, address_in, phoneNumer_in);
end$$
DELIMITER ;
call PROC_INSERTSTUDENT('SV1', 'SV', '2002-09-09', 1, 'HP', '123456');
# - Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
# [3 điểm]
DELIMITER $$
create procedure PROC_UPDATESUBJECT(subjectId_in varchar(4), subjectName_in varchar(45))
begin
    update subject set subjectName = subjectName_in where subjectId = subjectId_in;
end$$
DELIMITER ;
INSERT INTO subject (subjectId, subjectName, priority)
values ('MH06', 'GDCD', '2');
call PROC_UPDATESUBJECT('MH06', 'Giao Duc');
# - Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
# sinh. [3 điểm]
DELIMITER $$
create procedure PROC_DELETEMARK(studentId_in varchar(4))
begin
    delete from mark where studentId = studentId_in;
    delete from student where studentId = studentId_in;
end$$
DELIMITER ;
call PROC_DELETEMARK('SV1')