CREATE TABLE IF NOT EXISTS Employee (
	id SERIAL PRIMARY KEY,
	EmployeeName VARCHAR(60) not null unique,
	DepartmentName INTEGER not null,
	ChifName VARCHAR(60) not null
);