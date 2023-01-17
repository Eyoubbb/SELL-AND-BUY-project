<?php

const APP_NAME = 'sell-and-buy';
const APP_BASE_URL = '/';

/*************** Assets ***************/

const PATH_JS = APP_BASE_URL . 'js/';
const PATH_CSS = APP_BASE_URL . 'css/';
const PATH_IMAGES = APP_BASE_URL . 'images/';

const PATH_FAVICON = PATH_IMAGES . 'favicon/';
const PATH_USERS = PATH_IMAGES . 'users/';
const PATH_CREATORS = PATH_IMAGES . 'creators/';
const PATH_PRODUCTS = PATH_IMAGES . 'products/';
const PATH_SOCIAL_MEDIAS = PATH_IMAGES . 'social-medias/';

/*************** App ***************/

const PATH_PUBLIC = './';
const PATH_SRC = '../src/';
const PATH_CORE = PATH_SRC . 'core/';
const PATH_CONFIG = PATH_SRC . 'config/';
const PATH_CONTROLLERS = PATH_SRC . 'controllers/';
const PATH_MODELS = PATH_SRC . 'models/';
const PATH_ENTITIES = PATH_SRC . 'entities/';
const PATH_VIEWS = PATH_SRC . 'views/';
const PATH_LANGUAGES = PATH_SRC . 'lang/';

const PATH_DAO = PATH_MODELS . 'dao/';

const PATH_COMPONENTS = PATH_VIEWS . 'components/';
const PATH_PAGES = PATH_VIEWS . 'pages/';

const PATH_FORMS = PATH_COMPONENTS . 'forms/';
const PATH_POPUPS = PATH_COMPONENTS . 'popups/';

const LANGUAGES = ['fr', 'en'];
const DEFAULT_LANGUAGE = 'fr';

const DEBUG = true;

define('DB_HOST', $_SERVER['DB_HOST']);
define('DB_NAME', $_SERVER['DB_NAME']);
define('DB_USER', $_SERVER['DB_USER']);
define('DB_PWD', $_SERVER['DB_PWD']);

/*************** Uploads ***************/

const PATH_UPLOAD_IMAGES = PATH_PUBLIC . 'images/';
const PATH_UPLOAD_PROFILE_PICTURES = PATH_UPLOAD_IMAGES . 'users/';
const PATH_UPLOAD_PRODUCT_IMAGES = PATH_UPLOAD_IMAGES . 'products/';
const PATH_UPLOAD_CREATOR_BANNERS = PATH_UPLOAD_IMAGES . 'creators/';