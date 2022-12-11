CREATE TABLE IF NOT EXISTS bakery(
	b_id VARCHAR(10) NOT NULL,
	b_name VARCHAR(20),
	b_city VARCHAR(10),
	b_address TEXT,
	b_number VARCHAR(20),
	b_open VARCHAR(20),
	b_close VARCHAR(20),
	b_fileName1 VARCHAR(20),
	b_fileName2 VARCHAR(20),
	b_fileName3 VARCHAR(20),
	PRIMARY KEY(b_id)
)default CHARSET=utf8;
desc bakery;