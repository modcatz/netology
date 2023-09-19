CREATE TABLE IF NOT EXISTS employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS managers (
    id SERIAL PRIMARY KEY,
    subordinate INT NOT NULL,
    manager INT NOT NULL,
    CONSTRAINT fk_sub FOREIGN KEY(subordinate) REFERENCES employees(id) ON DELETE CASCADE,
    CONSTRAINT fk_man FOREIGN KEY(manager) REFERENCES employees(id) ON DELETE CASCADE
);
    