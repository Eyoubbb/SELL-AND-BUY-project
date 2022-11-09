<?php

session_name('SAB_SESSION');
session_start();

require_once 'config/config.php';

require_once 'utils/cookie.php';
require_once 'utils/routing.php';

require_once 'core/router/Router.php';