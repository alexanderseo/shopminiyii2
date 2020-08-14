/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 127.0.0.1:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 14/08/2020 09:57:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1597368906);
INSERT INTO `migration` VALUES ('m130524_201442_init', 1597368908);
INSERT INTO `migration` VALUES ('m190124_110200_add_verification_token_column_to_user_table', 1597368908);
INSERT INTO `migration` VALUES ('m200814_021055_create_products_table', 1597371966);
INSERT INTO `migration` VALUES ('m200814_021109_create_orders_table', 1597371966);
INSERT INTO `migration` VALUES ('m200814_021609_create_order_products_table', 1597372434);
INSERT INTO `migration` VALUES ('m200814_031104_product_price_not_null', 1597374921);
INSERT INTO `migration` VALUES ('m200814_040423_create_order_items_table', 1597378032);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk-order_items-order`(`order_id`) USING BTREE,
  INDEX `fk-order_items-product`(`product_id`) USING BTREE,
  CONSTRAINT `fk-order_items-order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk-order_items-product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 37, 10, 8);
INSERT INTO `order_items` VALUES (2, 6, 33, 4);
INSERT INTO `order_items` VALUES (3, 32, 15, 6);
INSERT INTO `order_items` VALUES (4, 21, 10, 2);
INSERT INTO `order_items` VALUES (5, 2, 46, 3);
INSERT INTO `order_items` VALUES (6, 31, 42, 2);
INSERT INTO `order_items` VALUES (7, 39, 51, 8);
INSERT INTO `order_items` VALUES (8, 38, 11, 9);
INSERT INTO `order_items` VALUES (9, 23, 13, 3);
INSERT INTO `order_items` VALUES (10, 14, 9, 3);
INSERT INTO `order_items` VALUES (11, 45, 2, 10);
INSERT INTO `order_items` VALUES (12, 26, 13, 6);
INSERT INTO `order_items` VALUES (13, 36, 2, 1);
INSERT INTO `order_items` VALUES (14, 4, 46, 10);
INSERT INTO `order_items` VALUES (15, 38, 28, 4);
INSERT INTO `order_items` VALUES (16, 43, 21, 5);
INSERT INTO `order_items` VALUES (17, 38, 23, 8);
INSERT INTO `order_items` VALUES (18, 20, 1, 5);
INSERT INTO `order_items` VALUES (19, 7, 13, 5);
INSERT INTO `order_items` VALUES (20, 4, 32, 5);
INSERT INTO `order_items` VALUES (21, 29, 12, 5);
INSERT INTO `order_items` VALUES (22, 11, 14, 1);
INSERT INTO `order_items` VALUES (23, 8, 32, 4);
INSERT INTO `order_items` VALUES (24, 36, 21, 6);
INSERT INTO `order_items` VALUES (25, 10, 40, 1);
INSERT INTO `order_items` VALUES (26, 41, 37, 8);
INSERT INTO `order_items` VALUES (27, 45, 27, 7);
INSERT INTO `order_items` VALUES (28, 25, 1, 6);
INSERT INTO `order_items` VALUES (29, 16, 27, 10);
INSERT INTO `order_items` VALUES (30, 37, 11, 1);
INSERT INTO `order_items` VALUES (31, 17, 21, 5);
INSERT INTO `order_items` VALUES (32, 41, 45, 8);
INSERT INTO `order_items` VALUES (33, 46, 34, 10);
INSERT INTO `order_items` VALUES (34, 11, 22, 10);
INSERT INTO `order_items` VALUES (35, 23, 47, 4);
INSERT INTO `order_items` VALUES (36, 49, 50, 9);
INSERT INTO `order_items` VALUES (37, 15, 18, 5);
INSERT INTO `order_items` VALUES (38, 8, 33, 9);
INSERT INTO `order_items` VALUES (39, 44, 35, 5);
INSERT INTO `order_items` VALUES (40, 1, 29, 10);
INSERT INTO `order_items` VALUES (41, 35, 5, 3);
INSERT INTO `order_items` VALUES (42, 20, 41, 8);
INSERT INTO `order_items` VALUES (43, 18, 41, 4);
INSERT INTO `order_items` VALUES (44, 27, 22, 9);
INSERT INTO `order_items` VALUES (45, 23, 13, 7);
INSERT INTO `order_items` VALUES (46, 16, 31, 1);
INSERT INTO `order_items` VALUES (47, 7, 3, 2);
INSERT INTO `order_items` VALUES (48, 37, 3, 9);
INSERT INTO `order_items` VALUES (49, 29, 6, 6);
INSERT INTO `order_items` VALUES (50, 38, 3, 10);
INSERT INTO `order_items` VALUES (51, 5, 40, 5);
INSERT INTO `order_items` VALUES (52, 42, 4, 5);
INSERT INTO `order_items` VALUES (53, 38, 2, 4);
INSERT INTO `order_items` VALUES (54, 4, 43, 7);
INSERT INTO `order_items` VALUES (55, 10, 5, 3);
INSERT INTO `order_items` VALUES (56, 15, 8, 1);
INSERT INTO `order_items` VALUES (57, 42, 30, 8);
INSERT INTO `order_items` VALUES (58, 11, 49, 2);
INSERT INTO `order_items` VALUES (59, 7, 32, 3);
INSERT INTO `order_items` VALUES (60, 27, 21, 4);
INSERT INTO `order_items` VALUES (61, 16, 47, 2);
INSERT INTO `order_items` VALUES (62, 23, 12, 2);
INSERT INTO `order_items` VALUES (63, 7, 42, 6);
INSERT INTO `order_items` VALUES (64, 1, 40, 6);
INSERT INTO `order_items` VALUES (65, 28, 38, 6);
INSERT INTO `order_items` VALUES (66, 33, 16, 4);
INSERT INTO `order_items` VALUES (67, 19, 46, 7);
INSERT INTO `order_items` VALUES (68, 40, 40, 4);
INSERT INTO `order_items` VALUES (69, 44, 14, 1);
INSERT INTO `order_items` VALUES (70, 11, 15, 4);
INSERT INTO `order_items` VALUES (71, 23, 13, 7);
INSERT INTO `order_items` VALUES (72, 2, 13, 10);
INSERT INTO `order_items` VALUES (73, 49, 8, 7);
INSERT INTO `order_items` VALUES (74, 12, 13, 2);
INSERT INTO `order_items` VALUES (75, 10, 40, 3);
INSERT INTO `order_items` VALUES (76, 22, 13, 2);
INSERT INTO `order_items` VALUES (77, 42, 12, 6);
INSERT INTO `order_items` VALUES (78, 27, 18, 2);
INSERT INTO `order_items` VALUES (79, 25, 18, 5);
INSERT INTO `order_items` VALUES (80, 38, 46, 1);
INSERT INTO `order_items` VALUES (81, 20, 24, 9);
INSERT INTO `order_items` VALUES (82, 34, 39, 3);
INSERT INTO `order_items` VALUES (83, 36, 14, 9);
INSERT INTO `order_items` VALUES (84, 38, 8, 5);
INSERT INTO `order_items` VALUES (85, 50, 3, 6);
INSERT INTO `order_items` VALUES (86, 13, 8, 1);
INSERT INTO `order_items` VALUES (87, 4, 15, 7);
INSERT INTO `order_items` VALUES (88, 23, 38, 6);
INSERT INTO `order_items` VALUES (89, 8, 21, 9);
INSERT INTO `order_items` VALUES (90, 6, 19, 6);
INSERT INTO `order_items` VALUES (91, 15, 10, 3);
INSERT INTO `order_items` VALUES (92, 18, 51, 1);
INSERT INTO `order_items` VALUES (93, 40, 13, 9);
INSERT INTO `order_items` VALUES (94, 27, 40, 1);
INSERT INTO `order_items` VALUES (95, 18, 6, 10);
INSERT INTO `order_items` VALUES (96, 23, 22, 3);
INSERT INTO `order_items` VALUES (97, 2, 25, 5);
INSERT INTO `order_items` VALUES (98, 7, 22, 7);
INSERT INTO `order_items` VALUES (99, 23, 13, 3);
INSERT INTO `order_items` VALUES (100, 37, 16, 8);
INSERT INTO `order_items` VALUES (101, 1, 1, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'Злата Дмитриевна Медведевaа', 0);
INSERT INTO `orders` VALUES (2, 'Ярослава Романовна Смирнова', 10);
INSERT INTO `orders` VALUES (3, 'Рожковaа Доминика Борисовна', 0);
INSERT INTO `orders` VALUES (4, 'Евсеевaа Любовь Алексеевна', 0);
INSERT INTO `orders` VALUES (5, 'Николаевa Радислав Романович', 10);
INSERT INTO `orders` VALUES (6, 'Вячеслав Львович Калашников', 0);
INSERT INTO `orders` VALUES (7, 'Гурьевa Виктор Сергеевич', 10);
INSERT INTO `orders` VALUES (8, 'Вениамин Фёдорович Поповa', 0);
INSERT INTO `orders` VALUES (9, 'Любовь Евгеньевна Кудряшовaа', 10);
INSERT INTO `orders` VALUES (10, 'Федосеевa Ростислав Борисович', 10);
INSERT INTO `orders` VALUES (11, 'Евгения Алексеевна Мухинaа', 0);
INSERT INTO `orders` VALUES (12, 'Сорокин Арсений Владимирович', 0);
INSERT INTO `orders` VALUES (13, 'Кузнецова Владлена Алексеевна', 0);
INSERT INTO `orders` VALUES (14, 'Алексей Сергеевич Иванов', 10);
INSERT INTO `orders` VALUES (15, 'Ореховa Стефан Алексеевич', 0);
INSERT INTO `orders` VALUES (16, 'Лидия Евгеньевна Князева', 0);
INSERT INTO `orders` VALUES (17, 'Аркадий Дмитриевич Мартынов', 0);
INSERT INTO `orders` VALUES (18, 'Дина Ивановна Турова', 0);
INSERT INTO `orders` VALUES (19, 'Поляковaа Вероника Максимовна', 0);
INSERT INTO `orders` VALUES (20, 'Рожкова Виктория Дмитриевна', 10);
INSERT INTO `orders` VALUES (21, 'Александр Иванович Кондратьев', 0);
INSERT INTO `orders` VALUES (22, 'Коновалов Алексей Александрович', 10);
INSERT INTO `orders` VALUES (23, 'Беспалов Витольд Борисович', 10);
INSERT INTO `orders` VALUES (24, 'Кузьма Евгеньевич Игнатовa', 0);
INSERT INTO `orders` VALUES (25, 'Вениамин Борисович Кириллов', 10);
INSERT INTO `orders` VALUES (26, 'Лилия Дмитриевна Логиновaа', 10);
INSERT INTO `orders` VALUES (27, 'Спартак Борисович Жуков', 10);
INSERT INTO `orders` VALUES (28, 'Федосеевaа Инга Ивановна', 10);
INSERT INTO `orders` VALUES (29, 'Алина Сергеевна Александрова', 0);
INSERT INTO `orders` VALUES (30, 'Красильниковa Эдуард Сергеевич', 10);
INSERT INTO `orders` VALUES (31, 'Игнат Сергеевич Крылов', 0);
INSERT INTO `orders` VALUES (32, 'Лаврентий Иванович Данилов', 0);
INSERT INTO `orders` VALUES (33, 'Антон Александрович Федосеев', 10);
INSERT INTO `orders` VALUES (34, 'Любовь Сергеевна Комиссарова', 0);
INSERT INTO `orders` VALUES (35, 'Лариса Алексеевна Матвеевaа', 10);
INSERT INTO `orders` VALUES (36, 'Владислав Евгеньевич Васильев', 10);
INSERT INTO `orders` VALUES (37, 'Ефим Дмитриевич Фроловa', 0);
INSERT INTO `orders` VALUES (38, 'Анисимовa Родион Сергеевич', 10);
INSERT INTO `orders` VALUES (39, 'Татьяна Романовна Васильевaа', 0);
INSERT INTO `orders` VALUES (40, 'Оксана Алексеевна Авдеевaа', 0);
INSERT INTO `orders` VALUES (41, 'Туровaа Эмма Романовна', 0);
INSERT INTO `orders` VALUES (42, 'Леонид Андреевич Алексеев', 10);
INSERT INTO `orders` VALUES (43, 'Гуляевa Милан Евгеньевич', 0);
INSERT INTO `orders` VALUES (44, 'Щербаковa Игорь Владимирович', 10);
INSERT INTO `orders` VALUES (45, 'Рыбаков Ярослав Борисович', 10);
INSERT INTO `orders` VALUES (46, 'Мальвина Фёдоровна Архиповaа', 10);
INSERT INTO `orders` VALUES (47, 'Никита Борисович Одинцов', 0);
INSERT INTO `orders` VALUES (48, 'Нестор Романович Орехов', 10);
INSERT INTO `orders` VALUES (49, 'Иван Александрович Титовa', 0);
INSERT INTO `orders` VALUES (50, 'Родионова Оксана Ивановна', 10);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Ex officiis itaque.', 'Possimus sapiente laborum pariatur harum. Tempora est dolores voluptas corporis alias soluta. Cupiditate et ipsum quia eum necessitatibus fugit mollitia. Tenetur aut corporis qui quo non. Enim et excepturi voluptas saepe. Adipisci ut tempore et quo. Quod libero sequi eos dignissimos. Nobis autem velit illo in. Tempora reprehenderit sunt et fuga.', 9721);
INSERT INTO `products` VALUES (2, 'Optio et voluptatibus explicabo.', 'Earum laborum repudiandae id voluptas illo. At eos ipsa pariatur nulla optio. Praesentium facere repellat ut perspiciatis consequatur aut. Fugiat nam ipsa temporibus libero omnis adipisci. Consectetur natus aliquam numquam sint et. Autem optio inventore hic sint labore. Numquam dignissimos a maxime exercitationem ut vel facere.', 6400);
INSERT INTO `products` VALUES (3, 'Similique non aut fuga.', 'Pariatur mollitia repudiandae et tempore adipisci omnis. Dolorum nisi et ut impedit dolor dolorem. Sint rerum occaecati et consequatur est qui aut. Corrupti optio velit velit sunt adipisci omnis. Consequatur commodi id eum aliquam eaque. Modi voluptatum molestiae recusandae laudantium ut eos sed. Nihil quo est tempora non iure.', 2597);
INSERT INTO `products` VALUES (4, 'Fugiat modi dolorum.', 'Ea quaerat asperiores doloribus dolorem veritatis. Dicta omnis sint autem aut autem quia. Eius tenetur doloremque tempora et nesciunt eius. Dolores commodi beatae cupiditate voluptas.', 2590);
INSERT INTO `products` VALUES (5, 'Aut deserunt sunt.', 'Ad atque ad praesentium culpa ut laudantium. Optio et ab recusandae quasi iste. Eaque enim ab eum quia neque. Quia enim ipsam qui et impedit. Sed suscipit distinctio quia commodi dolor dolorem. Ipsa minima eum molestiae consequatur eius. Fuga cum soluta consequatur harum repudiandae.', 6245);
INSERT INTO `products` VALUES (6, 'Rerum doloremque dolore.', 'Ipsa non molestiae est est. Sapiente ipsam sit praesentium vitae laborum neque. Sit rerum facere consequatur quisquam. Quia debitis autem esse officiis asperiores nisi tempore. Aut sit quisquam culpa vel rerum et qui. Velit assumenda accusantium libero accusamus molestiae inventore. Accusamus molestiae architecto molestiae qui quia alias. Laborum provident optio iure quae quisquam.', 5851);
INSERT INTO `products` VALUES (7, 'Atque itaque quia amet.', 'Rerum enim sunt aut qui odit omnis. Ipsa est et dolor quos exercitationem. Ut cupiditate consequatur voluptates delectus itaque error quia. Error omnis odit vel quisquam consequatur. Qui expedita ut ut recusandae modi voluptatum. Consequuntur quia commodi sed quasi. A est nostrum pariatur aliquid. Sed incidunt magnam eum laboriosam.', 7362);
INSERT INTO `products` VALUES (8, 'Est excepturi minus.', 'Quod quis dolores est vitae consequuntur. Rerum quaerat sit dolore quia tenetur optio amet hic. Id eius aut fugiat eligendi unde et. Sunt sequi vero quia exercitationem quam aut aut. Sunt minus velit deleniti iure exercitationem id repellat. Dicta molestiae velit qui provident ut.', 5362);
INSERT INTO `products` VALUES (9, 'Asperiores accusantium assumenda.', 'Qui est aspernatur iusto repellendus. Ipsa quos voluptas perferendis tempore dolor blanditiis. Asperiores autem sequi dolores molestiae non numquam. Incidunt vel impedit officia dolorem tenetur voluptatem. Id numquam id quos possimus rem. Perspiciatis consequatur hic et eum doloribus reprehenderit. Minus cum porro reiciendis commodi.', 5066);
INSERT INTO `products` VALUES (10, 'Iure esse commodi.', 'Nulla sequi qui itaque officiis sed nobis. Sequi est porro maxime sit dolorem sed. Repellendus sed consequatur rerum voluptatibus numquam temporibus quod. Veniam ut nobis doloribus sequi in qui dolorem.', 7192);
INSERT INTO `products` VALUES (11, 'Vero inventore consequatur.', 'Doloribus qui porro pariatur necessitatibus occaecati et. Sequi consequuntur labore quidem laborum illo modi. Sunt in et illo repellat voluptatem animi. Omnis blanditiis illum deserunt sunt tempora. Aut et voluptatem ut et. Cumque laboriosam magni sed debitis. Ut ut doloremque nobis quis. Ipsa aut excepturi sunt non pariatur. Soluta non eum ea quia aut.', 7675);
INSERT INTO `products` VALUES (12, 'Ea voluptas laborum necessitatibus.', 'Ea nam nostrum pariatur libero sapiente recusandae. Quod aut quidem ea eos sint. Iure sunt nihil reprehenderit vel. Architecto et excepturi pariatur placeat sit architecto quidem. Corporis omnis commodi veniam quasi. Quibusdam eveniet mollitia sunt corrupti aliquid excepturi animi. Provident sit possimus voluptates eius sunt ratione magni.', 7267);
INSERT INTO `products` VALUES (13, 'Aliquid nemo suscipit pariatur.', 'Consectetur consequatur quaerat temporibus. Occaecati laudantium dolore saepe debitis quia est. Quo ut et tempore. Et consequatur animi voluptate deleniti rerum voluptates ad. Inventore aliquam rerum voluptatem. Eos est fuga maiores nihil. Fugiat sed sed ex sapiente velit. Sunt accusantium enim inventore libero nam laborum. Ut earum est non dolor perferendis nihil nihil.', 5530);
INSERT INTO `products` VALUES (14, 'Excepturi autem sequi cupiditate et.', 'Reprehenderit itaque voluptatem quos ut sit nulla ipsam. Fugiat cum sint est accusamus. At molestiae in animi. Nulla delectus qui nulla veritatis autem numquam voluptatem cupiditate. Architecto corrupti blanditiis eius ratione illo porro facere tempore.', 3116);
INSERT INTO `products` VALUES (15, 'Expedita ut vel eum nisi.', 'Omnis dolores corrupti ea qui. Est eligendi consectetur sint corrupti et voluptatem. Rerum quo error qui iure assumenda. Aliquam voluptatem omnis facere harum veniam magnam. Iste ab eum quo dolor. Quasi ut laboriosam sed accusantium sed pariatur eveniet sit.', 3191);
INSERT INTO `products` VALUES (16, 'Laudantium error.', 'Est et labore itaque rerum est est quis. Quaerat sed blanditiis earum ea animi qui occaecati. Ipsum labore molestiae minus consequatur a id. Laboriosam blanditiis eum voluptas nihil unde ipsam. Voluptatem quam debitis minus ab adipisci.', 8688);
INSERT INTO `products` VALUES (17, 'Quidem fugiat itaque aut.', 'Fugit et qui et corporis ut. Commodi pariatur et porro omnis atque. Qui ducimus sapiente voluptatem voluptas. Voluptatem facilis quis suscipit amet est est. Tenetur at repellendus optio amet omnis velit laudantium. Et et dolorum molestias reprehenderit corrupti dolore sed. Id libero nostrum voluptas. Facilis distinctio placeat earum facere magni qui soluta. Reprehenderit harum id sit a quia.', 8543);
INSERT INTO `products` VALUES (18, 'Qui esse eum.', 'Quia sit rem voluptas illo eos. Ut voluptatem id voluptates delectus. Sunt eum pariatur sint odit aliquid repellendus. Voluptates cumque ut veniam quibusdam voluptas sequi enim. Qui voluptatem vero et et recusandae. Quo natus alias velit dicta exercitationem maiores et recusandae.', 8423);
INSERT INTO `products` VALUES (19, 'Et tenetur cum ullam.', 'Non omnis ex velit inventore magnam nihil. Dolorum odit animi fugiat et dolor. Quos ut numquam dignissimos eius amet delectus. Ut dolor quae odit molestias quisquam nihil. Sapiente numquam consequatur animi non. Inventore qui expedita iusto. Enim qui voluptates dolores et ut.', 2536);
INSERT INTO `products` VALUES (20, 'Ipsum aliquid ex.', 'Voluptate sint et aliquid alias asperiores voluptas accusantium. Quia ipsam maiores quasi. Hic incidunt et et et esse accusamus. Velit ratione iure natus quis ut. Eos commodi debitis praesentium distinctio suscipit magnam qui ut. Dolor excepturi assumenda qui rerum et.', 6310);
INSERT INTO `products` VALUES (21, 'Ea possimus quia.', 'Quas ut facilis nesciunt quae deleniti aut. Voluptatum qui voluptate nulla occaecati tempore autem. Illum ratione atque eum sit eveniet. Velit cumque iure soluta architecto aut. Eligendi perspiciatis omnis neque quas vitae laboriosam accusamus explicabo.', 7620);
INSERT INTO `products` VALUES (22, 'Fugit architecto odio aperiam.', 'Provident quos velit vel ducimus. Corrupti dolore fuga dicta quis sapiente sed quia veritatis. Cumque odio facilis dolorem et. Sed repellat aut et qui tenetur assumenda ipsam. Voluptas mollitia ratione nemo quos. Similique est blanditiis praesentium necessitatibus rerum et placeat. Ea eum molestiae sed ut vitae. Omnis nihil repellat qui aut nostrum.', 501);
INSERT INTO `products` VALUES (23, 'Nesciunt qui dignissimos.', 'Et velit veniam assumenda consectetur reiciendis dignissimos quasi. Reprehenderit ipsam amet iure fugit voluptatibus rerum adipisci. Ut et quod delectus necessitatibus vel. Nemo quasi ipsum dicta perspiciatis ea et fugiat. Quod cupiditate incidunt est est pariatur odio reiciendis libero. At aliquam consequuntur ea fugiat quo.', 7894);
INSERT INTO `products` VALUES (24, 'Et ipsam ut quis repellendus.', 'Nemo eos eos est in assumenda cumque consectetur repellendus. Quia vitae quia hic eum nisi id. Harum inventore quis dicta ipsa dolore aut. Vel fuga reiciendis ducimus ipsum qui. Enim laudantium ut aliquid et fugiat. Et pariatur qui omnis et maiores tenetur dolore. Nobis quidem omnis a fugit consequatur consequatur omnis.', 8704);
INSERT INTO `products` VALUES (25, 'Provident mollitia.', 'Nobis a reiciendis ab incidunt non. Earum dignissimos iure accusamus id nam. A temporibus autem deserunt velit dicta. Nesciunt minima aut molestiae dignissimos labore. Sed autem rem sapiente doloremque nihil.', 4512);
INSERT INTO `products` VALUES (26, 'Quae velit sint.', 'Eum est eos voluptas et voluptas. Maxime et neque labore. Odit voluptas qui suscipit nihil. Autem illo reiciendis quod quo quam enim. Similique aut nam blanditiis. Ab et iusto quod ab. Eveniet debitis modi dolores sunt non molestiae ipsa.', 5614);
INSERT INTO `products` VALUES (27, 'Sequi aliquam reprehenderit veritatis accusantium.', 'Aliquam tempora commodi aut cumque. Enim eveniet et accusamus repellat animi nulla magnam. Odit dolore fugiat dicta incidunt ut deserunt voluptas perspiciatis. Natus ea ut culpa. Accusantium rerum ut cum cupiditate repellat eaque. Nisi laudantium ut sapiente velit minus sit qui. Rerum necessitatibus nesciunt et dolor dolores sequi est veniam.', 5949);
INSERT INTO `products` VALUES (28, 'Et et et.', 'Occaecati eum commodi aliquam vitae voluptas recusandae. Sit officia esse totam ex. Ratione impedit alias tempore id. Nulla eum fugit magni in at delectus. Sit quia aliquid nulla ut dolorum impedit autem. Corrupti laborum optio quas blanditiis totam mollitia possimus sapiente.', 6717);
INSERT INTO `products` VALUES (29, 'Quos dolor eligendi.', 'Voluptatem ipsum in unde aut animi voluptatem qui. Iusto quia natus vero sunt eveniet. Dicta quas officiis nisi suscipit itaque. Ab vitae hic eaque est magni ea. Perspiciatis atque itaque at quis minus. Nihil maiores dolorem aut nobis est voluptatum. Et ad et ut mollitia. Explicabo provident non ut qui distinctio. Odio quaerat ea laborum illo rem laudantium debitis.', 4335);
INSERT INTO `products` VALUES (30, 'Sequi expedita dolor.', 'Perspiciatis et iusto fugiat voluptatum molestiae sint. Error cumque omnis est dolor nihil in. Rerum dolorum perferendis nulla animi quos. Non et beatae molestias. Libero nihil sapiente asperiores. Molestias impedit ut sed impedit dolorem pariatur impedit. Hic quis itaque sint vel perferendis sed beatae.', 8318);
INSERT INTO `products` VALUES (31, 'Neque omnis voluptates.', 'Minus et vitae autem eos quia reiciendis tempore. Deserunt est quod iste impedit sit qui. Provident sunt impedit qui vitae. A voluptatem necessitatibus perspiciatis fuga eveniet eum id. Nihil optio a labore sit eum. Voluptate aliquam et rem aut. Tempore odio ipsa quis culpa sit fugit nulla et.', 1008);
INSERT INTO `products` VALUES (32, 'Est optio illum ea.', 'Sed assumenda et nesciunt. Non reiciendis vel corporis rem ut. Sed sint iusto ut similique molestiae. Iusto at qui ut ullam quaerat occaecati. Ipsa vel explicabo doloremque et nesciunt occaecati cupiditate totam. Cum rerum est non sunt praesentium blanditiis explicabo.', 7677);
INSERT INTO `products` VALUES (33, 'Consectetur vero quod sint.', 'Earum et quis soluta omnis quia. Sint aut quisquam qui et sit repudiandae autem numquam. Expedita ratione et culpa. Quia odit accusamus voluptate eos. Eius illo quia nihil ut omnis dolor. Voluptatum suscipit eaque libero nesciunt.', 9323);
INSERT INTO `products` VALUES (34, 'Consequatur et eos esse.', 'Fuga sit et reprehenderit omnis ullam ex dolorem. Ratione corporis nisi vitae doloremque. Ut ea error explicabo rerum quaerat. Velit vitae quia distinctio maiores reprehenderit dolor quia autem. Aspernatur molestias molestias necessitatibus quod illo aspernatur. Mollitia dolorum tenetur nihil quia. Quo cumque delectus necessitatibus.', 1512);
INSERT INTO `products` VALUES (35, 'Veniam ea a facere sunt.', 'Impedit optio qui itaque labore minima. Alias blanditiis dignissimos qui exercitationem ducimus quae enim exercitationem. Earum minima quasi nostrum quas aut nemo. Recusandae unde mollitia eius atque sed dignissimos velit. Voluptas ullam temporibus nihil quia inventore laudantium voluptatem. Aspernatur sit at ea et enim cumque.', 5257);
INSERT INTO `products` VALUES (36, 'Impedit unde aut.', 'Animi qui omnis et. Corrupti minima cum ut maiores ipsa adipisci error. Ea officiis et ullam et asperiores aspernatur suscipit cupiditate. Quae at veritatis ea est nemo sapiente nemo. Voluptatem expedita illo sequi quia. Est cupiditate fugit saepe. Ipsum eos maxime sed est. Non facere facilis inventore similique nobis.', 2323);
INSERT INTO `products` VALUES (37, 'Iusto illo quaerat ex.', 'Dicta perspiciatis ipsum recusandae qui modi et. Rerum impedit fuga a cum deserunt qui soluta odio. Amet minima a eum aut vel omnis dolorem. Ratione voluptas quia veritatis quis consectetur sint minus. Voluptas dolorem quis qui in. Possimus omnis libero fugiat minima enim aliquid architecto explicabo.', 9403);
INSERT INTO `products` VALUES (38, 'Non nobis ea.', 'Doloribus et numquam iusto accusantium omnis. Perspiciatis perferendis nisi labore est non labore facilis. Aliquid esse aut quae explicabo voluptatem quasi quis consequuntur. Cumque maxime voluptate amet est dolores. Dolore velit tempore dolor nihil fugit beatae eligendi. Vel labore temporibus error sequi amet dolorem ullam.', 1848);
INSERT INTO `products` VALUES (39, 'Et voluptas facere.', 'Mollitia est tempore eveniet. Aliquid sunt provident expedita qui. Maiores atque est tenetur commodi. Aut doloremque similique sed sed. Aut quis dignissimos neque corporis quo blanditiis repudiandae. Enim unde et magni aliquam quia. Ab perspiciatis et sequi quos doloremque maiores facere. Quis ut natus praesentium ex.', 5478);
INSERT INTO `products` VALUES (40, 'Tempore qui.', 'Et atque ullam similique explicabo. Nemo autem sapiente quia molestiae enim ullam consequatur. Ipsum velit quidem sint. Autem est expedita aut dolor voluptatibus doloremque. Cum ipsum nam minima consequatur. Iusto molestias aut praesentium esse rerum eaque ad. Aut placeat est et. Nulla et officiis aut ipsam sit ea. Ipsam atque voluptatem et et pariatur ipsa consectetur.', 2649);
INSERT INTO `products` VALUES (41, 'Quia a delectus.', 'Dolores ea ratione est molestiae. Laborum sunt aperiam et labore non nostrum facilis. Alias earum pariatur accusamus numquam sint. Corrupti accusantium repudiandae illum nihil ea fuga autem. Assumenda quis aut et voluptas pariatur. Recusandae ut non dolore tenetur modi. Quis quis reprehenderit voluptates accusantium dolores.', 2685);
INSERT INTO `products` VALUES (42, 'Labore nulla repellendus.', 'Sit corrupti dolor temporibus nemo. Impedit quia reiciendis nihil aliquam eum. Et velit qui commodi maiores. Enim dolorem occaecati et veritatis non. Iste nam cum itaque quis. Aut libero qui perferendis sunt et aliquam et.', 3574);
INSERT INTO `products` VALUES (43, 'Quia eum ut ut sit.', 'Ducimus aperiam dolorum quibusdam. Et facilis est deleniti velit nihil molestiae praesentium. Maiores minus in et voluptas nihil nihil aut. Quia sint accusantium voluptas suscipit maiores facilis. Nihil est corrupti ratione.', 3412);
INSERT INTO `products` VALUES (44, 'Labore reiciendis quam error.', 'Labore sit facere reiciendis ex aperiam quaerat. Voluptate iusto iste fugit asperiores eum. Omnis quod dicta minima sed. Non reprehenderit ut saepe molestias. Iusto illo et eligendi odio quam qui.', 5804);
INSERT INTO `products` VALUES (45, 'Nostrum facere rerum voluptatem.', 'Non dolor unde ipsum dicta voluptatibus nesciunt natus. Et exercitationem ipsa consectetur dolorem nulla tempore totam. Rerum non labore sed non in alias qui. Aut culpa autem id qui. Iste mollitia possimus delectus eos molestiae. Omnis nulla architecto non. Laborum blanditiis sequi voluptas officiis dolore vel. Perferendis in odio velit ipsam sunt saepe id. Iste et sed minima id et beatae.', 1675);
INSERT INTO `products` VALUES (46, 'Quisquam et quis dolores.', 'Corrupti sit assumenda dolore aut voluptatum et fuga. Perspiciatis quidem iusto nobis culpa placeat repellat. Magnam dolore perferendis aliquid dolorem nihil dolore. Aspernatur est dolores totam cupiditate. Et consequatur soluta ipsum. Consequatur commodi et odit quis porro expedita saepe. Aut nihil provident sunt dolores dolores doloribus quia sit.', 4527);
INSERT INTO `products` VALUES (47, 'Veritatis dolorum natus et.', 'Et id fugit blanditiis pariatur ullam sit cupiditate. Beatae excepturi aut libero alias sit quas. Iste placeat labore sed hic ea aliquid voluptatem. Est eveniet qui tenetur voluptate similique explicabo libero dolorum.', 5462);
INSERT INTO `products` VALUES (48, 'Nihil quis quidem autem.', 'Doloribus doloribus dolores voluptate odit. Dolores voluptas aliquid ipsam et. Modi soluta ut et et sint asperiores. Quis quas sed deleniti nesciunt reiciendis. Facere laudantium sint sit repellendus est sit. Ut consequuntur atque sed eum quos consequatur. In praesentium rerum voluptate temporibus ratione ipsum fugiat.', 6198);
INSERT INTO `products` VALUES (49, 'Sit est minima reiciendis.', 'Repellat nobis necessitatibus exercitationem aut optio. Beatae vitae voluptatibus non ut debitis magnam non. Sit cumque molestiae in cumque id. Sunt in ipsa ut nam. Recusandae aut ducimus qui non. Et quas atque tenetur unde tenetur unde dolores non. Beatae dicta eligendi minima quibusdam autem. Ex aut velit ab excepturi sint.', 6925);
INSERT INTO `products` VALUES (50, 'Quia debitis possimus et.', 'Nulla eos fuga illum rerum corporis assumenda. Natus minima voluptatum earum inventore ut rerum. Modi assumenda aliquid ut consectetur quod. Iusto hic minus sapiente ad. Suscipit doloribus aut sed soluta aut animi veritatis quae. Et animi consequuntur excepturi magnam labore. Sit numquam neque voluptatem.', 4228);
INSERT INTO `products` VALUES (51, 'Officia ad accusantium ducimus.', 'Omnis quo alias numquam ea iste. Deserunt illum velit odit corporis quia natus quos praesentium. Eligendi dolorum excepturi voluptatem omnis consequatur est quaerat. Odio doloremque quis odio voluptas repellat et odio laudantium. Sit itaque officiis eum ea dolore. Sequi aut dolores consequatur voluptatem modi dignissimos.', 3189);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `password_reset_token`(`password_reset_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'LZ2KBMcSy_ruHEyPnUc9X9PKRu8YXGft', '$2y$13$NB8O7eCJmyRW256dG5fBf.BKE7TgXtPYCMt2nc8Mv6Ni2q.TZyqmG', NULL, 'mail@example.com', 10, 1597368949, 1597368968, 'szqGcJCHcnEMBjwN8GFtRtNJCG6jq75s_1597368949');

SET FOREIGN_KEY_CHECKS = 1;
