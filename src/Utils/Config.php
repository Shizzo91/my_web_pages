<?php

namespace App\Utils;

use PDO;

class Config
{
    public const DB_NAME = "Games";
    public const DB_USER = "root";
    public const DB_PASSWORD = "password123";
    public const DB_HOST = "db";
    public const DB_PORT = 3306;
    public const URL_PREFIX = "/";

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