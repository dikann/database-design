CREATE TABLE "user" (
  "id" bigint PRIMARY KEY,
  "email" varchar,
  "username" varchar,
  "password" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "created_date" timestamp,
  "modified_date" timestamp
);

CREATE TABLE "user_address" (
  "id" bigint PRIMARY KEY,
  "address_line1" varchar,
  "address_line2" varchar,
  "postal_code" varchar,
  "city" varchar,
  "country" varchar,
  "phone" varchar,
  "user_id" bigint
);

CREATE TABLE "product" (
  "id" bigint PRIMARY KEY,
  "name" varchar,
  "desc" varchar,
  "image_url" varchar,
  "sku" varchar,
  "price" decimal,
  "quantity" bigint,
  "created_date" timestamp,
  "modified_date" timestamp,
  "discount_id" bigint,
  "category_id" bigint
);

CREATE TABLE "discount" (
  "id" bigint PRIMARY KEY,
  "name" varchar,
  "desc" varchar,
  "discount_percentage" decimal,
  "active" boolean,
  "created_date" timestamp,
  "modified_date" timestamp
);

CREATE TABLE "category" (
  "id" bigint PRIMARY KEY,
  "name" varchar,
  "desc" varchar,
  "image_url" varchar,
  "created_date" timestamp,
  "modified_date" timestamp
);

CREATE TABLE "order" (
  "id" bigint PRIMARY KEY,
  "status" varchar,
  "total_discount" decimal,
  "created_date" timestamp,
  "modified_date" timestamp,
  "shopping_session_id" bigint,
  "user_address_id" bigint
);

CREATE TABLE "shopping_session" (
  "id" bigint PRIMARY KEY,
  "user_id" bigint,
  "total" decimal,
  "valid" boolean,
  "created_date" timestamp,
  "modified_date" timestamp
);

CREATE TABLE "cart_item" (
  "id" bigint PRIMARY KEY,
  "shopping_session_id" bigint,
  "product_id" bigint,
  "quantity" bigint,
  "created_date" timestamp,
  "modified_date" timestamp
);

ALTER TABLE "user_address" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "shopping_session" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "discount" ADD FOREIGN KEY ("id") REFERENCES "product" ("discount_id");

ALTER TABLE "product" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "order" ADD FOREIGN KEY ("user_address_id") REFERENCES "user_address" ("id");

ALTER TABLE "cart_item" ADD FOREIGN KEY ("shopping_session_id") REFERENCES "shopping_session" ("id");

ALTER TABLE "cart_item" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("id");

ALTER TABLE "order" ADD FOREIGN KEY ("shopping_session_id") REFERENCES "shopping_session" ("id");
