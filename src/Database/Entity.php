<?php

namespace App\Database;

use App\Utils\Config;
use \PDO;

class Entity
{
    private static Entity $entity;

    private array $recipes;
    
    private array $blueprints = [];

    public static function get(): Entity
    {
        if (empty(self::$entity)) {
            self::$entity = new Entity();
        }
        
        return self::$entity;
    }



    public function __construct() {
        $this->recipes = [
            "pdo" => function() {
                return Config::getPDO();
            },
            "genre" => function() {
                return new Genre($this->make("pdo"));
            },
            "platform" => function() {
                return new Platform($this->make("pdo"));
            },
            "developerStudio" => function() {
                return new DeveloperStudio($this->make("pdo"));
            },
            "contactInformation" => function() {
                return new ContactInformation($this->make("pdo"));
            },
            "game" => function() {
                return new Game($this->make("pdo"));
            },
        ];
    }


    public function make(string $type)
    {
        if (isset($this->recipes[$type])) {
            if (!isset($this->blueprints[$type])) {
                $this->blueprints[$type] = $this->recipes[$type]();
            }
            return $this->blueprints[$type];
        }
        throw new Exception("key not exsisting", 1);
        
    }


    
}
