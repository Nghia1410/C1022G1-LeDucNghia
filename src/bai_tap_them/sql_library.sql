create database library;
use library;

create table category(
category_id int primary key auto_increment,
name_category varchar(50)
);
INSERT INTO category (category_id, name_category) VALUES
	(1,'Tự nhiên'),
	(2,'Xã Hội'),
	(3,'Truyện'),
	(4,'Tiểu Thuyết'),
	(5,	'Khác');

create table authors(
author_id int primary key auto_increment,
author_name varchar(50)
);
INSERT INTO authors (author_id, author_name) VALUES
	(1,'Nguyễn Thái Học'),
	(2,'Trần Mình Hoàng'),
	(3,'Dương Trung Quốc'),
	(4,'Lê Văn Hiến'),
	(5,'Hà Văn Minh');

create table students(
student_id int primary key auto_increment,
name_student varchar(50),
birthday datetime,
class_name varchar(50)
);
INSERT INTO students (student_id, name_student, birthday, class_name) VALUES
	(1, 'Nguyễn Văn A', '1999-12-12', 'C0822G1'),
	(2	,'Nguyễn Văn B', '1999-12-13', 'C0822G1'),
	(3	,'Nguyễn Văn C', '1999-12-14', 'C0822G1'),
 	(4	,'Nguyễn Văn D', '1999-12-15', 'C0922G1'),
 	(5	,'Nguyễn Văn E', '1999-12-16', 'C1022G1'); 

create table books(
book_id int primary key auto_increment,
name_book varchar(50),
page_size int,
author_id int,
category_id int,
foreign key (author_id) references authors (author_id),
foreign key (category_id) references category (category_id)
);
INSERT INTO books (book_id, name_book, page_size, author_id, category_id) VALUES
	(1,	'Toán'	,45, 1,	1),
	(2,	'Văn',	34	,2 ,2),
	(3,	'Sử', 56, 3, 2),
	(4,	'Địa', 76, 4, 2),
	(5,	'Hoá',	32,	5, 1);
create table borrow(
borrow_id int primary key auto_increment,
student_id int,
book_id int,
foreign key(student_id) references students(student_id),
foreign key(book_id) references books(book_id),
borrow_date datetime,
return_date datetime
);
INSERT INTO borrow (borrow_id, student_id, book_id, borrow_date, return_date) VALUES
	(1,	1,	1,	'2022-12-12',	'2022-12-13'),
	(2,	2,	2,	'2022-12-12',	'2022-12-15'),
	(3,	3,	3,	'2022-12-12',	'2022-12-15'),
	(4,	4,	4,	'2022-12-12',	'2022-12-12'),
	(5,	1,	5,	'2022-12-13',	'2022-12-15'),
	(6,	1,	5,	'2022-12-14',	'2022-12-14'),
	(7,	3,	4,	'2022-12-15',	'2022-12-29'),
	(8,	3,	3,	'2022-12-8',    '2022-12-14'),
	(9,	1,	2,	'2022-12-6',    '2022-12-30');
    
-- Lấy ra toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả					
set sql_safe_updates = 0;
select name_book, authors.author_name, category.name_category from books
left join authors on books.author_id = authors.author_id
left join category on books.category_id = category.category_id;

-- + Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp danh sách theo theo tên từ a->z						
select name_student from students std where std.student_id <=4 order by std.name_student;

-- + Lấy ra  2 quyển sách được mượn nhiều nhất			
	select name_book from books b order by b.name_book desc limit 2;

-- - Thông kê các đầu sách được mượn nhiều nhất			
select books.book_id, books.name_book,count(books.book_id) as sl from borrow
join books on books.book_id = borrow.book_id
group by books.book_id
having sl = (
select count(books.book_id) as sl from borrow
join books  on books.book_id = borrow.book_id
group by books.book_id
order by sl desc limit 1
);

-- - Thông kê các đầu sách chưa được mượn			
select books.name_book,count(books.book_id) as sl from borrow
join books on books.book_id = borrow.book_id
group by books.book_id
having sl = (
select count(books.book_id) as sl from borrow
join books  on books.book_id = borrow.book_id
group by books.book_id
order by sl desc limit 0
);

-- - Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp  theo số lượng mượn sách từ lớn đến nhỏ					
select name_student, count(borrow.borrow_id) as sl from students 
join borrow on students.student_id = borrow.student_id
where students.student_id <=4
group by students.name_student
order by sl desc;

-- - Lấy ra các học viên mượn sách nhiều nhất của thư viện				
select name_student, count(borrow.borrow_id) as sl from students 
join borrow on students.student_id = borrow.student_id
group by students.name_student
order by sl desc limit 2;

-- - Tao index cho cột  title của bảng books			
create index index_name_book on books(name_book);

-- - Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn					
create view list_book_borrow as select name_book, count(borrow.borrow_id) as sl from books 
join borrow on books.book_id = borrow.book_id
group by books.name_book
order by sl asc;

-- - Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN					
delimiter //
create procedure add_books(in book_id int, name_book varchar(50),in page_size int,in author_id int,in category_id int
)
begin
insert into books(book_id, name_book, page_size, author_id, category_id) values (1,'tat den',4,2,3);
end // delimiter //;


