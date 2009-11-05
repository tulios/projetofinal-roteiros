-- Senha para quentin => test
INSERT INTO users (id, login, email, sex, birthday, city_id, crypted_password, salt, created_at, updated_at, remember_token, remember_token_expires_at) VALUES (1, 'quentin', 'quentin@example.com', 'm', '1985-10-10', 1, '00742970dc9e6319f8019fd54864d3ea740f04b1', '7e3041ebc2fc05a40c60028e2c4901a81035d3cd', '2009-08-14 22:50:44', '2009-08-19 22:50:44', NULL, NULL);

INSERT INTO roles_users (role_id, user_id) VALUES (2, 1);

-- Senha para tulios => tulios
INSERT INTO users (id, login, email, sex, birthday, city_id, crypted_password, salt, created_at, updated_at, remember_token, remember_token_expires_at) VALUES (2, 'tulios', 'ornelas.tulio@gmail.com', 'm', '1987-12-15', 2975, 'ecb752f822b97a25b15debf3c9cba77403aa4c7e', 'fe35e23b36c0b2cad05402c35045419e07793abc', '2009-09-02 08:59:33.863789', '2009-09-02 08:59:33.863789', NULL, NULL);

INSERT INTO roles_users (role_id, user_id) VALUES (2, 2);

SELECT setval('users_id_seq', 2);
