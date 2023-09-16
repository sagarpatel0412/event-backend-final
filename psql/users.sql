CREATE TABLE users(
    id uuid DEFAULT uuid_generate_v4(),
    email varchar UNIQUE NOT NULL,
    password varchar NOT NULL,
    username varchar UNIQUE NOT NULL,
    firstname varchar NOT NULL,
    lastname varchar NOT NULL,
    state varchar NOT NULL,
    city varchar NOT NULL,
    country varchar NOT NULL,
    address1 varchar NOT NULL,
    status boolean,
    address2 varchar NOT NULL,
    created_at date,
    updated_at date,
    PRIMARY KEY (id)
);

CREATE TABLE celestial_posts(
    id uuid DEFAULT uuid_generate_v4(),
    image varchar NOT NULL,
    title varchar NOT NULL,
    description varchar NOT NULL,
    metaTitle varchar NOT NULL,
    metaDescription varchar NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    user_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE celestial_post RENAME TO celestial_posts;

DROP TABLE celestial_posts;

CREATE TABLE post_likes(
    id uuid DEFAULT uuid_generate_v4(),
    email varchar NOT NULL,
    description varchar NOT NULL,
    likes boolean,
    status boolean,
    created_at date,
    updated_at date,
    post_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_celestial_posts FOREIGN KEY (post_id) REFERENCES celestial_posts(id)
);

CREATE TABLE post_comments(
    id uuid DEFAULT uuid_generate_v4(),
    email varchar NOT NULL,
    description varchar NOT NULL,
    comment varchar NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    post_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_celestial_posts_comments FOREIGN KEY (post_id) REFERENCES celestial_posts(id)
);

CREATE TABLE events(
    id uuid DEFAULT uuid_generate_v4(),
    address varchar NOT NULL,
    image varchar NOT NULL,
    description varchar NOT NULL,
    title varchar NOT NULL,
    city varchar NOT NULL,
    status boolean,
    country varchar NOT NULL,
    state varchar NOT NULL,
    contact varchar NOT NULL,
    event_date date,
    event_time time,
    created_at date,
    updated_at date,
    user_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_events FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_events(
    id uuid DEFAULT uuid_generate_v4(),
    created_at date,
    updated_at date,
    is_active boolean,
    user_id uuid,
    event_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_events_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_events_event FOREIGN KEY (event_id) REFERENCES events(id)
);

CREATE TABLE user_roles(
    id uuid DEFAULT uuid_generate_v4(),
    name varchar NOT NULL,
    value_info varchar NOT NULL,
    description varchar NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    PRIMARY KEY (id)
);

ALTER TABLE users
    ADD COLUMN user_role_id uuid;

ALTER TABLE users
    ADD CONSTRAINT fk_user_role FOREIGN KEY (user_role_id) REFERENCES user_roles(id);

ALTER TABLE post_comments
    DROP COLUMN email;

ALTER TABLE post_comments
    ADD COLUMN user_id uuid;

ALTER TABLE post_comments
    ADD CONSTRAINT fk_post_comment_user FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE post_likes
    DROP COLUMN email;

ALTER TABLE post_likes
    ADD COLUMN user_id uuid;

ALTER TABLE post_likes
    ADD CONSTRAINT fk_post_like_user FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE event_types(
    id uuid DEFAULT uuid_generate_v4(),
    name varchar NOT NULL,
    value_info varchar NOT NULL,
    description varchar NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    PRIMARY KEY (id)
);

CREATE TABLE event_sub_types(
    id uuid DEFAULT uuid_generate_v4(),
    name varchar NOT NULL,
    value_info varchar NOT NULL,
    description varchar NOT NULL,
    title varchar NOT NULL,
    meta_title varchar NOT NULL,
    meta_description varchar NOT NULL,
    image varchar NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    PRIMARY KEY (id)
);

ALTER TABLE event_sub_types
    ADD COLUMN event_types_id uuid;

ALTER TABLE event_sub_types
    ADD CONSTRAINT fk_event_types_id FOREIGN KEY (event_types_id) REFERENCES event_types(id);

ALTER TABLE events
    ADD COLUMN event_sub_types_id uuid;

ALTER TABLE events
    ADD CONSTRAINT fk_event_sub_types_id FOREIGN KEY (event_sub_types_id) REFERENCES event_sub_types(id);

CREATE TABLE event_ratings(
    id uuid DEFAULT uuid_generate_v4(),
    rating_comment text NOT NULL,
    rating_number int NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    user_id uuid,
    event_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_ratings_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_ratings_events FOREIGN KEY (event_id) REFERENCES events(id)
);

CREATE TABLE event_feedbacks(
    id uuid DEFAULT uuid_generate_v4(),
    title varchar NOT NULL,
    description text NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    user_id uuid,
    event_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_events_feedback_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_events_feedback_event FOREIGN KEY (event_id) REFERENCES events(id)
);

CREATE TABLE contact_forms(
    id uuid DEFAULT uuid_generate_v4(),
    title varchar NOT NULL,
    name varchar NOT NULL,
    email varchar NOT NULL,
    description text NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    PRIMARY KEY (id)
);

CREATE TABLE subscription_forms(
    id uuid DEFAULT uuid_generate_v4(),
    email varchar NOT NULL,
    status boolean,
    is_sent_email boolean,
    created_at date,
    updated_at date,
    PRIMARY KEY (id)
);

CREATE TABLE event_prices(
    id uuid DEFAULT uuid_generate_v4(),
    event_price varchar NOT NULL,
    discount varchar NOT NULL,
    currency_code varchar NOT NULL,
    created_at date,
    updated_at date,
    PRIMARY KEY (id)
);

ALTER TABLE event_prices
    ADD COLUMN status boolean;

ALTER TABLE events
    ADD COLUMN event_price_id uuid;

ALTER TABLE events
    ADD CONSTRAINT fk_event_prices_events FOREIGN KEY (event_price_id) REFERENCES event_prices(id);

ALTER TABLE events
    DROP COLUMN event_price_id;

ALTER TABLE event_prices
    ADD COLUMN events_id uuid;

ALTER TABLE event_prices
    ADD CONSTRAINT fk_event_prices_events FOREIGN KEY (events_id) REFERENCES events(id);

CREATE TABLE event_cities(
    id uuid DEFAULT uuid_generate_v4(),
    event_time time,
    event_date date,
    city varchar NOT NULL,
    state varchar NOT NULL,
    country varchar NOT NULL,
    address text NOT NULL,
    pincode varchar NOT NULL,
    cost varchar NOT NULL,
    currency_code varchar NOT NULL,
    terms_condition text NOT NULL,
    description text NOT NULL,
    contact varchar NOT NULL,
    longitude varchar NOT NULL,
    latitude varchar NOT NULL,
    created_at date,
    updated_at date,
    PRIMARY KEY (id),
    events_id uuid,
    CONSTRAINT fk_event_cities_events FOREIGN KEY (events_id) REFERENCES events(id)
);

ALTER TABLE event_cities
    ADD COLUMN status boolean;

CREATE TABLE event_services(
    id uuid DEFAULT uuid_generate_v4(),
    title varchar NOT NULL,
    description text NOT NULL,
    service_description text NOT NULL,
    cost varchar NOT NULL,
    city varchar NOT NULL,
    currency_code varchar NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    PRIMARY KEY (id),
    events_id uuid,
    CONSTRAINT fk_event_services_events FOREIGN KEY (events_id) REFERENCES events(id)
);

CREATE TABLE event_images(
    id uuid DEFAULT uuid_generate_v4(),
    image varchar NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    PRIMARY KEY (id),
    events_id uuid,
    CONSTRAINT fk_event_images_events FOREIGN KEY (events_id) REFERENCES events(id)
);

CREATE TABLE app_statuses(
    id uuid DEFAULT uuid_generate_v4(),
    status_number int UNIQUE NOT NULL,
    status boolean,
    value_info varchar UNIQUE NOT NULL,
    title varchar NOT NULL,
    description text NOT NULL,
    created_at date,
    updated_at date,
    PRIMARY KEY (id)
);

ALTER TABLE users
    ADD COLUMN status_id uuid;

ALTER TABLE users
    ADD CONSTRAINT fk_app_status_user FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE user_roles
    ADD COLUMN status_id uuid;

ALTER TABLE user_roles
    ADD CONSTRAINT fk_app_status_user_roles FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE celestial_posts
    ADD COLUMN status_id uuid;

ALTER TABLE celestial_posts
    ADD CONSTRAINT fk_app_status_celestial_posts FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE post_likes
    ADD COLUMN status_id uuid;

ALTER TABLE post_likes
    ADD CONSTRAINT fk_app_status_post_likes FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE post_comments
    ADD COLUMN status_id uuid;

ALTER TABLE post_comments
    ADD CONSTRAINT fk_app_status_post_comments FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE events
    ADD COLUMN status_id uuid;

ALTER TABLE events
    ADD CONSTRAINT fk_app_status_events FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE users_events
    ADD COLUMN status_id uuid;

ALTER TABLE users_events
    ADD CONSTRAINT fk_app_status_users_events FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE event_types
    ADD COLUMN status_id uuid;

ALTER TABLE event_types
    ADD CONSTRAINT fk_app_status_event_types FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE event_sub_types
    ADD COLUMN status_id uuid;

ALTER TABLE event_sub_types
    ADD CONSTRAINT fk_app_status_event_sub_types FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE event_ratings
    ADD COLUMN status_id uuid;

ALTER TABLE event_ratings
    ADD CONSTRAINT fk_app_status_event_ratings FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE event_feedbacks
    ADD COLUMN status_id uuid;

ALTER TABLE event_feedbacks
    ADD CONSTRAINT fk_app_status_event_feedbacks FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE contact_forms
    ADD COLUMN status_id uuid;

ALTER TABLE contact_forms
    ADD CONSTRAINT fk_app_status_contact_forms FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE subscription_forms
    ADD COLUMN status_id uuid;

ALTER TABLE subscription_forms
    ADD CONSTRAINT fk_app_status_subscription_forms FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE event_cities
    ADD COLUMN status_id uuid;

ALTER TABLE event_cities
    ADD CONSTRAINT fk_app_status_event_cities FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE event_prices
    ADD COLUMN status_id uuid;

ALTER TABLE event_prices
    ADD CONSTRAINT fk_app_status_event_prices FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE event_services
    ADD COLUMN status_id uuid;

ALTER TABLE event_services
    ADD CONSTRAINT fk_app_status_event_services FOREIGN KEY (status_id) REFERENCES app_statuses(id);

ALTER TABLE event_images
    ADD COLUMN status_id uuid;

ALTER TABLE event_images
    ADD CONSTRAINT fk_app_status_event_images FOREIGN KEY (status_id) REFERENCES app_statuses(id);

CREATE TABLE blog_images(
    id uuid DEFAULT uuid_generate_v4(),
    image varchar NOT NULL,
    status boolean,
    status_id uuid,
    post_id uuid,
    created_at date,
    updated_at date,
    PRIMARY KEY (id),
    CONSTRAINT fk_app_status_blog_image FOREIGN KEY (status_id) REFERENCES app_statuses(id),
    CONSTRAINT fk_app_status_paticular_blog FOREIGN KEY (post_id) REFERENCES celestial_posts(id)
);

CREATE TABLE upi_payments(
    id uuid DEFAULT uuid_generate_v4(),
    amount varchar NOT NULL,
    currency_code varchar NOT NULL,
    payment_date timestamp,
    payment_mode varchar NOT NULL,
    razorpay_payment_status boolean,
    order_id bigint NOT NULL,
    CONSTRAINT order_id_unique UNIQUE (order_id),
    razorpay_order_id varchar NOT NULL,
    user_id uuid,
    events_id uuid,
    status_id uuid,
    PRIMARY KEY (id),
    CONSTRAINT fk_upi_payment_users FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_upi_payment_events FOREIGN KEY (events_id) REFERENCES events(id),
    CONSTRAINT fk_upi_payment_app_statuses FOREIGN KEY (status_id) REFERENCES app_statuses(id)
);

ALTER TABLE upi_payments
    ADD COLUMN status boolean;

ALTER TABLE upi_payments
    ADD COLUMN created_at date;

ALTER TABLE upi_payments
    ADD COLUMN updated_at date;

ALTER TABLE upi_payments
    ADD COLUMN razorpay_customer_id varchar NOT NULL;

ALTER TABLE upi_payments
    DROP COLUMN razorpay_customer_id;

ALTER TABLE upi_payments
    ADD COLUMN razorpay_payment_id varchar NOT NULL;

ALTER TABLE upi_payments
    ADD COLUMN razorpay_invoice_id varchar;

CREATE TABLE user_teams(
    id uuid DEFAULT uuid_generate_v4(),
    user_id uuid,
    team_member_id uuid,
    created_at date,
    updated_at date,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_id_users FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_team_member_id_users FOREIGN KEY (team_member_id) REFERENCES users(id)
);

CREATE TABLE hash_tags(
    id uuid DEFAULT uuid_generate_v4(),
    name varchar NOT NULL,
    value_info varchar UNIQUE NOT NULL,
    user_id uuid,
    status_id uuid,
    status boolean,
    created_at date,
    updated_at date,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_id_hash_tags FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_status_id_hash_tags FOREIGN KEY (status_id) REFERENCES app_statuses(id)
);

ALTER TABLE hash_tags
    ADD COLUMN status boolean;

CREATE TABLE celestial_post_hash_tags(
    id uuid DEFAULT uuid_generate_v4(),
    celestial_post_id uuid,
    hash_tag_id uuid,
    status_id uuid,
    created_at date,
    updated_at date,
    CONSTRAINT fk_status_id_celestial_post_hash_tags FOREIGN KEY (status_id) REFERENCES app_statuses(id),
    CONSTRAINT fk_celestial_post_id_celestial_post_hash_tags FOREIGN KEY (celestial_post_id) REFERENCES celestial_posts(id),
    CONSTRAINT fk_hash_tag_id_celestial_post_hash_tags FOREIGN KEY (hash_tag_id) REFERENCES hash_tags(id),
    PRIMARY KEY (id)
);

ALTER TABLE celestial_post_hash_tags
    ADD COLUMN status boolean;

ALTER TABLE celestial_post_hash_tags
    ADD PRIMARY KEY (id);

CREATE TABLE events_hash_tags(
    id uuid DEFAULT uuid_generate_v4(),
    event_id uuid,
    hash_tag_id uuid,
    status_id uuid,
    status boolean,
    created_at date,
    updated_at date,
    CONSTRAINT fk_status_id_events_hash_tags FOREIGN KEY (status_id) REFERENCES app_statuses(id),
    CONSTRAINT fk_hash_tag_id_events_hash_tags FOREIGN KEY (hash_tag_id) REFERENCES hash_tags(id),
    CONSTRAINT fk_event_id_celestial_post_hash_tags FOREIGN KEY (event_id) REFERENCES events(id),
    PRIMARY KEY (id)
);

CREATE TABLE event_service_images(
    id uuid DEFAULT uuid_generate_v4(),
    image varchar NOT NULL,
    event_service_id uuid,
    status_id uuid,
    status boolean,
    created_at date,
    updated_at date,
    CONSTRAINT fk_status_id_event_service_images FOREIGN KEY (status_id) REFERENCES app_statuses(id),
    CONSTRAINT fk_event_service_images_event_services FOREIGN KEY (event_service_id) REFERENCES event_services(id),
    PRIMARY KEY (id)
);

