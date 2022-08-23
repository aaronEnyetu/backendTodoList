-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS todos CASCADE;

CREATE TABLE users (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email VARCHAR NOT NULL,
  password_hash VARCHAR NOT NULL
);


CREATE TABLE todos (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id BIGINT,
  task VARCHAR NOT NULL,
  details VARCHAR,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO todos (
  task,
  details,
  created_at
)

VALUES
('Soil management', 'till the soil, raise beds', CURRENT_TIMESTAMP),
('Pest control', 'make organic pesticide, apply to affected plants', CURRENT_TIMESTAMP),
('Water plants', 'irrigate outdoor and indoor plants ', CURRENT_TIMESTAMP),
('Harvesting', 'pick ripe pears', CURRENT_TIMESTAMP)
;