-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE appointment_settings(
  id INTEGER NOT NULL PRIMARY KEY,
  title TEXT, url TEXT, ref TEXT,
  created_at DATETIME,
  updated_at DATETIME
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP TABLE appointment_settings;
