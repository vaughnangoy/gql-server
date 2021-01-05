CREATE TABLE IF NOT EXISTS users (
  user_id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE user_profiles;
CREATE TABLE IF NOT EXISTS user_profiles (
    profile_id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id uuid DEFAULT NULL,
    first_name VARCHAR,
    last_name VARCHAR,
    contact_no VARCHAR(20)
);


INSERT INTO
  users (email)
VALUES
  ('dryves0@soundcloud.com'),
  ('avasilyev1@twitter.com'),
  ('nramel2@microsoft.com'),
  ('eflindall3@home.pl'),
  ('vanscombe4@macromedia.com'),
  ('balflat5@geocities.jp'),
  ('kwalstow6@bloglines.com'),
  ('helvey7@vinaora.com'),
  ('blangworthy8@examiner.com'),
  ('emarsham9@webnode.com');

INSERT INTO 
  user_profiles (first_name, last_name, contact_no, user_id) 
VALUES 
  ('Talia', 'Isack', '+52 123 271 8746', uuid_nil()),
  ('Alair', 'Janaud', '+62 638 286 6723', uuid_nil()),
  ('Donny', 'Haldon', '+62 506 694 2085', uuid_nil()),
  ('Vicky', 'Smidmore', '+66 263 915 2398', uuid_nil()),
  ('Dodi', 'Greenwell', '+51 430 256 2676', uuid_nil()),
  ('Nelia', 'Grenville', '+86 750 951 8531', uuid_nil()),
  ('Sayres', 'Rooson', '+1 402 931 0426', uuid_nil()),
  ('Mollie', 'Chaucer', '+595 317 651 3241', uuid_nil()),
  ('Emilio', 'Mulleary', '+30 398 507 5176', uuid_nil()),
  ('Carr', 'Kwiek', '+86 243 528 3344', uuid_nil());
  

DROP FUNCTION IF EXISTS map_users;
CREATE FUNCTION map_users() RETURNS void AS $$
  DECLARE
    row RECORD;
  BEGIN
    FOR row IN SELECT * FROM users
    LOOP
      RAISE NOTICE 'user id: %', row.user_id;
      UPDATE user_profiles SET user_id = row.user_id WHERE profile_id = (SELECT profile_id FROM user_profiles WHERE user_id = uuid_nil() LIMIT 1);
    END LOOP;
  END;
$$ LANGUAGE plpgsql;

SELECT map_users();



