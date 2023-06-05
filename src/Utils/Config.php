<?php

namespace App\Utils;

use PDO;

class Config
{
    public const DB_NAME = "Games";
    public const DB_USER = "Games";
    public const DB_PASSWORD = "ojzHT8Bl9R.q85V4";
    public const DB_HOST = "localhost";
    public const DB_PORT = 3306;
    public const URL_PREFIX = "/www/";

    public static function getPDO(string $typeOfConnection = "mysql"): PDO
    {
        $pdoString = sprintf(
            "%s:dbname=%s;port=%s;host=%s",
            $typeOfConnection,
            self::DB_NAME,
            self::DB_PORT,
            self::DB_HOST
        );
        return new PDO(
            $pdoString,
            self::DB_USER,
            self::DB_PASSWORD,
        );
    }
}